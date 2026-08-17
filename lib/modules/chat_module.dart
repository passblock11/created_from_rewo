import 'dart:convert';
import 'dart:io';

import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../chat/chat_hub.dart';
import '../database/database.dart';
import '../database/setup.dart';
import '../models/message.dart';
import '../services/fcm_push_service.dart';
import '../utils/message_preview.dart';

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
    app.post('/api/messages/:id/poll/vote', _votePoll, middleware: authMiddleware);
    app.post('/api/messages/:id/event/rsvp', _rsvpEvent, middleware: authMiddleware);

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

    final db = ctx.container.resolve<Database>();
    await _requireMembership(db, conversationId, userId);

    final message = await _createMessageFromPayload(
      db: db,
      conversationId: conversationId,
      senderId: userId,
      payload: body,
    );

    final hub = ctx.container.resolve<ChatHub>();
    await _deliverMessage(
      container: ctx.container,
      db: db,
      hub: hub,
      message: message,
    );

    return message.toJson();
  }

  Future<Map<String, dynamic>> _votePoll(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final messageId = ctx.param('id')!;
    final body = await ctx.jsonBody();
    final optionIndex = body['option_index'];
    if (optionIndex is! int) {
      throw BadRequestException('option_index is required');
    }

    final db = ctx.container.resolve<Database>();
    final existing = await db.messages.findById(messageId);
    if (existing == null) throw NotFoundException('Message not found');
    if (existing.messageType != 'poll') {
      throw BadRequestException('Message is not a poll');
    }
    await _requireMembership(db, existing.conversationId, userId);

    final metadata = Map<String, dynamic>.from(existing.metadata);
    final options = (metadata['options'] as List?)?.cast<String>() ?? [];
    if (optionIndex < 0 || optionIndex >= options.length) {
      throw BadRequestException('Invalid option_index');
    }

    final votes = Map<String, dynamic>.from(
      metadata['votes'] as Map? ?? {},
    );
    final allowMultiple = metadata['allow_multiple'] == true;
    if (allowMultiple) {
      final current = (votes[userId] as List?)?.cast<int>() ?? [];
      if (!current.contains(optionIndex)) {
        votes[userId] = [...current, optionIndex];
      }
    } else {
      votes[userId] = optionIndex;
    }
    metadata['votes'] = votes;

    final updated = await db.messages.updateMetadata(
      id: messageId,
      metadata: metadata,
    );
    if (updated == null) throw NotFoundException('Message not found');

    final hub = ctx.container.resolve<ChatHub>();
    hub.broadcastMessageUpdate(updated);
    return updated.toJson();
  }

  Future<Map<String, dynamic>> _rsvpEvent(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final messageId = ctx.param('id')!;
    final body = await ctx.jsonBody();
    final status = (body['status'] as String? ?? '').trim().toLowerCase();
    if (!{'accepted', 'declined', 'tentative'}.contains(status)) {
      throw BadRequestException('status must be accepted, declined, or tentative');
    }

    final db = ctx.container.resolve<Database>();
    final existing = await db.messages.findById(messageId);
    if (existing == null) throw NotFoundException('Message not found');
    if (existing.messageType != 'event') {
      throw BadRequestException('Message is not an event');
    }
    await _requireMembership(db, existing.conversationId, userId);

    final metadata = Map<String, dynamic>.from(existing.metadata);
    final rsvps = Map<String, dynamic>.from(
      metadata['rsvps'] as Map? ?? {},
    );
    rsvps[userId] = status;
    metadata['rsvps'] = rsvps;

    final updated = await db.messages.updateMetadata(
      id: messageId,
      metadata: metadata,
    );
    if (updated == null) throw NotFoundException('Message not found');

    final hub = ctx.container.resolve<ChatHub>();
    hub.broadcastMessageUpdate(updated);
    return updated.toJson();
  }

  Future<Message> _createMessageFromPayload({
    required Database db,
    required String conversationId,
    required String senderId,
    required Map<String, dynamic> payload,
  }) async {
    final messageType = (payload['message_type'] as String? ?? 'text').trim();
    if (!isSupportedMessageType(messageType)) {
      throw BadRequestException('Unsupported message_type: $messageType');
    }

    final metadataRaw = payload['metadata'];
    final metadata = metadataRaw is Map
        ? Map<String, dynamic>.from(metadataRaw)
        : <String, dynamic>{};

    var text = (payload['body'] as String? ?? '').trim();
    if (messageType == 'text') {
      if (text.isEmpty) throw BadRequestException('body is required');
    } else {
      _validateMetadata(messageType, metadata);
      if (text.isEmpty) {
        text = previewForMessageType(messageType, metadata);
      }
      if (messageType == 'poll') {
        metadata.putIfAbsent('votes', () => <String, dynamic>{});
      }
      if (messageType == 'event') {
        metadata.putIfAbsent('rsvps', () => <String, dynamic>{});
      }
    }

    return db.messages.create(
      conversationId: conversationId,
      senderId: senderId,
      body: text,
      messageType: messageType,
      metadata: metadata,
    );
  }

  void _validateMetadata(String type, Map<String, dynamic> metadata) {
    switch (type) {
      case 'image':
      case 'video':
      case 'audio':
      case 'document':
        if ((metadata['url'] as String? ?? '').isEmpty) {
          throw BadRequestException('metadata.url is required');
        }
      case 'sticker':
        if ((metadata['sticker_id'] as String? ?? '').isEmpty &&
            (metadata['emoji'] as String? ?? '').isEmpty) {
          throw BadRequestException('sticker_id or emoji is required');
        }
      case 'location':
        if (metadata['latitude'] == null || metadata['longitude'] == null) {
          throw BadRequestException('latitude and longitude are required');
        }
      case 'contact':
        if ((metadata['name'] as String? ?? '').isEmpty) {
          throw BadRequestException('contact name is required');
        }
      case 'poll':
        final options = (metadata['options'] as List?)?.cast<String>() ?? [];
        if ((metadata['question'] as String? ?? '').trim().isEmpty ||
            options.length < 2) {
          throw BadRequestException('poll requires question and at least 2 options');
        }
      case 'event':
        if ((metadata['title'] as String? ?? '').trim().isEmpty ||
            (metadata['start_at'] as String? ?? '').trim().isEmpty) {
          throw BadRequestException('event requires title and start_at');
        }
      default:
        break;
    }
  }

  Future<void> _deliverMessage({
    required ServiceContainer container,
    required Database db,
    required ChatHub hub,
    required Message message,
  }) async {
    hub.broadcastMessage(message, excludeSocketUserId: message.senderId);
    await _notifyMessagePush(
      container: container,
      db: db,
      hub: hub,
      message: message,
    );
  }

  Future<void> _notifyMessagePush({
    required ServiceContainer container,
    required Database db,
    required ChatHub hub,
    required Message message,
  }) async {
    if (!container.isRegistered<FcmPushService>()) return;

    final push = container.resolve<FcmPushService>();
    final conversation = await db.conversations.findById(message.conversationId);
    if (conversation == null) return;

    final senderName = message.senderName?.trim().isNotEmpty == true
        ? message.senderName!.trim()
        : (message.senderEmail?.trim().isNotEmpty == true
            ? message.senderEmail!.trim()
            : 'Someone');

    final conversationTitle = conversation.type == 'group'
        ? (conversation.title?.trim().isNotEmpty == true
            ? conversation.title!.trim()
            : 'Group')
        : senderName;

    final members = await db.conversations.listMembers(message.conversationId);
    for (final member in members) {
      final memberId = member['id'] as String;
      if (memberId == message.senderId) continue;

      final devices = await db.deviceTokens.listForUser(memberId);
      for (final device in devices) {
        await push.sendChatMessage(
          deviceToken: device.token,
          data: {
            'type': 'chat_message',
            'conversation_id': message.conversationId,
            'message_id': message.id,
            'sender_id': message.senderId,
            'sender_name': senderName,
            'body': message.body,
            'conversation_type': conversation.type,
            'conversation_title': conversationTitle,
          },
        );
      }
    }
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

        if (type == 'subscribe') {
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
          return;
        }

        if (type == 'unsubscribe') {
          final conversationId = payload['conversation_id'] as String? ?? '';
          if (conversationId.isEmpty) {
            _sendError(socket, 'conversation_id is required');
            return;
          }
          hub.unsubscribe(connection, conversationId);
          socket.add(jsonEncode({
            'type': 'unsubscribed',
            'conversation_id': conversationId,
          }));
          return;
        }

        if (type == 'message') {
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
          final message = await _createMessageFromPayload(
            db: db,
            conversationId: conversationId,
            senderId: userId,
            payload: payload,
          );
          socket.add(jsonEncode({
            'type': 'message',
            'message': message.toJson(),
          }));
          await _deliverMessage(
            container: ctx.container,
            db: db,
            hub: hub,
            message: message,
          );
          return;
        }

        if (type.startsWith('call_')) {
          await _relayCallSignal(
            container: ctx.container,
            db: db,
            hub: hub,
            fromUserId: userId,
            payload: payload,
            type: type,
          );
          return;
        }

        _sendError(socket, 'Unknown message type: $type');
      } on Object catch (e) {
        _sendError(socket, e.toString());
      }
    });
  }

  Future<void> _relayCallSignal({
    required ServiceContainer container,
    required Database db,
    required ChatHub hub,
    required String fromUserId,
    required Map<String, dynamic> payload,
    required String type,
  }) async {
    final toUserId = payload['to_user_id'] as String? ?? '';
    final conversationId = payload['conversation_id'] as String? ?? '';
    if (toUserId.isEmpty || conversationId.isEmpty) {
      throw BadRequestException('to_user_id and conversation_id are required');
    }

    await _requireMembership(db, conversationId, fromUserId);
    await _requireMembership(db, conversationId, toUserId);

    hub.sendToUser(toUserId, {
      ...payload,
      'type': type,
      'from_user_id': fromUserId,
    });

    if (type == 'call_invite' || type == 'call_end' || type == 'call_reject') {
      await _notifyCallPush(
        container: container,
        db: db,
        toUserId: toUserId,
        fromUserId: fromUserId,
        type: type,
        payload: payload,
      );
    }
  }

  Future<void> _notifyCallPush({
    required ServiceContainer container,
    required Database db,
    required String toUserId,
    required String fromUserId,
    required String type,
    required Map<String, dynamic> payload,
  }) async {
    if (!container.isRegistered<FcmPushService>()) return;

    final push = container.resolve<FcmPushService>();
    final devices = await db.deviceTokens.listForUser(toUserId);
    if (devices.isEmpty) return;

    final callId = '${payload['call_id'] ?? ''}';
    if (callId.isEmpty) return;

    for (final device in devices) {
      if (type == 'call_invite') {
        await push.sendIncomingCall(
          deviceToken: device.token,
          data: {
            'type': 'call_invite',
            'call_id': callId,
            'conversation_id': '${payload['conversation_id']}',
            'from_user_id': fromUserId,
            'from_name': '${payload['from_name'] ?? 'Someone'}',
            'call_mode': '${payload['call_mode'] ?? 'audio'}',
          },
        );
      } else {
        await push.sendCallCancelled(
          deviceToken: device.token,
          callId: callId,
        );
      }
    }
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
