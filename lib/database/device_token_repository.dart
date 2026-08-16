import 'package:postgres/postgres.dart';

import 'id.dart';

class DevicePushToken {
  const DevicePushToken({
    required this.id,
    required this.userId,
    required this.token,
    required this.platform,
  });

  final String id;
  final String userId;
  final String token;
  final String platform;
}

class DeviceTokenRepository {
  DeviceTokenRepository(this._conn);

  final Connection _conn;

  Future<void> upsert({
    required String userId,
    required String token,
    required String platform,
  }) async {
    final id = newId();
    await _conn.execute(
      Sql.named(
        'INSERT INTO device_push_tokens (id, user_id, token, platform, updated_at) '
        'VALUES (@id, @user_id, @token, @platform, NOW()) '
        'ON CONFLICT (user_id, token) DO UPDATE SET '
        'platform = EXCLUDED.platform, updated_at = NOW()',
      ),
      parameters: {
        'id': id,
        'user_id': userId,
        'token': token,
        'platform': platform,
      },
    );
  }

  Future<void> delete({required String userId, required String token}) async {
    await _conn.execute(
      Sql.named(
        'DELETE FROM device_push_tokens WHERE user_id = @user_id AND token = @token',
      ),
      parameters: {'user_id': userId, 'token': token},
    );
  }

  Future<List<DevicePushToken>> listForUser(String userId) async {
    final result = await _conn.execute(
      Sql.named(
        'SELECT id, user_id, token, platform '
        'FROM device_push_tokens WHERE user_id = @user_id',
      ),
      parameters: {'user_id': userId},
    );
    return result
        .map(
          (row) => DevicePushToken(
            id: row[0] as String,
            userId: row[1] as String,
            token: row[2] as String,
            platform: row[3] as String,
          ),
        )
        .toList();
  }
}
