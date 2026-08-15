import 'package:rewo/rewo.dart';

import 'database.dart';

/// Opens a Postgres connection when `DATABASE_URL` is set.
Future<void> configureDatabase(Rewo app, AppConfigValues config) async {
  final url = config.databaseUrl;
  if (url == null || url.isEmpty) return;

  final db = await Database.open(url);
  app.singleton<Database>(db);

  app.health.register('database', () async {
    try {
      await db.connection.execute('SELECT 1');
      return true;
    } on Object {
      return false;
    }
  });
}

bool hasDatabase(Rewo app) => app.container.isRegistered<Database>();
