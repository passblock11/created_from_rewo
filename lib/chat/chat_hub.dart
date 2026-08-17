import 'dart:convert';
import 'dart:io';

import '../models/message.dart';

class ChatConnection {
  ChatConnection({
    required this.socket,
    required this.userId,
  });

  final WebSocket socket;
  final String userId;
  final Set<String> conversationIds = {};
}

/// In-memory hub for realtime chat delivery.
class ChatHub {
  final Map<String, Set<ChatConnection>> _byConversation = {};
  final Map<WebSocket, ChatConnection> _bySocket = {};
  final Map<String, int> _onlineCounts = {};

  void register(ChatConnection connection) {
    _bySocket[connection.socket] = connection;
    _incrementOnline(connection.userId);
    connection.socket.done.whenComplete(() => unregister(connection.socket));
  }

  void unregister(WebSocket socket) {
    final connection = _bySocket.remove(socket);
    if (connection == null) return;
    _decrementOnline(connection.userId);
    for (final conversationId in connection.conversationIds) {
      _byConversation[conversationId]?.remove(connection);
      if (_byConversation[conversationId]?.isEmpty ?? false) {
        _byConversation.remove(conversationId);
      }
    }
  }

  void subscribe(ChatConnection connection, String conversationId) {
    connection.conversationIds.add(conversationId);
    _byConversation.putIfAbsent(conversationId, () => {}).add(connection);
  }

  void unsubscribe(ChatConnection connection, String conversationId) {
    connection.conversationIds.remove(conversationId);
    _byConversation[conversationId]?.remove(connection);
    if (_byConversation[conversationId]?.isEmpty ?? false) {
      _byConversation.remove(conversationId);
    }
  }

  bool isUserOnline(String userId) => (_onlineCounts[userId] ?? 0) > 0;

  void broadcastMessage(Message message, {String? excludeSocketUserId}) {
    final payload = jsonEncode({
      'type': 'message',
      'message': message.toJson(),
    });
    final connections =
        _byConversation[message.conversationId]?.toList() ?? const [];
    for (final connection in connections) {
      if (excludeSocketUserId != null && connection.userId == excludeSocketUserId) {
        continue;
      }
      connection.socket.add(payload);
    }
  }

  void broadcastMessageUpdate(Message message) {
    final payload = jsonEncode({
      'type': 'message_updated',
      'message': message.toJson(),
    });
    final connections =
        _byConversation[message.conversationId]?.toList() ?? const [];
    for (final connection in connections) {
      connection.socket.add(payload);
    }
  }

  void broadcastMessageDeleted(Message message) {
    final payload = jsonEncode({
      'type': 'message_deleted',
      'scope': 'everyone',
      'message': message.toJson(),
    });
    final connections =
        _byConversation[message.conversationId]?.toList() ?? const [];
    for (final connection in connections) {
      connection.socket.add(payload);
    }
  }

  void broadcastMessageHidden({
    required String conversationId,
    required String messageId,
    required String userId,
  }) {
    final payload = jsonEncode({
      'type': 'message_hidden',
      'scope': 'me',
      'conversation_id': conversationId,
      'message_id': messageId,
    });
    for (final connection in _bySocket.values) {
      if (connection.userId != userId) continue;
      connection.socket.add(payload);
    }
  }

  void broadcastTyping({
    required String conversationId,
    required String userId,
    required bool typing,
  }) {
    final payload = jsonEncode({
      'type': 'typing',
      'conversation_id': conversationId,
      'user_id': userId,
      'typing': typing,
    });
    final connections =
        _byConversation[conversationId]?.toList() ?? const [];
    for (final connection in connections) {
      if (connection.userId == userId) continue;
      connection.socket.add(payload);
    }
  }

  void broadcastConversationRead({
    required String conversationId,
    required String userId,
    required DateTime readAt,
  }) {
    final payload = jsonEncode({
      'type': 'conversation_read',
      'conversation_id': conversationId,
      'user_id': userId,
      'read_at': readAt.toIso8601String(),
    });
    final connections =
        _byConversation[conversationId]?.toList() ?? const [];
    for (final connection in connections) {
      connection.socket.add(payload);
    }
  }

  void sendToUser(String userId, Map<String, dynamic> payload) {
    final encoded = jsonEncode(payload);
    for (final connection in _bySocket.values) {
      if (connection.userId == userId) {
        connection.socket.add(encoded);
      }
    }
  }

  /// True when the user has an active socket subscribed to this conversation
  /// (they are viewing the chat — skip push notification).
  bool isUserViewingConversation(String userId, String conversationId) {
    final connections = _byConversation[conversationId];
    if (connections == null || connections.isEmpty) return false;
    return connections.any((connection) => connection.userId == userId);
  }

  ChatConnection? connectionFor(WebSocket socket) => _bySocket[socket];

  void _incrementOnline(String userId) {
    final count = (_onlineCounts[userId] ?? 0) + 1;
    _onlineCounts[userId] = count;
    if (count == 1) {
      _broadcastPresence(userId, online: true);
    }
  }

  void _decrementOnline(String userId) {
    final count = (_onlineCounts[userId] ?? 1) - 1;
    if (count <= 0) {
      _onlineCounts.remove(userId);
      _broadcastPresence(userId, online: false);
    } else {
      _onlineCounts[userId] = count;
    }
  }

  void _broadcastPresence(String userId, {required bool online}) {
    final payload = jsonEncode({
      'type': online ? 'user_online' : 'user_offline',
      'user_id': userId,
    });
    for (final connection in _bySocket.values) {
      if (connection.userId == userId) continue;
      connection.socket.add(payload);
    }
  }
}
