import 'package:rewo/rewo.dart';

import 'modulesList.dart';

/// Application entry — register your modules here.
class App {
  static Future<Rewo> run({int? port}) => ModulesList.run(
        port: port,
      );

  /// For tests — starts server without signal handlers.
  static Future<Rewo> bootstrap({int? port}) =>
      ModulesList.bootstrap(port: port);
}
