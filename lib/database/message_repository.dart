import 'dart:convert';

import 'package:postgres/postgres.dart';

import '../models/message.dart';
import 'id.dart';

class MessageRepository {
  MessageRepository(this._conn);

  final Connection _conn;

  static const _selectColumns = '''
        m.id, m.conversation_id, m.sender_id, m.body, m.created_at,
        u.name, u.email, m.metadata, m.message_type, m.e2ee_version, m.deleted_at
  ''';

  Future<List<Message>> listByConversation({
    required String conversationId,
    required String userId,
    int limit = 50,
    DateTime? before,
  }) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT $_selectColumns
        FROM messages m
        INNER JOIN users u ON u.id = m.sender_id
        WHERE m.conversation_id = @conversationId
          AND (@before::timestamptz IS NULL OR m.created_at < @before)
          AND NOT EXISTS (
            SELECT 1 FROM user_hidden_messages h
            WHERE h.message_id = m.id AND h.user_id = @userId
          )
        ORDER BY m.created_at DESC
        LIMIT @limit
      '''),
      parameters: {
        'conversationId': conversationId,
        'userId': userId,
        'before': before,
        'limit': limit,
      },
    );
    return result.map(Message.fromRow).toList();
  }

  Future<Message?> findById(String id) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT $_selectColumns
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

  Future<void> hideForUser({
    required String messageId,
    required String userId,
  }) async {
    await _conn.execute(
      Sql.named('''
        INSERT INTO user_hidden_messages (user_id, message_id)
        VALUES (@userId, @messageId)
        ON CONFLICT (user_id, message_id) DO NOTHING
      '''),
      parameters: {
        'userId': userId,
        'messageId': messageId,
      },
    );
  }

  Future<Message?> deleteForEveryone({
    required String messageId,
    required String userId,
  }) async {
    final result = await _conn.execute(
      Sql.named('''
        UPDATE messages
        SET deleted_at = NOW(),
            deleted_by = @userId,
            body = '',
            metadata = '{}'::jsonb,
            message_type = 'text',
            e2ee_version = 0
        WHERE id = @messageId
          AND sender_id = @userId
          AND deleted_at IS NULL
        RETURNING id, conversation_id, sender_id, body, created_at,
                  message_type, metadata, e2ee_version, deleted_at
      '''),
      parameters: {
        'messageId': messageId,
        'userId': userId,
      },
    );
    if (result.isEmpty) return null;
    return _messageFromMutationRow(result.first);
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
        RETURNING id, conversation_id, sender_id, body, created_at, message_type, metadata, e2ee_version, deleted_at
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
    return _messageFromMutationRow(result.first, senderId: senderId);
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
        RETURNING id, conversation_id, sender_id, body, created_at, message_type, metadata, e2ee_version, deleted_at
      '''),
      parameters: {
        'id': id,
        'metadata': metadataJson,
      },
    );
    if (result.isEmpty) return null;
    return _messageFromMutationRow(result.first);
  }

  Future<Message> _messageFromMutationRow(
    List<Object?> row, {
    String? senderId,
  }) async {
    final resolvedSenderId = senderId ?? row[2] as String;
    final sender = await _conn.execute(
      Sql.named('SELECT name, email FROM users WHERE id = @id LIMIT 1'),
      parameters: {'id': resolvedSenderId},
    );
    final senderRow = sender.isEmpty ? null : sender.first;
    final metadataRaw = row[6];
    return Message(
      id: row[0] as String,
      conversationId: row[1] as String,
      senderId: resolvedSenderId,
      body: row[3] as String,
      createdAt: row[4] as DateTime,
      messageType: row[5] as String? ?? 'text',
      metadata: _decodeMetadata(metadataRaw),
      senderName: senderRow?[0] as String?,
      senderEmail: senderRow?[1] as String?,
      e2eeVersion: row[7] as int? ?? 0,
      deletedAt: row.length > 8 ? row[8] as DateTime? : null,
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
