import 'package:postgres/postgres.dart';

import '../database/id.dart';

bool _pgBool(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  return false;
}

int _pgInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  return 0;
}

class StatusRecord {
  const StatusRecord({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.mediaUrl,
    required this.mediaType,
    required this.createdAt,
    required this.expiresAt,
    this.caption,
    this.viewCount = 0,
    this.viewedByMe = false,
  });

  final String id;
  final String userId;
  final String userName;
  final String? userAvatarUrl;
  final String mediaUrl;
  final String mediaType;
  final String? caption;
  final DateTime createdAt;
  final DateTime expiresAt;
  final int viewCount;
  final bool viewedByMe;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user_name': userName,
        if (userAvatarUrl != null && userAvatarUrl!.isNotEmpty)
          'user_avatar_url': userAvatarUrl,
        'media_url': mediaUrl,
        'media_type': mediaType,
        if (caption != null) 'caption': caption,
        'created_at': createdAt.toIso8601String(),
        'expires_at': expiresAt.toIso8601String(),
        'view_count': viewCount,
        'viewed_by_me': viewedByMe,
      };
}

class StatusViewerRecord {
  const StatusViewerRecord({
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.viewedAt,
  });

  final String userId;
  final String userName;
  final String? userAvatarUrl;
  final DateTime viewedAt;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_name': userName,
        if (userAvatarUrl != null && userAvatarUrl!.isNotEmpty)
          'user_avatar_url': userAvatarUrl,
        'viewed_at': viewedAt.toIso8601String(),
      };
}

class StatusRepository {
  StatusRepository(this._conn);

  final Connection _conn;

  Future<StatusRecord> create({
    required String userId,
    required String userName,
    String? userAvatarUrl,
    required String mediaUrl,
    required String mediaType,
    String? caption,
  }) async {
    final id = newId();
    final result = await _conn.execute(
      Sql.named('''
        INSERT INTO statuses (id, user_id, media_url, media_type, caption, expires_at)
        VALUES (@id, @userId, @mediaUrl, @mediaType, @caption, NOW() + INTERVAL '24 hours')
        RETURNING id, user_id, media_url, media_type, caption, created_at, expires_at
      '''),
      parameters: {
        'id': id,
        'userId': userId,
        'mediaUrl': mediaUrl,
        'mediaType': mediaType,
        'caption': caption,
      },
    );
    final row = result.first;
    return StatusRecord(
      id: row[0] as String,
      userId: row[1] as String,
      userName: userName,
      userAvatarUrl: userAvatarUrl,
      mediaUrl: row[2] as String,
      mediaType: row[3] as String,
      caption: row[4] as String?,
      createdAt: row[5] as DateTime,
      expiresAt: row[6] as DateTime,
    );
  }

  Future<List<StatusRecord>> listActiveForViewer(String viewerId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT s.id, s.user_id, u.name, u.email, u.avatar_url, s.media_url, s.media_type, s.caption,
               s.created_at, s.expires_at,
               (SELECT COUNT(*)::int FROM status_views v WHERE v.status_id = s.id) AS view_count,
               EXISTS(
                 SELECT 1 FROM status_views v
                 WHERE v.status_id = s.id AND v.viewer_id = @viewerId
               ) AS viewed_by_me
        FROM statuses s
        INNER JOIN users u ON u.id = s.user_id
        WHERE s.expires_at > NOW()
          AND (
            s.user_id = @viewerId
            OR EXISTS (
              SELECT 1
              FROM conversation_members cm_self
              INNER JOIN conversation_members cm_peer
                ON cm_self.conversation_id = cm_peer.conversation_id
              INNER JOIN conversations c ON c.id = cm_self.conversation_id
              WHERE cm_self.user_id = @viewerId
                AND cm_peer.user_id = s.user_id
                AND c.type = 'dm'
            )
          )
        ORDER BY s.created_at DESC
      '''),
      parameters: {'viewerId': viewerId},
    );

    return result.map((row) {
      final name = row[2] as String?;
      final email = row[3] as String?;
      final userName = (name != null && name.trim().isNotEmpty)
          ? name.trim()
          : (email ?? 'User');
      return StatusRecord(
        id: row[0] as String,
        userId: row[1] as String,
        userName: userName,
        userAvatarUrl: row[4] as String?,
        mediaUrl: row[5] as String,
        mediaType: row[6] as String? ?? 'image',
        caption: row[7] as String?,
        createdAt: row[8] as DateTime,
        expiresAt: row[9] as DateTime,
        viewCount: _pgInt(row[10]),
        viewedByMe: _pgBool(row[11]),
      );
    }).toList();
  }

  Future<void> markViewed({
    required String statusId,
    required String viewerId,
  }) async {
    await _conn.execute(
      Sql.named('''
        INSERT INTO status_views (status_id, viewer_id)
        VALUES (@statusId, @viewerId)
        ON CONFLICT (status_id, viewer_id) DO NOTHING
      '''),
      parameters: {'statusId': statusId, 'viewerId': viewerId},
    );
  }

  Future<StatusRecord?> findById(String statusId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT s.id, s.user_id, u.name, u.email, s.media_url, s.media_type, s.caption,
               s.created_at, s.expires_at
        FROM statuses s
        INNER JOIN users u ON u.id = s.user_id
        WHERE s.id = @statusId
        LIMIT 1
      '''),
      parameters: {'statusId': statusId},
    );
    if (result.isEmpty) return null;
    final row = result.first;
    final name = row[2] as String?;
    final email = row[3] as String?;
    final userName = (name != null && name.trim().isNotEmpty)
        ? name.trim()
        : (email ?? 'User');
    return StatusRecord(
      id: row[0] as String,
      userId: row[1] as String,
      userName: userName,
      mediaUrl: row[4] as String,
      mediaType: row[5] as String? ?? 'image',
      caption: row[6] as String?,
      createdAt: row[7] as DateTime,
      expiresAt: row[8] as DateTime,
    );
  }

  Future<List<StatusViewerRecord>> listViewers(String statusId) async {
    final result = await _conn.execute(
      Sql.named('''
        SELECT u.id, u.name, u.email, u.avatar_url, v.viewed_at
        FROM status_views v
        INNER JOIN users u ON u.id = v.viewer_id
        WHERE v.status_id = @statusId
        ORDER BY v.viewed_at DESC
      '''),
      parameters: {'statusId': statusId},
    );

    return result.map((row) {
      final name = row[1] as String?;
      final email = row[2] as String?;
      final userName = (name != null && name.trim().isNotEmpty)
          ? name.trim()
          : (email ?? 'User');
      return StatusViewerRecord(
        userId: row[0] as String,
        userName: userName,
        userAvatarUrl: row[3] as String?,
        viewedAt: row[4] as DateTime,
      );
    }).toList();
  }

  Future<bool> deleteOwned({
    required String statusId,
    required String userId,
  }) async {
    final result = await _conn.execute(
      Sql.named('''
        DELETE FROM statuses
        WHERE id = @statusId AND user_id = @userId
      '''),
      parameters: {'statusId': statusId, 'userId': userId},
    );
    return result.affectedRows > 0;
  }
}
