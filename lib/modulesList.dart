import 'package:rewo/rewo.dart';
import 'database/setup.dart';
import 'modules/auth_module.dart';
import 'modules/items_module.dart';
import 'modules/get_json_data.dart';

class ModulesList {
  static List<RewoModule> get modules => [
        AuthModule(),
        ItemsModule(),
        GetJsonDataModule(),
      ];

  static Future<Rewo> run({int? port}) => RewoBootstrap.run(
        modules: modules,
        serviceName: 'Rewo App',
        configureDatabase: configureDatabase,
        databasePlugins: const [],
        port: port,
      );

  /// For tests — starts server without signal handlers.
  static Future<Rewo> bootstrap({int? port}) => RewoBootstrap.start(
        modules: modules,
        serviceName: 'Rewo App',
        configureDatabase: configureDatabase,
        databasePlugins: const [],
        port: port,
      );
}
