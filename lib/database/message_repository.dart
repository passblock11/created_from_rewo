import 'dart:convert';

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
               u.name, u.email, m.metadata, m.message_type, m.e2ee_version
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

  Future<Message?> findById(String id) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT m.id, m.conversation_id, m.sender_id, m.body, m.created_at,
               u.name, u.email, m.metadata, m.message_type, m.e2ee_version
        FROM messages m
        INNER JOIN users u ON u.id = m.sender_id
        WHERE m.id = @id
        LIMIT 1
      '''),
      parameters: {'id': id},
    );
    if (result.isEmpty) return null;
    return Message.fromRow(result.first);
  }

  Future<Message> create({
    required String conversationId,
    required String senderId,
    required String body,
    String messageType = 'text',
    Map<String, dynamic> metadata = const {},
    int e2eeVersion = 0,
  }) async {
    final id = newId();
    final metadataJson = jsonEncode(metadata);
    final result = await _conn.execute(
      Sql.named('''
        INSERT INTO messages (
          id, conversation_id, sender_id, body, message_type, metadata, e2ee_version
        )
        VALUES (
          @id, @conversationId, @senderId, @body, @messageType, @metadata::jsonb, @e2eeVersion
        )
        RETURNING id, conversation_id, sender_id, body, created_at, message_type, metadata, e2ee_version
      '''),
      parameters: {
        'id': id,
        'conversationId': conversationId,
        'senderId': senderId,
        'body': body,
        'messageType': messageType,
        'metadata': metadataJson,
        'e2eeVersion': e2eeVersion,
      },
    );
    final row = result.first;
    final sender = await _conn.execute(
      Sql.named('SELECT name, email FROM users WHERE id = @id LIMIT 1'),
      parameters: {'id': senderId},
    );
    final senderRow = sender.isEmpty ? null : sender.first;
    final metadataRaw = row[6];
    return Message(
      id: row[0] as String,
      conversationId: row[1] as String,
      senderId: row[2] as String,
      body: row[3] as String,
      createdAt: row[4] as DateTime,
      messageType: row[5] as String,
      metadata: _decodeMetadata(metadataRaw),
      senderName: senderRow?[0] as String?,
      senderEmail: senderRow?[1] as String?,
      e2eeVersion: row[7] as int? ?? 0,
    );
  }

  Future<Message?> updateMetadata({
    required String id,
    required Map<String, dynamic> metadata,
  }) async {
    final metadataJson = jsonEncode(metadata);
    final result = await _conn.execute(
      Sql.named('''
        UPDATE messages
        SET metadata = @metadata::jsonb
        WHERE id = @id
        RETURNING id, conversation_id, sender_id, body, created_at, message_type, metadata, e2ee_version
      '''),
      parameters: {
        'id': id,
        'metadata': metadataJson,
      },
    );
    if (result.isEmpty) return null;
    final row = result.first;
    final sender = await _conn.execute(
      Sql.named('SELECT name, email FROM users WHERE id = @id LIMIT 1'),
      parameters: {'id': row[2] as String},
    );
    final senderRow = sender.isEmpty ? null : sender.first;
    return Message(
      id: row[0] as String,
      conversationId: row[1] as String,
      senderId: row[2] as String,
      body: row[3] as String,
      createdAt: row[4] as DateTime,
      messageType: row[5] as String,
      metadata: _decodeMetadata(row[6]),
      senderName: senderRow?[0] as String?,
      senderEmail: senderRow?[1] as String?,
      e2eeVersion: row[7] as int? ?? 0,
    );
  }

  Map<String, dynamic> _decodeMetadata(Object? raw) {
    if (raw is Map<String, dynamic>) return raw;
    if (raw is Map) return Map<String, dynamic>.from(raw);
    if (raw is String && raw.isNotEmpty) {
      return Map<String, dynamic>.from(jsonDecode(raw) as Map);
    }
    return {};
  }
}
