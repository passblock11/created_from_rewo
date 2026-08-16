import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../database/database.dart';
import '../database/setup.dart';
import '../services/fcm_push_service.dart';

class PushModule implements RewoModule {
  @override
  String get name => 'push';

  @override
  void register(Rewo app) {
    final pushService = tryCreateFcmPushServiceFromEnv();
    if (pushService != null) {
      app.singleton<FcmPushService>(pushService);
    }

    if (!hasDatabase(app)) {
      app.post('/api/push/register', (_) async => {
            'error': 'Database not configured',
          });
      return;
    }

    if (!app.container.isRegistered<TokenService>()) {
      app.post('/api/push/register', (_) async => {
            'error': 'Auth module must be registered before push',
          });
      return;
    }

    final tokens = app.container.resolve<TokenService>();
    final authMiddleware = [JwtMiddleware(tokens.accessJwt).handler];

    app.post('/api/push/register', _register, middleware: authMiddleware);
    app.post('/api/push/unregister', _unregister, middleware: authMiddleware);
  }

  Future<Map<String, dynamic>> _register(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final token = (body['token'] as String? ?? '').trim();
    final platform = (body['platform'] as String? ?? '').trim().toLowerCase();
    if (token.isEmpty) throw BadRequestException('token is required');
    if (platform != 'android' && platform != 'ios') {
      throw BadRequestException('platform must be android or ios');
    }

    final db = ctx.container.resolve<Database>();
    await db.deviceTokens.upsert(
      userId: userId,
      token: token,
      platform: platform,
    );
    return {'ok': true};
  }

  Future<Map<String, dynamic>> _unregister(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final token = (body['token'] as String? ?? '').trim();
    if (token.isEmpty) throw BadRequestException('token is required');

    final db = ctx.container.resolve<Database>();
    await db.deviceTokens.delete(userId: userId, token: token);
    return {'ok': true};
  }

  String _requireUserId(RequestContext ctx) {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');
    return userId;
  }
}
