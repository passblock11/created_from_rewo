import 'package:postgres/postgres.dart';

import '../models/message.dart';
import 'id.dart';

class MessageRepository {
  MessageRepository(this._conn);

  final Connection _conn;

  Future<List<Message>> listByConversation({
    required String conversationId,
    int limit = 50,
    DateTime? before,
  }) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT m.id, m.conversation_id, m.sender_id, m.body, m.created_at,
               u.name, u.email
        FROM messages m
        INNER JOIN users u ON u.id = m.sender_id
        WHERE m.conversation_id = @conversationId
          AND (@before::timestamptz IS NULL OR m.created_at < @before)
        ORDER BY m.created_at DESC
        LIMIT @limit
      '''),
      parameters: {
        'conversationId': conversationId,
        'before': before,
        'limit': limit,
      },
    );
    return result.map(Message.fromRow).toList();
  }

  Future<Message> create({
    required String conversationId,
    required String senderId,
    required String body,
  }) async {
    final id = newId();
    final result = await _conn.execute(
      Sql.named('''
        INSERT INTO messages (id, conversation_id, sender_id, body)
        VALUES (@id, @conversationId, @senderId, @body)
        RETURNING id, conversation_id, sender_id, body, created_at
      '''),
      parameters: {
        'id': id,
        'conversationId': conversationId,
        'senderId': senderId,
        'body': body,
      },
    );
    final row = result.first;
    final sender = await _conn.execute(
      Sql.named('SELECT name, email FROM users WHERE id = @id LIMIT 1'),
      parameters: {'id': senderId},
    );
    final senderRow = sender.isEmpty ? null : sender.first;
    return Message(
      id: row[0] as String,
      conversationId: row[1] as String,
      senderId: row[2] as String,
      body: row[3] as String,
      createdAt: row[4] as DateTime,
      senderName: senderRow?[0] as String?,
      senderEmail: senderRow?[1] as String?,
    );
  }
}
