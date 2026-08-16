class Message {
  const Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.body,
    required this.createdAt,
    this.senderName,
    this.senderEmail,
  });

  final String id;
  final String conversationId;
  final String senderId;
  final String body;
  final DateTime createdAt;
  final String? senderName;
  final String? senderEmail;

  factory Message.fromRow(List<Object?> row) {
    return Message(
      id: row[0] as String,
      conversationId: row[1] as String,
      senderId: row[2] as String,
      body: row[3] as String,
      createdAt: row[4] as DateTime,
      senderName: row.length > 5 ? row[5] as String? : null,
      senderEmail: row.length > 6 ? row[6] as String? : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'conversation_id': conversationId,
        'sender_id': senderId,
        'body': body,
        'created_at': createdAt.toIso8601String(),
        if (senderName != null) 'sender_name': senderName,
        if (senderEmail != null) 'sender_email': senderEmail,
      };
}
