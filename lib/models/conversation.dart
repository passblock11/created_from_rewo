class Conversation {
  const Conversation({
    required this.id,
    required this.type,
    this.title,
    this.createdBy,
    required this.createdAt,
  });

  final String id;
  final String type;
  final String? title;
  final String? createdBy;
  final DateTime createdAt;

  factory Conversation.fromRow(List<Object?> row) {
    return Conversation(
      id: row[0] as String,
      type: row[1] as String,
      title: row[2] as String?,
      createdBy: row[3] as String?,
      createdAt: row[4] as DateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'title': title,
        'created_by': createdBy,
        'created_at': createdAt.toIso8601String(),
      };
}

class ConversationSummary {
  const ConversationSummary({
    required this.conversation,
    this.lastMessageBody,
    this.lastMessageAt,
    this.memberCount,
    this.peerUserId,
    this.peerName,
    this.peerEmail,
    this.peerAvatarUrl,
    this.unreadCount = 0,
    this.lastMessageE2ee = false,
    this.lastMessageDeleted = false,
    this.lastMessageSenderId,
    this.lastMessageType,
  });

  final Conversation conversation;
  final String? lastMessageBody;
  final DateTime? lastMessageAt;
  final int? memberCount;
  final String? peerUserId;
  final String? peerName;
  final String? peerEmail;
  final String? peerAvatarUrl;
  final int unreadCount;
  final bool lastMessageE2ee;
  final bool lastMessageDeleted;
  final String? lastMessageSenderId;
  final String? lastMessageType;

  Map<String, dynamic> toJson({String? viewerUserId}) => {
        ...conversation.toJson(),
        if (lastMessageBody != null) 'last_message': lastMessageBody,
        if (lastMessageAt != null)
          'last_message_at': lastMessageAt!.toIso8601String(),
        if (memberCount != null) 'member_count': memberCount,
        if (peerUserId != null) 'peer_user_id': peerUserId,
        if (peerName != null) 'peer_name': peerName,
        if (peerEmail != null) 'peer_email': peerEmail,
        if (peerAvatarUrl != null && peerAvatarUrl!.isNotEmpty)
          'peer_avatar_url': peerAvatarUrl,
        'unread_count': unreadCount,
        'last_message_e2ee': lastMessageE2ee,
        'last_message_deleted': lastMessageDeleted,
        if (lastMessageSenderId != null)
          'last_message_sender_id': lastMessageSenderId,
        if (lastMessageType != null) 'last_message_type': lastMessageType,
      };
}
