import 'dart:convert';

class Message {
  const Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.body,
    required this.createdAt,
    this.messageType = 'text',
    this.metadata = const {},
    this.senderName,
    this.senderEmail,
    this.e2eeVersion = 0,
    this.deletedAt,
  });

  final String id;
  final String conversationId;
  final String senderId;
  final String body;
  final DateTime createdAt;
  final String messageType;
  final Map<String, dynamic> metadata;
  final String? senderName;
  final String? senderEmail;
  final int e2eeVersion;
  final DateTime? deletedAt;

  bool get isDeleted => deletedAt != null;

  factory Message.fromRow(List<Object?> row) {
    final metadataRaw = row.length > 7 ? row[7] : null;
    Map<String, dynamic> metadata = {};
    if (metadataRaw is Map<String, dynamic>) {
      metadata = metadataRaw;
    } else if (metadataRaw is String && metadataRaw.isNotEmpty) {
      metadata = Map<String, dynamic>.from(jsonDecode(metadataRaw) as Map);
    } else if (metadataRaw is Map) {
      metadata = Map<String, dynamic>.from(metadataRaw);
    }

    return Message(
      id: row[0] as String,
      conversationId: row[1] as String,
      senderId: row[2] as String,
      body: row[3] as String,
      createdAt: row[4] as DateTime,
      senderName: row.length > 5 ? row[5] as String? : null,
      senderEmail: row.length > 6 ? row[6] as String? : null,
      messageType: row.length > 8 ? row[8] as String? ?? 'text' : 'text',
      metadata: metadata,
      e2eeVersion: row.length > 9 ? row[9] as int? ?? 0 : 0,
      deletedAt: row.length > 10 ? row[10] as DateTime? : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'conversation_id': conversationId,
        'sender_id': senderId,
        'body': body,
        'created_at': createdAt.toIso8601String(),
        'message_type': messageType,
        'metadata': metadata,
        'e2ee_version': e2eeVersion,
        if (deletedAt != null) 'deleted_at': deletedAt!.toIso8601String(),
        if (senderName != null) 'sender_name': senderName,
        if (senderEmail != null) 'sender_email': senderEmail,
      };

  Message copyWith({
    String? body,
    Map<String, dynamic>? metadata,
    int? e2eeVersion,
    DateTime? deletedAt,
  }) {
    return Message(
      id: id,
      conversationId: conversationId,
      senderId: senderId,
      body: body ?? this.body,
      createdAt: createdAt,
      messageType: messageType,
      metadata: metadata ?? this.metadata,
      senderName: senderName,
      senderEmail: senderEmail,
      e2eeVersion: e2eeVersion ?? this.e2eeVersion,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
