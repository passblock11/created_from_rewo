import 'user.dart';

class RefreshToken {
  const RefreshToken({
    required this.id,
    required this.userId,
    required this.tokenHash,
    required this.expiresAt,
    this.revokedAt,
    required this.createdAt,
    this.user,
  });

  final String id;
  final String userId;
  final String tokenHash;
  final DateTime expiresAt;
  final DateTime? revokedAt;
  final DateTime createdAt;
  final User? user;

  factory RefreshToken.fromRow(List<Object?> row, {User? user}) {
    return RefreshToken(
      id: row[0] as String,
      userId: row[1] as String,
      tokenHash: row[2] as String,
      expiresAt: row[3] as DateTime,
      revokedAt: row[4] as DateTime?,
      createdAt: row[5] as DateTime,
      user: user,
    );
  }
}
