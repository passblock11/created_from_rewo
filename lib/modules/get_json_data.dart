import 'package:rewo/rewo.dart';

/// Example API module — copy this file to add more resources.
class GetJsonDataModule implements RewoModule {
  @override
  String get name => 'get_json_data';

  final _jsonData = <Map<String, dynamic>>[
    {
      'id': 1,
      'name': 'John Doe133343',
      'age': 35,
    },
  ];

  @override
  void register(Rewo app) {
    app.get('/api/json_data', (_) async => _jsonData);

    app.get('/api/json_data/:id', (ctx) async {
      final id = ctx.param('id')!;
      return _jsonData.firstWhere((element) => element['id'] == int.parse(id));
    });

    app.post('/api/json_data', (ctx) async {
      final body = await ctx.jsonBody();
      final nextId = _jsonData.fold<int>(
            0,
            (max, item) => (item['id'] as int) > max ? item['id'] as int : max,
          ) +
          1;
      final entry = {
        'id': nextId,
        'name': body['name'] ?? '',
        'age': body['age'] ?? 0,
      };
      _jsonData.add(entry);
      return entry;
    });
  }
}
