import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../database/setup.dart';
import '../generated/index.dart';

/// Items API backed by Prisma when `DATABASE_URL` is set in `.env`.
class ItemsModule implements RewoModule {
  @override
  String get name => 'items';

  @override
  void register(Rewo app) {
    if (!hasPrisma(app)) {
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
      final prisma = ctx.container.resolve<PrismaClient>();
      final items = await prisma.item.findMany();
      items.sort((Item a, Item b) => b.createdAt.compareTo(a.createdAt));
      return items.map((item) => item.toJson()).toList();
    });

    app.post('/api/items', (ctx) async {
      final body = await ctx.jsonBody();
      final title = body['title']?.toString() ?? '';
      if (title.isEmpty) throw BadRequestException('title is required');

      final prisma = ctx.container.resolve<PrismaClient>();
      final item = await prisma.item.create(
        data: CreateItemInput(title: title),
      );
      return item.toJson();
    }, middleware: authMiddleware);

    app.put('/api/items/:id', (ctx) async {
      final id = ctx.param('id')!;
      final body = await ctx.jsonBody();
      final title = body['title']?.toString() ?? '';
      if (title.isEmpty) throw BadRequestException('title is required');

      final prisma = ctx.container.resolve<PrismaClient>();
      try {
        final item = await prisma.item.update(
          where: ItemWhereUniqueInput(id: id),
          data: UpdateItemInput(title: title),
        );
        return item.toJson();
      } on Object catch (e) {
        if (e.toString().contains('not found')) {
          throw NotFoundException('Item $id not found');
        }
        rethrow;
      }
    }, middleware: authMiddleware);

    app.delete('/api/items/:id', (ctx) async {
      final id = ctx.param('id')!;
      final prisma = ctx.container.resolve<PrismaClient>();
      try {
        await prisma.item.delete(where: ItemWhereUniqueInput(id: id));
        return {'deleted': true, 'id': id};
      } on Object catch (e) {
        if (e.toString().contains('not found')) {
          throw NotFoundException('Item $id not found');
        }
        rethrow;
      }
    }, middleware: authMiddleware);

    app.get('/api/items/:id', (ctx) async {
      final id = ctx.param('id')!;
      final prisma = ctx.container.resolve<PrismaClient>();
      final item = await prisma.item.findUnique(
        where: ItemWhereUniqueInput(id: id),
      );
      if (item == null) throw NotFoundException('Item $id not found');
      return item.toJson();
    });
  }
}
