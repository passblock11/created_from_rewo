import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:rewo/rewo.dart';

import '../database/database.dart';

/// Issues and verifies access + refresh JWT pairs.
class TokenService {
  TokenService({
    required String secret,
    this.accessTtl = const Duration(minutes: 15),
    this.refreshTtl = const Duration(days: 30),
  })  : _accessJwt = JwtService(secret: secret, expiry: accessTtl),
        _refreshJwt = JwtService(secret: '${secret}_refresh', expiry: refreshTtl);

  final Duration accessTtl;
  final Duration refreshTtl;
  final JwtService _accessJwt;
  final JwtService _refreshJwt;

  JwtService get accessJwt => _accessJwt;

  Future<AuthTokens> issueTokens({
    required Database db,
    required String userId,
    required String email,
    List<String> roles = const ['user'],
  }) async {
    final expiresAt = DateTime.now().add(refreshTtl).toUtc();

    final row = await db.refreshTokens.create(
      userId: userId,
      tokenHash: '',
      expiresAt: expiresAt,
    );

    final refreshToken = _refreshJwt.sign({
      'sub': userId,
      'jti': row.id,
      'type': 'refresh',
    });

    await db.refreshTokens.updateTokenHash(
      id: row.id,
      tokenHash: _hashToken(refreshToken),
    );

    final accessToken = _accessJwt.sign({
      'sub': userId,
      'email': email,
      'roles': roles,
      'type': 'access',
    });

    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: accessTtl.inSeconds,
    );
  }

  Future<AuthTokens> refresh({
    required Database db,
    required String refreshToken,
  }) async {
    final payload = _refreshJwt.verify(refreshToken);
    if (payload['type'] != 'refresh') {
      throw UnauthorizedException('Invalid refresh token');
    }

    final userId = payload['sub'] as String?;
    final tokenId = payload['jti'] as String?;
    if (userId == null || tokenId == null) {
      throw UnauthorizedException('Invalid refresh token payload');
    }

    final row = await db.refreshTokens.findByIdAndUserId(
      id: tokenId,
      userId: userId,
    );
    if (row == null) throw UnauthorizedException('Refresh token not found');

    if (row.revokedAt != null) {
      throw UnauthorizedException('Refresh token revoked');
    }

    if (row.tokenHash != _hashToken(refreshToken)) {
      throw UnauthorizedException('Refresh token mismatch');
    }

    await db.refreshTokens.revoke(tokenId);

    final email = row.user?.email;
    if (email == null) throw UnauthorizedException('User not found');

    return issueTokens(
      db: db,
      userId: userId,
      email: email,
    );
  }

  String _hashToken(String token) {
    return sha256.convert(utf8.encode(token)).toString();
  }

  Future<void> revokeRefreshToken(
    Database db,
    String refreshToken,
  ) async {
    try {
      final payload = _refreshJwt.verify(refreshToken);
      final tokenId = payload['jti'] as String?;
      if (tokenId == null) return;
      await db.refreshTokens.revoke(tokenId);
    } on Object {
      // Ignore invalid tokens on logout.
    }
  }
}

class AuthTokens {
  AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'token_type': 'Bearer',
        'expires_in': expiresIn,
      };
}
