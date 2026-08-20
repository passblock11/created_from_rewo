import 'package:postgres/postgres.dart';

import '../models/user.dart';
import 'id.dart';

class UserRepository {
  UserRepository(this._conn);

  final Connection _conn;

  static const _selectCols =
      'id, email, password_hash, name, avatar_url, created_at';

  Future<User?> findByEmail(String email) async {
    final result = await _conn.execute(
      Sql.named(
        'SELECT $_selectCols FROM users WHERE email = @email LIMIT 1',
      ),
      parameters: {'email': email},
    );
    if (result.isEmpty) return null;
    return User.fromRow(result.first);
  }

  Future<User?> findById(String id) async {
    final result = await _conn.execute(
      Sql.named(
        'SELECT $_selectCols FROM users WHERE id = @id LIMIT 1',
      ),
      parameters: {'id': id},
    );
    if (result.isEmpty) return null;
    return User.fromRow(result.first);
  }

  Future<User> create({
    required String email,
    required String passwordHash,
    String? name,
  }) async {
    final id = newId();
    final result = await _conn.execute(
      Sql.named(
        'INSERT INTO users (id, email, password_hash, name) '
        'VALUES (@id, @email, @password_hash, @name) '
        'RETURNING $_selectCols',
      ),
      parameters: {
        'id': id,
        'email': email,
        'password_hash': passwordHash,
        'name': name,
      },
    );
    return User.fromRow(result.first);
  }

  Future<User> updateProfile({
    required String id,
    String? name,
    String? avatarUrl,
  }) async {
    final result = await _conn.execute(
      Sql.named(
        'UPDATE users SET '
        'name = CASE WHEN @set_name THEN @name ELSE name END, '
        'avatar_url = CASE WHEN @set_avatar THEN @avatar_url ELSE avatar_url END '
        'WHERE id = @id '
        'RETURNING $_selectCols',
      ),
      parameters: {
        'id': id,
        'set_name': name != null,
        'name': name,
        'set_avatar': avatarUrl != null,
        'avatar_url': avatarUrl,
      },
    );
    if (result.isEmpty) {
      throw StateError('User $id not found');
    }
    return User.fromRow(result.first);
  }

  Future<List<User>> list({
    required String excludeUserId,
    String? query,
    int limit = 50,
  }) async {
    final trimmed = query?.trim();
    final hasQuery = trimmed != null && trimmed.isNotEmpty;
    final safeLimit = limit.clamp(1, 100);

    final result = await _conn.execute(
      Sql.named(
        hasQuery
            ? 'SELECT $_selectCols FROM users '
                'WHERE id != @exclude_user_id '
                'AND (email ILIKE @pattern OR COALESCE(name, \'\') ILIKE @pattern) '
                'ORDER BY created_at DESC '
                'LIMIT @limit'
            : 'SELECT $_selectCols FROM users '
                'WHERE id != @exclude_user_id '
                'ORDER BY created_at DESC '
                'LIMIT @limit',
      ),
      parameters: {
        'exclude_user_id': excludeUserId,
        if (hasQuery) 'pattern': '%$trimmed%',
        'limit': safeLimit,
      },
    );

    return result.map(User.fromRow).toList();
  }
}
