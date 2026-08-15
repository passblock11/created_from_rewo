import 'package:dart_serve_testing/migrate/runner.dart';
import 'package:rewo/rewo.dart';

/// Apply pending SQL migrations to Postgres.
///
/// Uses `DIRECT_URL` from `.env` (required for Supabase DDL).
/// Falls back to `DATABASE_URL` without pgbouncer.
///
/// ```bash
/// dart run bin/migrate.dart
/// ```
Future<void> main() async {
  await DotEnv.load();

  final url = migrationDatabaseUrl();
  final host = Uri.parse(url).host;
  // ignore: avoid_print
  print('🗄  Running migrations against $host ...');

  await MigrationRunner(connectionString: url).run();
}
