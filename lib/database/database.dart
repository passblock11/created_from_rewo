import 'package:postgres/postgres.dart';

import 'connection.dart';
import 'item_repository.dart';
import 'refresh_token_repository.dart';
import 'user_repository.dart';

class Database {
  Database(this.connection)
      : users = UserRepository(connection),
        refreshTokens = RefreshTokenRepository(connection),
        items = ItemRepository(connection);

  final Connection connection;
  final UserRepository users;
  final RefreshTokenRepository refreshTokens;
  final ItemRepository items;

  static Future<Database> open(String connectionString) async {
    final connection = await openDatabaseConnection(connectionString);
    return Database(connection);
  }

  Future<void> close() => connection.close();
}
