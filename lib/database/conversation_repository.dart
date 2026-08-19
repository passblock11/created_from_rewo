import 'package:postgres/postgres.dart';

import '../models/conversation.dart';
import 'id.dart';

class ConversationRepository {
  ConversationRepository(this._conn);

  final Connection _conn;

  Future<List<ConversationSummary>> listForUser(String userId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT c.id, c.type, c.title, c.created_by, c.created_at,
               lm.body, lm.created_at, lm.e2ee_version, lm.deleted_at, lm.sender_id,
               (SELECT COUNT(*)::int FROM conversation_members cm2
                WHERE cm2.conversation_id = c.id) AS member_count,
               peer.id, peer.name, peer.email,
               (SELECT COUNT(*)::int FROM messages um
                WHERE um.conversation_id = c.id
                  AND um.sender_id <> @userId
                  AND um.created_at > cm.last_read_at) AS unread_count
        FROM conversations c
        INNER JOIN conversation_members cm
          ON cm.conversation_id = c.id AND cm.user_id = @userId
        LEFT JOIN LATERAL (
          SELECT m.body, m.created_at, m.e2ee_version, m.deleted_at, m.sender_id,
                 m.message_type
          FROM messages m
          WHERE m.conversation_id = c.id
            AND NOT EXISTS (
              SELECT 1 FROM user_hidden_messages h
              WHERE h.message_id = m.id AND h.user_id = @userId
            )
          ORDER BY m.created_at DESC
          LIMIT 1
        ) lm ON TRUE
        LEFT JOIN LATERAL (
          SELECT u.id, u.name, u.email
          FROM conversation_members cm_peer
          INNER JOIN users u ON u.id = cm_peer.user_id
          WHERE cm_peer.conversation_id = c.id
            AND cm_peer.user_id <> @userId
            AND c.type = 'dm'
          LIMIT 1
        ) peer ON c.type = 'dm'
        ORDER BY COALESCE(lm.created_at, c.created_at) DESC
      '''),
      parameters: {'userId': userId},
    );

    return result.map((row) {
      final conversation = Conversation.fromRow(row.sublist(0, 5));
      final deletedAt = row[8] as DateTime?;
      final lastSenderId = row[9] as String?;
      final lastMessageType = row[10] as String?;
      return ConversationSummary(
        conversation: conversation,
        lastMessageBody: row[5] as String?,
        lastMessageAt: row[6] as DateTime?,
        lastMessageE2ee: (row[7] as int? ?? 0) > 0,
        lastMessageDeleted: deletedAt != null,
        lastMessageSenderId: lastSenderId,
        lastMessageType: lastMessageType,
        memberCount: row[11] as int?,
        peerUserId: row[12] as String?,
        peerName: row[13] as String?,
        peerEmail: row[14] as String?,
        unreadCount: row[15] as int? ?? 0,
      );
    }).toList();
  }

  Future<DateTime> markAsRead({
    required String conversationId,
    required String userId,
  }) async {
    final result = await _conn.execute(
      Sql.named('''
        UPDATE conversation_members
        SET last_read_at = NOW()
        WHERE conversation_id = @conversationId AND user_id = @userId
        RETURNING last_read_at
      '''),
      parameters: {
        'conversationId': conversationId,
        'userId': userId,
      },
    );
    return result.first[0] as DateTime;
  }

  Future<Conversation?> findById(String id) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT id, type, title, created_by, created_at
        FROM conversations WHERE id = @id LIMIT 1
      '''),
      parameters: {'id': id},
    );
    if (result.isEmpty) return null;
    return Conversation.fromRow(result.first);
  }

  Future<Conversation?> findDmBetween(String userA, String userB) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT c.id, c.type, c.title, c.created_by, c.created_at
        FROM conversations c
        INNER JOIN conversation_members m1
          ON m1.conversation_id = c.id AND m1.user_id = @userA
        INNER JOIN conversation_members m2
          ON m2.conversation_id = c.id AND m2.user_id = @userB
        WHERE c.type = 'dm'
        LIMIT 1
      '''),
      parameters: {'userA': userA, 'userB': userB},
    );
    if (result.isEmpty) return null;
    return Conversation.fromRow(result.first);
  }

  Future<Conversation> createDm({
    required String userA,
    required String userB,
  }) async {
    final existing = await findDmBetween(userA, userB);
    if (existing != null) return existing;

    final id = newId();
    await _conn.execute(
      Sql.named('''
        INSERT INTO conversations (id, type, created_by)
        VALUES (@id, 'dm', @createdBy)
      '''),
      parameters: {'id': id, 'createdBy': userA},
    );
    for (final userId in {userA, userB}) {
      await _conn.execute(
        Sql.named('''
          INSERT INTO conversation_members (conversation_id, user_id)
          VALUES (@conversationId, @userId)
        '''),
        parameters: {'conversationId': id, 'userId': userId},
      );
    }
    return (await findById(id))!;
  }

  Future<Conversation> createGroup({
    required String title,
    required String createdBy,
    required List<String> memberIds,
  }) async {
    final id = newId();
    final members = {createdBy, ...memberIds}.toList();
    await _conn.execute(
      Sql.named('''
        INSERT INTO conversations (id, type, title, created_by)
        VALUES (@id, 'group', @title, @createdBy)
      '''),
      parameters: {'id': id, 'title': title, 'createdBy': createdBy},
    );
    for (final userId in members) {
      await _conn.execute(
        Sql.named('''
          INSERT INTO conversation_members (conversation_id, user_id)
          VALUES (@conversationId, @userId)
        '''),
        parameters: {'conversationId': id, 'userId': userId},
      );
    }
    return (await findById(id))!;
  }

  Future<bool> isMember(String conversationId, String userId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT 1 FROM conversation_members
        WHERE conversation_id = @conversationId AND user_id = @userId
        LIMIT 1
      '''),
      parameters: {'conversationId': conversationId, 'userId': userId},
    );
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> listMembers(String conversationId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT u.id, u.email, u.name, cm.joined_at, cm.last_read_at
        FROM conversation_members cm
        INNER JOIN users u ON u.id = cm.user_id
        WHERE cm.conversation_id = @conversationId
        ORDER BY cm.joined_at ASC
      '''),
      parameters: {'conversationId': conversationId},
    );
    return result
        .map((row) => {
              'id': row[0],
              'email': row[1],
              'name': row[2],
              'joined_at': (row[3] as DateTime).toIso8601String(),
              'last_read_at': (row[4] as DateTime).toIso8601String(),
            })
        .toList();
  }

  Future<void> addMember({
    required String conversationId,
    required String userId,
  }) async {
    await _conn.execute(
      Sql.named('''
        INSERT INTO conversation_members (conversation_id, user_id)
        VALUES (@conversationId, @userId)
        ON CONFLICT DO NOTHING
      '''),
      parameters: {'conversationId': conversationId, 'userId': userId},
    );
  }
}
