# Rewo App

Pure Dart backend using [prisma_flutter_connector](https://pub.dev/packages/prisma_flutter_connector) — **no Node.js required**.

## Setup

```bash
cd dart_serve_testing
dart pub get
cp .env.example .env
dart pub global activate rewo
```

## Database

Schema: `prisma/schema.prisma`

**Migrations** (Dart only):

```bash
dart run bin/migrate.dart
```

**Regenerate client** (after schema changes):

```bash
dart run prisma_flutter_connector:generate \
  --schema prisma/schema.prisma \
  --output lib/generated \
  --server

dart run build_runner build --delete-conflicting-outputs
```

Generated client: `lib/generated/`

## Development

```bash
rewo run --dev
```

## Stack

| Package | Purpose |
|---------|---------|
| `prisma_flutter_connector` | Prisma-style ORM, direct Postgres/Supabase |
| `rewo` | HTTP framework |
| `postgres` | SQL migrations (`bin/migrate.dart`) |
