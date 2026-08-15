# Rewo App

Pure Dart backend using the `postgres` package — **no Node.js or Flutter required**.

## Setup

```bash
cd dart_serve_testing
dart pub get
cp .env.example .env
dart pub global activate rewo
```

## Database

Schema: `sql/migrations/001_initial.sql`

**Migrations** (Dart only):

```bash
dart run bin/migrate.dart
```

## Development

```bash
rewo run --dev
```

## Stack

| Package | Purpose |
|---------|---------|
| `postgres` | Direct Postgres queries + SQL migrations |
| `rewo` | HTTP framework |

## Docker (Render / Fly.io)

```bash
docker build -t dart-serve-testing .
docker run -p 8080:8080 --env-file .env dart-serve-testing
```

Uses `dart:stable` with `dart run` (no Flutter SDK). Set `DART_VM_OPTIONS=--old_gen_heap_size=256` in the Dockerfile to stay within Render's 512MB free tier.
