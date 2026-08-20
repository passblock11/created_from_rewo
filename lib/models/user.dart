class User {
  const User({
    required this.id,
    required this.email,
    required this.passwordHash,
    this.name,
    this.avatarUrl,
    required this.createdAt,
  });

  final String id;
  final String email;
  final String passwordHash;
  final String? name;
  final String? avatarUrl;
  final DateTime createdAt;

  factory User.fromRow(List<Object?> row) {
    return User(
      id: row[0] as String,
      email: row[1] as String,
      passwordHash: row[2] as String,
      name: row[3] as String?,
      avatarUrl: row.length > 4 ? row[4] as String? : null,
      createdAt: row.length > 5 ? row[5] as DateTime : row[4] as DateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        if (avatarUrl != null && avatarUrl!.isNotEmpty) 'avatar_url': avatarUrl,
        'created_at': createdAt.toIso8601String(),
      };
}
