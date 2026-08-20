import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../chat/chat_hub.dart';
import '../database/database.dart';
import '../database/setup.dart';

class StatusModule implements RewoModule {
  @override
  String get name => 'status';

  @override
  void register(Rewo app) {
    if (!hasDatabase(app) || !app.container.isRegistered<TokenService>()) {
      return;
    }

    final tokens = app.container.resolve<TokenService>();
    final authMiddleware = [JwtMiddleware(tokens.accessJwt).handler];

    app.get('/api/status', _listStatuses, middleware: authMiddleware);
    app.post('/api/status', _createStatus, middleware: authMiddleware);
    app.post('/api/status/batch', _createStatusBatch, middleware: authMiddleware);
    app.post('/api/status/:id/view', _markViewed, middleware: authMiddleware);
    app.get('/api/status/:id/viewers', _listViewers, middleware: authMiddleware);
    app.post('/api/status/:id/delete', _deleteStatus, middleware: authMiddleware);
  }

  Future<List<Map<String, dynamic>>> _listStatuses(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final db = ctx.container.resolve<Database>();
    final statuses = await db.statuses.listActiveForViewer(userId);
    return List<Map<String, dynamic>>.from(
      statuses.map((status) => status.toJson()),
    );
  }

  Future<Map<String, dynamic>> _createStatus(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final mediaUrl = (body['media_url'] as String? ?? '').trim();
    final mediaType = (body['media_type'] as String? ?? 'image').trim();
    final caption = (body['caption'] as String?)?.trim();

    if (mediaUrl.isEmpty) {
      throw BadRequestException('media_url is required');
    }
    if (!{'image', 'video'}.contains(mediaType)) {
      throw BadRequestException('media_type must be image or video');
    }

    final db = ctx.container.resolve<Database>();
    final user = await db.users.findById(userId);
    if (user == null) throw NotFoundException('User not found');

    final status = await db.statuses.create(
      userId: userId,
      userName: user.name?.trim().isNotEmpty == true
          ? user.name!.trim()
          : user.email,
      userAvatarUrl: user.avatarUrl,
      mediaUrl: mediaUrl,
      mediaType: mediaType,
      caption: caption,
    );
    _broadcastStatusUpdated(ctx, userId);
    return status.toJson();
  }

  Future<Map<String, dynamic>> _createStatusBatch(
    RequestContext ctx,
  ) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final items = body['items'];
    if (items is! List || items.isEmpty) {
      throw BadRequestException('items must be a non-empty list');
    }

    final db = ctx.container.resolve<Database>();
    final user = await db.users.findById(userId);
    if (user == null) throw NotFoundException('User not found');
    final userName = user.name?.trim().isNotEmpty == true
        ? user.name!.trim()
        : user.email;

    final created = <Map<String, dynamic>>[];
    for (final raw in items) {
      if (raw is! Map) {
        throw BadRequestException('Each item must be an object');
      }
      final item = Map<String, dynamic>.from(raw);
      final mediaUrl = (item['media_url'] as String? ?? '').trim();
      final mediaType = (item['media_type'] as String? ?? 'image').trim();
      final caption = (item['caption'] as String?)?.trim();
      if (mediaUrl.isEmpty) {
        throw BadRequestException('media_url is required for each item');
      }
      if (!{'image', 'video'}.contains(mediaType)) {
        throw BadRequestException('media_type must be image or video');
      }
      final status = await db.statuses.create(
        userId: userId,
        userName: userName,
        userAvatarUrl: user.avatarUrl,
        mediaUrl: mediaUrl,
        mediaType: mediaType,
        caption: caption,
      );
      created.add(status.toJson());
    }

    _broadcastStatusUpdated(ctx, userId);
    return {'items': created};
  }

  Future<Map<String, dynamic>> _markViewed(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final statusId = ctx.param('id') ?? '';
    if (statusId.isEmpty) throw BadRequestException('id is required');

    final db = ctx.container.resolve<Database>();
    final status = await db.statuses.findById(statusId);
    if (status == null) throw NotFoundException('Status not found');

    await db.statuses.markViewed(statusId: statusId, viewerId: userId);
    if (status.userId != userId) {
      _broadcastStatusViewed(ctx, status.userId, statusId: statusId);
    }
    return {'ok': true};
  }

  void _broadcastStatusViewed(
    RequestContext ctx,
    String ownerUserId, {
    required String statusId,
  }) {
    if (!ctx.container.isRegistered<ChatHub>()) return;
    final hub = ctx.container.resolve<ChatHub>();
    hub.sendToUser(ownerUserId, {
      'type': 'status_viewed',
      'status_id': statusId,
    });
  }

  Future<List<Map<String, dynamic>>> _listViewers(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final statusId = ctx.param('id') ?? '';
    if (statusId.isEmpty) throw BadRequestException('id is required');

    final db = ctx.container.resolve<Database>();
    final status = await db.statuses.findById(statusId);
    if (status == null) throw NotFoundException('Status not found');
    if (status.userId != userId) {
      throw ForbiddenException('Only the status owner can list viewers');
    }

    final viewers = await db.statuses.listViewers(statusId);
    return List<Map<String, dynamic>>.from(
      viewers.map((viewer) => viewer.toJson()),
    );
  }

  Future<Map<String, dynamic>> _deleteStatus(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final statusId = ctx.param('id') ?? '';
    if (statusId.isEmpty) throw BadRequestException('id is required');

    final db = ctx.container.resolve<Database>();
    final deleted = await db.statuses.deleteOwned(
      statusId: statusId,
      userId: userId,
    );
    if (!deleted) throw NotFoundException('Status not found');
    _broadcastStatusUpdated(ctx, userId);
    return {'ok': true};
  }

  void _broadcastStatusUpdated(RequestContext ctx, String userId) {
    if (!ctx.container.isRegistered<ChatHub>()) return;
    final hub = ctx.container.resolve<ChatHub>();
    hub.broadcastStatusEvent({
      'type': 'status_updated',
      'user_id': userId,
    });
  }

  String _requireUserId(RequestContext ctx) {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');
    return userId;
  }
}
