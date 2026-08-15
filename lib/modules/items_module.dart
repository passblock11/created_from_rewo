import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../database/database.dart';
import '../database/setup.dart';

/// Items API backed by Postgres when `DATABASE_URL` is set in `.env`.
class ItemsModule implements RewoModule {
  @override
  String get name => 'items';

  @override
  void register(Rewo app) {
    if (!hasDatabase(app)) {
      app.get('/api/items', (_) async => {
            'error': 'Database not configured',
            'hint': 'Set DATABASE_URL in .env and run dart run bin/migrate.dart',
          });
      return;
    }

    final authMiddleware = app.container.isRegistered<TokenService>()
        ? [JwtMiddleware(app.container.resolve<TokenService>().accessJwt).handler]
        : <MiddlewareHandler>[];

    app.get('/api/items', (ctx) async {
      final db = ctx.container.resolve<Database>();
      final items = await db.items.findAll();
      return items.map((item) => item.toJson()).toList();
    });

    app.post('/api/items', (ctx) async {
      final body = await ctx.jsonBody();
      final title = body['title']?.toString() ?? '';
      if (title.isEmpty) throw BadRequestException('title is required');

      final db = ctx.container.resolve<Database>();
      final item = await db.items.create(title: title);
      return item.toJson();
    }, middleware: authMiddleware);

    app.put('/api/items/:id', (ctx) async {
      final id = ctx.param('id')!;
      final body = await ctx.jsonBody();
      final title = body['title']?.toString() ?? '';
      if (title.isEmpty) throw BadRequestException('title is required');

      final db = ctx.container.resolve<Database>();
      try {
        final item = await db.items.update(id: id, title: title);
        return item.toJson();
      } on StateError catch (e) {
        if (e.message.contains('not found')) {
          throw NotFoundException('Item $id not found');
        }
        rethrow;
      }
    }, middleware: authMiddleware);

    app.delete('/api/items/:id', (ctx) async {
      final id = ctx.param('id')!;
      final db = ctx.container.resolve<Database>();
      try {
        await db.items.delete(id);
        return {'deleted': true, 'id': id};
      } on StateError catch (e) {
        if (e.message.contains('not found')) {
          throw NotFoundException('Item $id not found');
        }
        rethrow;
      }
    }, middleware: authMiddleware);

    app.get('/api/items/:id', (ctx) async {
      final id = ctx.param('id')!;
      final db = ctx.container.resolve<Database>();
      final item = await db.items.findById(id);
      if (item == null) throw NotFoundException('Item $id not found');
      return item.toJson();
    });
  }
}
