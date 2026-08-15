class Item {
  const Item({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  final String id;
  final String title;
  final DateTime createdAt;

  factory Item.fromRow(List<Object?> row) {
    return Item(
      id: row[0] as String,
      title: row[1] as String,
      createdAt: row[2] as DateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'created_at': createdAt.toIso8601String(),
      };
}
