import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  final salt = _randomSalt();
  return '$salt:${_digest(salt, password)}';
}

bool verifyPassword(String password, String stored) {
  final parts = stored.split(':');
  if (parts.length != 2) return false;
  return _digest(parts[0], password) == parts[1];
}

String _digest(String salt, String password) {
  return sha256.convert(utf8.encode('$salt:$password')).toString();
}

String _randomSalt() {
  final rand = Random.secure();
  return List.generate(16, (_) => rand.nextInt(256))
      .map((b) => b.toRadixString(16).padLeft(2, '0'))
      .join();
}
