import 'package:postgres/postgres.dart';

import '../models/refresh_token.dart';
import '../models/user.dart';
import 'id.dart';

class RefreshTokenRepository {
  RefreshTokenRepository(this._conn);

  final Connection _conn;

  Future<RefreshToken> create({
    required String userId,
    required String tokenHash,
    required DateTime expiresAt,
  }) async {
    final id = newId();
    final result = await _conn.execute(
      Sql.named(
        'INSERT INTO refresh_tokens (id, user_id, token_hash, expires_at) '
        'VALUES (@id, @user_id, @token_hash, @expires_at) '
        'RETURNING id, user_id, token_hash, expires_at, revoked_at, created_at',
      ),
      parameters: {
        'id': id,
        'user_id': userId,
        'token_hash': tokenHash,
        'expires_at': expiresAt,
      },
    );
    return RefreshToken.fromRow(result.first);
  }

  Future<void> updateTokenHash({
    required String id,
    required String tokenHash,
  }) async {
    await _conn.execute(
      Sql.named(
        'UPDATE refresh_tokens SET token_hash = @token_hash WHERE id = @id',
      ),
      parameters: {'id': id, 'token_hash': tokenHash},
    );
  }

  Future<void> revoke(String id) async {
    await _conn.execute(
      Sql.named(
        'UPDATE refresh_tokens SET revoked_at = NOW() WHERE id = @id',
      ),
      parameters: {'id': id},
    );
  }

  Future<RefreshToken?> findByIdAndUserId({
    required String id,
    required String userId,
  }) async {
    final result = await _conn.execute(
      Sql.named(
        'SELECT rt.id, rt.user_id, rt.token_hash, rt.expires_at, '
        'rt.revoked_at, rt.created_at, '
        'u.id, u.email, u.password_hash, u.name, u.created_at '
        'FROM refresh_tokens rt '
        'JOIN users u ON u.id = rt.user_id '
        'WHERE rt.id = @id AND rt.user_id = @user_id '
        'LIMIT 1',
      ),
      parameters: {'id': id, 'user_id': userId},
    );
    if (result.isEmpty) return null;

    final row = result.first;
    final user = User.fromRow(row.sublist(6));
    return RefreshToken.fromRow(row.sublist(0, 6), user: user);
  }
}
