import 'dart:async';

import 'package:dart_serve_testing/app.dart';
import 'package:rewo/rewo.dart';

Future<void> main(List<String> args) async {
  final devMode = args.contains('--dev') || args.contains('-d');
  if (devMode) {
    await DevServer.run(
      args: args,
      entrypoint: 'bin/server.dart',
      start: _startServer,
    );
    return;
  }

  await _startServer(args);
}

Future<void> _startServer(List<String> args) async {
  await DotEnv.load();
  final port = DevServer.resolvedPort(args);

  // ignore: avoid_print
  print('Starting Rewo App on http://0.0.0.0:$port');
  await App.run(port: port);

  await Completer<void>().future;
}
