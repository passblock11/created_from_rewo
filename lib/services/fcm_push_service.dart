import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

/// Sends high-priority FCM data messages (calls + chat).
///
/// Supports either:
/// - Legacy: [FCM_SERVER_KEY] env var
/// - Modern: [FCM_SERVICE_ACCOUNT_PATH] pointing to firebase-adminsdk JSON
class FcmPushService {
  FcmPushService._({
    required http.Client client,
    String? serverKey,
    ServiceAccountCredentials? serviceAccount,
    String? projectId,
  })  : _client = client,
        _serverKey = serverKey,
        _serviceAccount = serviceAccount,
        _projectId = projectId;

  factory FcmPushService.legacy(String serverKey, {http.Client? client}) {
    return FcmPushService._(
      client: client ?? http.Client(),
      serverKey: serverKey,
    );
  }

  factory FcmPushService.v1({
    required ServiceAccountCredentials serviceAccount,
    required String projectId,
    http.Client? client,
  }) {
    return FcmPushService._(
      client: client ?? http.Client(),
      serviceAccount: serviceAccount,
      projectId: projectId,
    );
  }

  static const _scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

  final http.Client _client;
  final String? _serverKey;
  final ServiceAccountCredentials? _serviceAccount;
  final String? _projectId;

  AccessCredentials? _accessCredentials;

  bool get enabled {
    final key = _serverKey;
    return (key != null && key.isNotEmpty) ||
        (_serviceAccount != null && _projectId != null);
  }

  bool get _usesV1 => _serviceAccount != null && _projectId != null;

  Future<void> sendDataMessage({
    required String deviceToken,
    required Map<String, String> data,
    String? notificationTitle,
    String? notificationBody,
  }) async {
    if (!enabled) return;

    if (_usesV1) {
      await _sendV1(
        deviceToken: deviceToken,
        data: data,
        notificationTitle: notificationTitle,
        notificationBody: notificationBody,
      );
    } else {
      await _sendLegacy(
        deviceToken: deviceToken,
        data: data,
        notificationTitle: notificationTitle,
        notificationBody: notificationBody,
      );
    }
  }

  Future<void> _sendLegacy({
    required String deviceToken,
    required Map<String, String> data,
    String? notificationTitle,
    String? notificationBody,
  }) async {
    final payload = <String, dynamic>{
      'to': deviceToken,
      'priority': 'high',
      'content_available': true,
      'data': data,
    };
    if (notificationTitle != null && notificationBody != null) {
      payload['notification'] = {
        'title': notificationTitle,
        'body': notificationBody,
      };
    }
    final response = await _client.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'key=$_serverKey',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode >= 400) {
      stderr.writeln(
        'FCM legacy push failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  Future<void> _sendV1({
    required String deviceToken,
    required Map<String, String> data,
    String? notificationTitle,
    String? notificationBody,
  }) async {
    final token = await _accessToken();
    final message = <String, dynamic>{
      'token': deviceToken,
      'data': data,
      'android': {
        'priority': 'HIGH',
        if (notificationTitle != null && notificationBody != null)
          'notification': {
            'channel_id': 'chat_messages',
            'title': notificationTitle,
            'body': notificationBody,
          },
      },
      'apns': {
        'headers': {'apns-priority': '10'},
        'payload': {
          'aps': {
            'content-available': 1,
            if (notificationTitle != null && notificationBody != null) ...{
              'alert': {
                'title': notificationTitle,
                'body': notificationBody,
              },
              'sound': 'default',
            },
          },
        },
      },
    };
    if (notificationTitle != null && notificationBody != null) {
      message['notification'] = {
        'title': notificationTitle,
        'body': notificationBody,
      };
    }

    final response = await _client.post(
      Uri.parse(
        'https://fcm.googleapis.com/v1/projects/$_projectId/messages:send',
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode >= 400) {
      stderr.writeln(
        'FCM v1 push failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  Future<String> _accessToken() async {
    final account = _serviceAccount;
    if (account == null) {
      throw StateError('FCM service account is not configured');
    }

    final existing = _accessCredentials;
    if (existing != null && !existing.accessToken.hasExpired) {
      return existing.accessToken.data;
    }

    _accessCredentials = await obtainAccessCredentialsViaServiceAccount(
      account,
      _scopes,
      _client,
    );
    return _accessCredentials!.accessToken.data;
  }

  Future<void> sendIncomingCall({
    required String deviceToken,
    required Map<String, String> data,
  }) {
    return sendDataMessage(deviceToken: deviceToken, data: data);
  }

  Future<void> sendCallCancelled({
    required String deviceToken,
    required String callId,
  }) {
    return sendDataMessage(
      deviceToken: deviceToken,
      data: {
        'type': 'call_cancel',
        'call_id': callId,
      },
    );
  }

  Future<void> sendChatMessage({
    required String deviceToken,
    required Map<String, String> data,
    String? notificationTitle,
    String? notificationBody,
  }) {
    return sendDataMessage(
      deviceToken: deviceToken,
      data: data,
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
    );
  }

  void dispose() => _client.close();
}

FcmPushService? tryCreateFcmPushServiceFromEnv() {
  final serverKey = Platform.environment['FCM_SERVER_KEY']?.trim();
  if (serverKey != null && serverKey.isNotEmpty) {
    stderr.writeln('FCM: using legacy server key');
    return FcmPushService.legacy(serverKey);
  }

  final path = fcmServiceAccountPathFromEnv();
  if (path == null) {
    stderr.writeln(
      'FCM: not configured — push notifications disabled. '
      'Set FCM_SERVICE_ACCOUNT_PATH in .env or place rewo-*.json in the app directory.',
    );
    return null;
  }

  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('FCM service account file not found: $path');
    return null;
  }

  try {
    final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    final projectId = json['project_id'] as String?;
    if (projectId == null || projectId.isEmpty) {
      stderr.writeln('FCM service account JSON missing project_id');
      return null;
    }
    stderr.writeln('FCM: enabled (project $projectId, key $path)');
    return FcmPushService.v1(
      serviceAccount: ServiceAccountCredentials.fromJson(json),
      projectId: projectId,
    );
  } on Object catch (e) {
    stderr.writeln('FCM service account load failed: $e');
    return null;
  }
}

String? fcmServiceAccountPathFromEnv() {
  for (final key in ['FCM_SERVICE_ACCOUNT_PATH', 'GOOGLE_APPLICATION_CREDENTIALS']) {
    final path = Platform.environment[key]?.trim();
    if (path != null && path.isNotEmpty) {
      final file = File(path);
      if (file.existsSync()) return file.path;
    }
  }

  // Auto-detect rewo-*.json in the server working directory (deploy VM).
  try {
    final cwd = Directory.current;
    for (final entity in cwd.listSync(followLinks: false)) {
      if (entity is! File) continue;
      final name = entity.uri.pathSegments.last;
      if (name.startsWith('rewo-') && name.endsWith('.json')) {
        return entity.path;
      }
    }
  } on Object {
    // Ignore directory listing errors.
  }
  return null;
}
