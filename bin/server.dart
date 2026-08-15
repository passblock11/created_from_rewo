import 'dart:async';

import 'package:dart_serve_testing/app.dart';
import 'package:rewo/rewo.dart';

/// Entry point — compile with: dart compile exe bin/server.dart -o server
///
/// Dev (hot reload): dart run bin/server.dart --dev
/// Production:       dart run bin/server.dart
Future<void> main(List<String> args) async {
  await DevServer.run(
    args: args,
    entrypoint: 'bin/server.dart',
    start: _startServer,
  );
}

Future<void> _startServer(List<String> args) async {
  await DotEnv.load();
  final cliPort = args.isNotEmpty ? int.tryParse(args.first) : null;
  final port = cliPort ?? DotEnv.getInt('PORT', fallback: 8080);

  // ignore: avoid_print
  print('Starting Rewo App on http://localhost:$port');
  await App.run(port: cliPort);

  // Keep the process alive (server + signal handlers run in background).
  await Completer<void>().future;
}
