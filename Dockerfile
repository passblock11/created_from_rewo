# Build — compile native binary (low memory at runtime)
FROM dart:stable AS build

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

COPY bin/ bin/
COPY lib/ lib/
COPY sql/ sql/
COPY analysis_options.yaml analysis_options.yaml

RUN dart pub get --offline
RUN dart compile exe bin/server.dart -o server

# Runtime — minimal Debian image
FROM debian:bookworm-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=build /app/server /app/server

ENV HOST=0.0.0.0
ENV PORT=8080

EXPOSE 8080

CMD ["./server"]
