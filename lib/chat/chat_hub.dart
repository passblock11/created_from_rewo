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

  void register(ChatConnection connection) {
    _bySocket[connection.socket] = connection;
    connection.socket.done.whenComplete(() => unregister(connection.socket));
  }

  void unregister(WebSocket socket) {
    final connection = _bySocket.remove(socket);
    if (connection == null) return;
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
}
