import 'dart:convert';
import 'dart:math';

/// Generates a short unique id for database primary keys.
String newId() {
  final random = Random.secure();
  final bytes = List<int>.generate(12, (_) => random.nextInt(256));
  final timestamp = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
  return 'c$timestamp${base64Url.encode(bytes).replaceAll('=', '').substring(0, 16)}';
}
