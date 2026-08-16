import 'dart:convert';
import 'dart:io';

import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../chat/chat_hub.dart';
import '../database/database.dart';
import '../database/setup.dart';

class ChatModule implements RewoModule {
  @override
  String get name => 'chat';

  @override
  void register(Rewo app) {
    if (!hasDatabase(app)) {
      app.get('/api/conversations', (_) async => {
            'error': 'Database not configured',
            'hint': 'Set DATABASE_URL in .env and run dart run bin/migrate.dart',
          });
      return;
    }

    if (!app.container.isRegistered<TokenService>()) {
      app.get('/api/conversations', (_) async => {
            'error': 'Auth module must be registered before chat',
          });
      return;
    }

    final tokens = app.container.resolve<TokenService>();
    final authMiddleware = [JwtMiddleware(tokens.accessJwt).handler];
    final hub = ChatHub();
    app.singleton<ChatHub>(hub);

    app.get('/api/conversations', _listConversations, middleware: authMiddleware);
    app.post('/api/conversations/dm', _createDm, middleware: authMiddleware);
    app.post('/api/conversations/group', _createGroup, middleware: authMiddleware);
    app.get('/api/conversations/:id', _getConversation, middleware: authMiddleware);
    app.post('/api/conversations/:id/members', _addMember, middleware: authMiddleware);
    app.get('/api/conversations/:id/messages', _listMessages, middleware: authMiddleware);
    app.post('/api/conversations/:id/messages', _sendMessage, middleware: authMiddleware);

    app.webSocket(
      '/ws/chat',
      (socket, ctx) => _onWebSocket(socket, ctx, hub),
      middleware: authMiddleware,
    );
  }

  Future<List<Map<String, dynamic>>> _listConversations(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final db = ctx.container.resolve<Database>();
    final conversations = await db.conversations.listForUser(userId);
    return List<Map<String, dynamic>>.from(
      conversations.map((c) => c.toJson()),
    );
  }

  Future<Map<String, dynamic>> _createDm(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final otherUserId = body['user_id'] as String? ?? '';
    if (otherUserId.isEmpty) {
      throw BadRequestException('user_id is required');
    }
    if (otherUserId == userId) {
      throw BadRequestException('Cannot create a DM with yourself');
    }

    final db = ctx.container.resolve<Database>();
    final otherUser = await db.users.findById(otherUserId);
    if (otherUser == null) throw NotFoundException('User not found');

    final conversation = await db.conversations.createDm(
      userA: userId,
      userB: otherUserId,
    );
    return conversation.toJson();
  }

  Future<Map<String, dynamic>> _createGroup(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final title = (body['title'] as String? ?? '').trim();
    final memberIds = (body['member_ids'] as List?)?.cast<String>() ?? [];
    if (title.isEmpty) throw BadRequestException('title is required');

    final db = ctx.container.resolve<Database>();
    for (final memberId in memberIds) {
      final user = await db.users.findById(memberId);
      if (user == null) throw NotFoundException('User $memberId not found');
    }

    final conversation = await db.conversations.createGroup(
      title: title,
      createdBy: userId,
      memberIds: memberIds,
    );
    return conversation.toJson();
  }

  Future<Map<String, dynamic>> _getConversation(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final conversationId = ctx.param('id')!;
    final db = ctx.container.resolve<Database>();
    await _requireMembership(db, conversationId, userId);

    final conversation = await db.conversations.findById(conversationId);
    if (conversation == null) throw NotFoundException('Conversation not found');

    final members = await db.conversations.listMembers(conversationId);
    return {
      ...conversation.toJson(),
      'members': members,
    };
  }

  Future<Map<String, dynamic>> _addMember(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final conversationId = ctx.param('id')!;
    final body = await ctx.jsonBody();
    final memberId = body['user_id'] as String? ?? '';
    if (memberId.isEmpty) throw BadRequestException('user_id is required');

    final db = ctx.container.resolve<Database>();
    final conversation = await db.conversations.findById(conversationId);
    if (conversation == null) throw NotFoundException('Conversation not found');
    if (conversation.type != 'group') {
      throw BadRequestException('Members can only be added to group conversations');
    }
    await _requireMembership(db, conversationId, userId);

    final user = await db.users.findById(memberId);
    if (user == null) throw NotFoundException('User not found');

    await db.conversations.addMember(
      conversationId: conversationId,
      userId: memberId,
    );
    return {'ok': true, 'user_id': memberId};
  }

  Future<List<Map<String, dynamic>>> _listMessages(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final conversationId = ctx.param('id')!;
    final db = ctx.container.resolve<Database>();
    await _requireMembership(db, conversationId, userId);

    final limit = int.tryParse(ctx.query('limit') ?? '') ?? 50;
    final beforeRaw = ctx.query('before');
    final before = beforeRaw == null ? null : DateTime.tryParse(beforeRaw);

    final messages = await db.messages.listByConversation(
      conversationId: conversationId,
      limit: limit.clamp(1, 100),
      before: before,
    );
    return List<Map<String, dynamic>>.from(
      messages.map((m) => m.toJson()),
    );
  }

  Future<Map<String, dynamic>> _sendMessage(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final conversationId = ctx.param('id')!;
    final body = await ctx.jsonBody();
    final text = (body['body'] as String? ?? '').trim();
    if (text.isEmpty) throw BadRequestException('body is required');

    final db = ctx.container.resolve<Database>();
    await _requireMembership(db, conversationId, userId);

    final message = await db.messages.create(
      conversationId: conversationId,
      senderId: userId,
      body: text,
    );

    final hub = ctx.container.resolve<ChatHub>();
    hub.broadcastMessage(message);

    return message.toJson();
  }

  void _onWebSocket(WebSocket socket, RequestContext ctx, ChatHub hub) {
    final userId = _requireUserId(ctx);
    final connection = ChatConnection(socket: socket, userId: userId);
    hub.register(connection);

    socket.listen((data) async {
      try {
        final payload = jsonDecode(data as String) as Map<String, dynamic>;
        final type = payload['type'] as String? ?? '';
        final db = ctx.container.resolve<Database>();

        switch (type) {
          case 'subscribe':
            final conversationId = payload['conversation_id'] as String? ?? '';
            if (conversationId.isEmpty) {
              _sendError(socket, 'conversation_id is required');
              return;
            }
            final isMember = await db.conversations.isMember(conversationId, userId);
            if (!isMember) {
              _sendError(socket, 'Not a member of this conversation');
              return;
            }
            hub.subscribe(connection, conversationId);
            socket.add(jsonEncode({
              'type': 'subscribed',
              'conversation_id': conversationId,
            }));
          case 'message':
            final conversationId = payload['conversation_id'] as String? ?? '';
            final text = (payload['body'] as String? ?? '').trim();
            if (conversationId.isEmpty || text.isEmpty) {
              _sendError(socket, 'conversation_id and body are required');
              return;
            }
            final isMember = await db.conversations.isMember(conversationId, userId);
            if (!isMember) {
              _sendError(socket, 'Not a member of this conversation');
              return;
            }
            hub.subscribe(connection, conversationId);
            final message = await db.messages.create(
              conversationId: conversationId,
              senderId: userId,
              body: text,
            );
            hub.broadcastMessage(message);
          default:
            _sendError(socket, 'Unknown message type: $type');
        }
      } on Object catch (e) {
        _sendError(socket, e.toString());
      }
    });
  }

  String _requireUserId(RequestContext ctx) {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');
    return userId;
  }

  Future<void> _requireMembership(
    Database db,
    String conversationId,
    String userId,
  ) async {
    final isMember = await db.conversations.isMember(conversationId, userId);
    if (!isMember) throw ForbiddenException('Not a member of this conversation');
  }

  void _sendError(WebSocket socket, String message) {
    socket.add(jsonEncode({'type': 'error', 'error': message}));
  }
}
