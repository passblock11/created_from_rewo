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
  });

  final Conversation conversation;
  final String? lastMessageBody;
  final DateTime? lastMessageAt;
  final int? memberCount;

  Map<String, dynamic> toJson() => {
        ...conversation.toJson(),
        if (lastMessageBody != null) 'last_message': lastMessageBody,
        if (lastMessageAt != null)
          'last_message_at': lastMessageAt!.toIso8601String(),
        if (memberCount != null) 'member_count': memberCount,
      };
}
