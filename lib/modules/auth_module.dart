import 'package:rewo/rewo.dart';

import '../auth/password.dart';
import '../auth/token_service.dart';
import '../auth/validators.dart';
import '../database/database.dart';
import '../database/setup.dart';

class AuthModule implements RewoModule {
  @override
  String get name => 'auth';

  @override
  void register(Rewo app) {
    if (!hasDatabase(app)) {
      app.post('/api/auth/signup', (_) async => {
            'error': 'Database not configured',
            'hint': 'Set DATABASE_URL in .env and run dart run bin/migrate.dart',
          });
      return;
    }

    final tokens = TokenService(secret: app.config.jwtSecret);
    app.singleton<TokenService>(tokens);

    app.post('/api/auth/signup', (ctx) => _signup(ctx, tokens));
    app.post('/api/auth/signin', (ctx) => _signin(ctx, tokens));
    app.post('/api/auth/refresh', (ctx) => _refresh(ctx, tokens));
    app.post('/api/auth/signout', (ctx) => _signout(ctx, tokens));
    app.get(
      '/api/auth/me',
      _me,
      middleware: [JwtMiddleware(tokens.accessJwt).handler],
    );
    app.patch(
      '/api/auth/me',
      (ctx) => _updateMe(ctx, tokens),
      middleware: [JwtMiddleware(tokens.accessJwt).handler],
    );
    app.get(
      '/api/users',
      _listUsers,
      middleware: [JwtMiddleware(tokens.accessJwt).handler],
    );
  }

  Future<Map<String, dynamic>> _signup(
    RequestContext ctx,
    TokenService tokens,
  ) async {
    final body = await ctx.jsonBody();
    final email = (body['email'] as String? ?? '').trim().toLowerCase();
    final password = body['password'] as String? ?? '';
    final name = (body['name'] as String? ?? '').trim();

    validateSignupCredentials(email, password);

    final db = ctx.container.resolve<Database>();
    final existing = await db.users.findByEmail(email);
    if (existing != null) {
      throw FrameworkException('Email already registered', statusCode: 409);
    }

    final user = await db.users.create(
      email: email,
      passwordHash: hashPassword(password),
      name: name.isEmpty ? null : name,
    );

    final auth = await tokens.issueTokens(
      db: db,
      userId: user.id,
      email: user.email,
    );

    return {
      'user': {
        'id': user.id,
        'email': user.email,
        'name': user.name,
      },
      ...auth.toJson(),
    };
  }

  Future<Map<String, dynamic>> _signin(
    RequestContext ctx,
    TokenService tokens,
  ) async {
    final body = await ctx.jsonBody();
    final email = (body['email'] as String? ?? '').trim().toLowerCase();
    final password = body['password'] as String? ?? '';

    validateSigninCredentials(email, password);

    final db = ctx.container.resolve<Database>();
    final user = await db.users.findByEmail(email);
    if (user == null) {
      throw UnauthorizedException('Invalid email or password');
    }

    if (!verifyPassword(password, user.passwordHash)) {
      throw UnauthorizedException('Invalid email or password');
    }

    final auth = await tokens.issueTokens(
      db: db,
      userId: user.id,
      email: user.email,
    );

    return {
      'user': {
        'id': user.id,
        'email': user.email,
        'name': user.name,
      },
      ...auth.toJson(),
    };
  }

  Future<Map<String, dynamic>> _refresh(
    RequestContext ctx,
    TokenService tokens,
  ) async {
    final body = await ctx.jsonBody();
    final refreshToken =
        body['refresh_token'] as String? ?? body['refreshToken'] as String? ?? '';
    if (refreshToken.isEmpty) {
      throw BadRequestException('refresh_token is required');
    }

    final db = ctx.container.resolve<Database>();
    final auth = await tokens.refresh(db: db, refreshToken: refreshToken);
    return auth.toJson();
  }

  Future<Map<String, dynamic>> _signout(
    RequestContext ctx,
    TokenService tokens,
  ) async {
    final body = await ctx.jsonBody();
    final refreshToken = body['refresh_token'] as String?;
    if (refreshToken != null && refreshToken.isNotEmpty) {
      final db = ctx.container.resolve<Database>();
      await tokens.revokeRefreshToken(db, refreshToken);
    }
    return {'ok': true};
  }

  Future<Map<String, dynamic>> _me(RequestContext ctx) async {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');

    final db = ctx.container.resolve<Database>();
    final user = await db.users.findById(userId);
    if (user == null) throw NotFoundException('User not found');

    return user.toJson();
  }

  Future<Map<String, dynamic>> _updateMe(
    RequestContext ctx,
    TokenService tokens,
  ) async {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');

    final body = await ctx.jsonBody();
    final name = (body['name'] as String?)?.trim();

    final db = ctx.container.resolve<Database>();
    final user = await db.users.updateProfile(
      id: userId,
      name: name == null || name.isEmpty ? null : name,
    );
    return user.toJson();
  }

  Future<List<Map<String, dynamic>>> _listUsers(RequestContext ctx) async {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');

    final query = ctx.query('q');
    final limit = int.tryParse(ctx.query('limit') ?? '') ?? 50;

    final db = ctx.container.resolve<Database>();
    final users = await db.users.list(
      excludeUserId: userId,
      query: query,
      limit: limit,
    );

    return List<Map<String, dynamic>>.from(
      users.map((user) => user.toJson()),
    );
  }
}
