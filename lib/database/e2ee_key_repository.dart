import 'package:postgres/postgres.dart';

class E2eeKeyRepository {
  E2eeKeyRepository(this._conn);

  final Connection _conn;

  Future<void> upsert({
    required String userId,
    required String publicKey,
  }) async {
    await _conn.execute(
      Sql.named('''
        INSERT INTO user_e2ee_keys (user_id, public_key, updated_at)
        VALUES (@userId, @publicKey, NOW())
        ON CONFLICT (user_id) DO UPDATE
        SET public_key = EXCLUDED.public_key,
            updated_at = NOW()
      '''),
      parameters: {
        'userId': userId,
        'publicKey': publicKey,
      },
    );
  }

  Future<String?> getPublicKey(String userId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT public_key FROM user_e2ee_keys
        WHERE user_id = @userId
        LIMIT 1
      '''),
      parameters: {'userId': userId},
    );
    if (result.isEmpty) return null;
    return result.first[0] as String?;
  }
}
