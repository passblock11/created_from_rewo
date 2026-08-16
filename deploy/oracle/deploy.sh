#!/usr/bin/env bash
# Build and deploy (run after every code update).
# Usage: sudo bash deploy/oracle/deploy.sh
set -euo pipefail

APP_DIR=/opt/dart-serve-testing
APP_USER=ubuntu

if [[ ! -f "${APP_DIR}/pubspec.yaml" ]]; then
  echo "App not found at ${APP_DIR}. Clone first:"
  echo "  sudo git clone https://github.com/passblock11/created_from_rewo.git ${APP_DIR}"
  exit 1
fi

if [[ ! -f "${APP_DIR}/.env" ]]; then
  echo "Missing ${APP_DIR}/.env — copy from .env.example and set production values."
  exit 1
fi

echo "==> Pulling latest code..."
cd "${APP_DIR}"
sudo -u "${APP_USER}" git pull --ff-only

echo "==> Installing dependencies..."
sudo -u "${APP_USER}" dart pub get

echo "==> Running database migrations..."
sudo -u "${APP_USER}" dart run bin/migrate.dart

echo "==> Compiling native binary..."
sudo -u "${APP_USER}" dart compile exe bin/server.dart -o server

chmod +x "${APP_DIR}/server"
chown "${APP_USER}:${APP_USER}" "${APP_DIR}/server"

echo "==> Installing systemd service..."
cp "${APP_DIR}/deploy/systemd/dart-serve-testing.service" /etc/systemd/system/
systemctl daemon-reload
systemctl enable dart-serve-testing
systemctl restart dart-serve-testing

echo "==> Service status:"
systemctl --no-pager status dart-serve-testing || true

echo ""
echo "✅ Deploy complete."
echo "   Local:  curl http://127.0.0.1:8080/health"
echo "   Public: configure nginx + Oracle security list (see DEPLOY_ORACLE.md)"
