# Pure Dart server — no Flutter SDK required.
# AOT compile (dart compile exe) is blocked by rewo's codegen deps, so we use dart run.
FROM dart:stable

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

COPY bin/ bin/
COPY lib/ lib/
COPY sql/ sql/
COPY analysis_options.yaml analysis_options.yaml

ENV HOST=0.0.0.0
ENV PORT=8080
# Keep heap modest on Render's 512MB free tier.
ENV DART_VM_OPTIONS=--old_gen_heap_size=256

EXPOSE 8080

CMD ["dart", "run", "bin/server.dart"]
