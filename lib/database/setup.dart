import 'package:prisma_flutter_connector/runtime_server.dart';
import 'package:rewo/rewo.dart';

import '../generated/index.dart';

/// Connects Prisma ORM via [SupabaseAdapter] when `DATABASE_URL` is set.
Future<void> configureDatabase(Rewo app, AppConfigValues config) async {
  final url = config.databaseUrl;
  if (url == null || url.isEmpty) return;

  registerAllModels(schemaRegistry);

  final adapter = await SupabaseAdapter.fromConnectionString(url);
  final prisma = PrismaClient(adapter: adapter);
  app.singleton<PrismaClient>(prisma);

  app.health.register('database', () async {
    try {
      await prisma.user.findFirst();
      return true;
    } on Object {
      return false;
    }
  });
}

bool hasPrisma(Rewo app) => app.container.isRegistered<PrismaClient>();

bool hasDatabase(Rewo app) => hasPrisma(app);
