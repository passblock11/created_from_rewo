import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../database/database.dart';
import '../database/setup.dart';

class E2eeModule implements RewoModule {
  @override
  String get name => 'e2ee';

  @override
  void register(Rewo app) {
    if (!hasDatabase(app) || !app.container.isRegistered<TokenService>()) {
      return;
    }

    final tokens = app.container.resolve<TokenService>();
    final authMiddleware = [JwtMiddleware(tokens.accessJwt).handler];

    app.put('/api/e2ee/keys', _upsertKey, middleware: authMiddleware);
    app.get('/api/e2ee/keys/:userId', _getKey, middleware: authMiddleware);
  }

  Future<Map<String, dynamic>> _upsertKey(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final publicKey = (body['public_key'] as String? ?? '').trim();
    if (publicKey.isEmpty) {
      throw BadRequestException('public_key is required');
    }
    if (publicKey.length > 512) {
      throw BadRequestException('public_key is too long');
    }

    final db = ctx.container.resolve<Database>();
    await db.e2eeKeys.upsert(userId: userId, publicKey: publicKey);
    return {'ok': true};
  }

  Future<Map<String, dynamic>> _getKey(RequestContext ctx) async {
    _requireUserId(ctx);
    final targetUserId = ctx.param('userId') ?? '';
    if (targetUserId.isEmpty) {
      throw BadRequestException('userId is required');
    }

    final db = ctx.container.resolve<Database>();
    final publicKey = await db.e2eeKeys.getPublicKey(targetUserId);
    if (publicKey == null) {
      throw NotFoundException('E2EE public key not found');
    }
    return {
      'user_id': targetUserId,
      'public_key': publicKey,
    };
  }

  String _requireUserId(RequestContext ctx) {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');
    return userId;
  }
}
