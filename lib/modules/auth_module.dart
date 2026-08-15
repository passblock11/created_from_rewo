import 'package:rewo/rewo.dart';

import '../auth/password.dart';
import '../auth/token_service.dart';
import '../auth/validators.dart';
import '../database/setup.dart';
import '../generated/index.dart';

class AuthModule implements RewoModule {
  @override
  String get name => 'auth';

  @override
  void register(Rewo app) {
    if (!hasPrisma(app)) {
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

    final prisma = ctx.container.resolve<PrismaClient>();
    final existing = await prisma.user.findUnique(
      where: UserWhereUniqueInput(email: email),
    );
    if (existing != null) {
      throw FrameworkException('Email already registered', statusCode: 409);
    }

    final user = await prisma.user.create(
      data: CreateUserInput(
        email: email,
        passwordHash: hashPassword(password),
        name: name.isEmpty ? null : name,
      ),
    );

    final auth = await tokens.issueTokens(
      prisma: prisma,
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

    final prisma = ctx.container.resolve<PrismaClient>();
    final user = await prisma.user.findUnique(
      where: UserWhereUniqueInput(email: email),
    );
    if (user == null) {
      throw UnauthorizedException('Invalid email or password');
    }

    if (!verifyPassword(password, user.passwordHash)) {
      throw UnauthorizedException('Invalid email or password');
    }

    final auth = await tokens.issueTokens(
      prisma: prisma,
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

    final prisma = ctx.container.resolve<PrismaClient>();
    final auth = await tokens.refresh(prisma: prisma, refreshToken: refreshToken);
    return auth.toJson();
  }

  Future<Map<String, dynamic>> _signout(
    RequestContext ctx,
    TokenService tokens,
  ) async {
    final body = await ctx.jsonBody();
    final refreshToken = body['refresh_token'] as String?;
    if (refreshToken != null && refreshToken.isNotEmpty) {
      final prisma = ctx.container.resolve<PrismaClient>();
      await tokens.revokeRefreshToken(prisma, refreshToken);
    }
    return {'ok': true};
  }

  Future<Map<String, dynamic>> _me(RequestContext ctx) async {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');

    final prisma = ctx.container.resolve<PrismaClient>();
    final user = await prisma.user.findUnique(
      where: UserWhereUniqueInput(id: userId),
    );
    if (user == null) throw NotFoundException('User not found');

    return {
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'created_at': user.createdAt.toIso8601String(),
    };
  }
}
