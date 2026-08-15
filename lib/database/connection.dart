import 'package:postgres/postgres.dart';

Future<Connection> openDatabaseConnection(String connectionString) async {
  final uri = Uri.parse(connectionString);
  final endpoint = _endpointFromUri(uri);
  final sslMode = _sslModeFor(uri);

  return Connection.open(
    endpoint,
    settings: ConnectionSettings(sslMode: sslMode),
  );
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
