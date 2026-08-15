import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:postgres/postgres.dart';
import 'package:rewo/rewo.dart';

/// Runs SQL files from [migrationsDir] and tracks them in `schema_migrations`.
class MigrationRunner {
  MigrationRunner({
    required this.connectionString,
    this.migrationsDir = 'sql/migrations',
  });

  final String connectionString;
  final String migrationsDir;

  Future<void> run() async {
    final uri = Uri.parse(connectionString);
    final endpoint = _endpointFromUri(uri);
    final sslMode = _sslModeFor(uri);

    final conn = await Connection.open(
      endpoint,
      settings: ConnectionSettings(sslMode: sslMode),
    );

    try {
      await _ensureMigrationsTable(conn);
      final applied = await _appliedMigrations(conn);
      final files = _migrationFiles();

      if (files.isEmpty) {
        // ignore: avoid_print
        print('No migration files found in $migrationsDir');
        return;
      }

      var ran = 0;
      for (final file in files) {
        final name = p.basename(file);
        if (applied.contains(name)) {
          // ignore: avoid_print
          print('⏭  $name (already applied)');
          continue;
        }

        final sql = await File(file).readAsString();
        // ignore: avoid_print
        print('▶  Applying $name...');
        await _runSqlFile(conn, sql);
        await conn.execute(
          Sql.named(
            'INSERT INTO schema_migrations (name) VALUES (@name)',
          ),
          parameters: {'name': name},
        );
        // ignore: avoid_print
        print('✅ $name');
        ran++;
      }

      if (ran == 0) {
        // ignore: avoid_print
        print('Database is up to date.');
      } else {
        // ignore: avoid_print
        print('Applied $ran migration(s).');
      }
    } finally {
      await conn.close();
    }
  }

  Future<void> _ensureMigrationsTable(Connection conn) async {
    await conn.execute('''
      CREATE TABLE IF NOT EXISTS schema_migrations (
        name TEXT PRIMARY KEY,
        applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
      )
    ''');
  }

  Future<Set<String>> _appliedMigrations(Connection conn) async {
    final result = await conn.execute('SELECT name FROM schema_migrations');
    return result.map((row) => row[0] as String).toSet();
  }

  List<String> _migrationFiles() {
    final dir = Directory(migrationsDir);
    if (!dir.existsSync()) return [];
    return dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.sql'))
        .map((f) => f.path)
        .toList()
      ..sort();
  }

  Future<void> _runSqlFile(Connection conn, String sql) async {
    final statements = _splitStatements(sql);
    await conn.execute('BEGIN');
    try {
      for (final statement in statements) {
        await conn.execute(Sql(statement));
      }
      await conn.execute('COMMIT');
    } on Object {
      await conn.execute('ROLLBACK');
      rethrow;
    }
  }

  List<String> _splitStatements(String sql) {
    final withoutComments = sql
        .split('\n')
        .where((line) => !line.trim().startsWith('--'))
        .join('\n');

    return withoutComments
        .split(';')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  Endpoint _endpointFromUri(Uri uri) {
    final db = uri.pathSegments.isNotEmpty
        ? uri.pathSegments.first.replaceFirst('/', '')
        : 'postgres';
    final userInfo = uri.userInfo.split(':');
    return Endpoint(
      host: uri.host,
      port: uri.port == 0 ? 5432 : uri.port,
      database: db,
      username: userInfo.first,
      password: userInfo.length > 1 ? userInfo.sublist(1).join(':') : null,
    );
  }

  SslMode _sslModeFor(Uri uri) {
    final host = uri.host.toLowerCase();
    if (host == 'localhost' || host == '127.0.0.1') {
      return SslMode.disable;
    }
    return SslMode.require;
  }
}

/// Resolves the best connection string for migrations (DDL).
String migrationDatabaseUrl() {
  final config = DatabaseConfig.fromEnv();
  final url = config.migrationUrl;
  if (url == null || url.isEmpty) {
    throw StateError(
      'Set DIRECT_URL or DATABASE_URL in .env before running migrations.',
    );
  }
  return url;
}
