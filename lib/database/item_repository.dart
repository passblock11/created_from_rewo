import 'package:postgres/postgres.dart';

import '../models/item.dart';
import 'id.dart';

class ItemRepository {
  ItemRepository(this._conn);

  final Connection _conn;

  Future<List<Item>> findAll() async {
    final result = await _conn.execute(
      'SELECT id, title, created_at FROM items ORDER BY created_at DESC',
    );
    return result.map(Item.fromRow).toList();
  }

  Future<Item?> findById(String id) async {
    final result = await _conn.execute(
      Sql.named(
        'SELECT id, title, created_at FROM items WHERE id = @id LIMIT 1',
      ),
      parameters: {'id': id},
    );
    if (result.isEmpty) return null;
    return Item.fromRow(result.first);
  }

  Future<Item> create({required String title}) async {
    final id = newId();
    final result = await _conn.execute(
      Sql.named(
        'INSERT INTO items (id, title) VALUES (@id, @title) '
        'RETURNING id, title, created_at',
      ),
      parameters: {'id': id, 'title': title},
    );
    return Item.fromRow(result.first);
  }

  Future<Item> update({required String id, required String title}) async {
    final result = await _conn.execute(
      Sql.named(
        'UPDATE items SET title = @title WHERE id = @id '
        'RETURNING id, title, created_at',
      ),
      parameters: {'id': id, 'title': title},
    );
    if (result.isEmpty) {
      throw StateError('Item $id not found');
    }
    return Item.fromRow(result.first);
  }

  Future<void> delete(String id) async {
    final result = await _conn.execute(
      Sql.named('DELETE FROM items WHERE id = @id'),
      parameters: {'id': id},
    );
    if (result.affectedRows == 0) {
      throw StateError('Item $id not found');
    }
  }
}
