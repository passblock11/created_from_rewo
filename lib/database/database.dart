import 'package:postgres/postgres.dart';

import 'connection.dart';
import 'conversation_repository.dart';
import 'device_token_repository.dart';
import 'e2ee_key_repository.dart';
import 'item_repository.dart';
import 'message_repository.dart';
import 'refresh_token_repository.dart';
import 'user_repository.dart';

class Database {
  Database(this.connection)
      : users = UserRepository(connection),
        refreshTokens = RefreshTokenRepository(connection),
        items = ItemRepository(connection),
        conversations = ConversationRepository(connection),
        messages = MessageRepository(connection),
        deviceTokens = DeviceTokenRepository(connection),
        e2eeKeys = E2eeKeyRepository(connection);

  final Connection connection;
  final UserRepository users;
  final RefreshTokenRepository refreshTokens;
  final ItemRepository items;
  final ConversationRepository conversations;
  final MessageRepository messages;
  final DeviceTokenRepository deviceTokens;
  final E2eeKeyRepository e2eeKeys;

  static Future<Database> open(String connectionString) async {
    final connection = await openDatabaseConnection(connectionString);
    return Database(connection);
  }

  Future<void> close() => connection.close();
}
