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
sudo -u "${APP_USER}" git fetch origin main
sudo -u "${APP_USER}" git reset --hard origin/main

echo "==> Installing dependencies..."
sudo -u "${APP_USER}" dart pub get

echo "==> Running database migrations..."
sudo -u "${APP_USER}" dart run bin/migrate.dart

echo "==> Compiling native binary..."
sudo -u "${APP_USER}" dart compile exe bin/server.dart -o server.new

echo "==> Swapping binary and restarting service..."
systemctl stop dart-serve-testing
mv -f server.new server
chmod +x "${APP_DIR}/server"
chown "${APP_USER}:${APP_USER}" "${APP_DIR}/server"

echo "==> Installing systemd service..."
cp "${APP_DIR}/deploy/systemd/dart-serve-testing.service" /etc/systemd/system/
systemctl daemon-reload
systemctl enable dart-serve-testing
systemctl start dart-serve-testing

echo "==> Updating nginx (WebSocket upgrade support)..."
NGINX_SITE=/etc/nginx/sites-available/dart-serve-testing
if [[ -f "${APP_DIR}/deploy/nginx/dart-serve-testing.conf" ]]; then
  cp "${APP_DIR}/deploy/nginx/dart-serve-testing.conf" "${NGINX_SITE}"
  ln -sf "${NGINX_SITE}" /etc/nginx/sites-enabled/dart-serve-testing
  rm -f /etc/nginx/sites-enabled/default
  nginx -t
  systemctl reload nginx
fi

echo "==> Checking push notification config..."
if ! grep -qE '^FCM_SERVICE_ACCOUNT_PATH=|^FCM_SERVER_KEY=' "${APP_DIR}/.env" 2>/dev/null; then
  if ! compgen -G "${APP_DIR}/rewo-*.json" > /dev/null; then
    echo "⚠️  WARNING: FCM not configured — message/call push notifications will NOT work."
    echo "    Copy your Firebase service account JSON to ${APP_DIR}/rewo-*.json"
    echo "    or set FCM_SERVICE_ACCOUNT_PATH in ${APP_DIR}/.env"
  fi
fi

echo "==> Service status:"
systemctl --no-pager status dart-serve-testing || true

echo "==> Health check..."
for attempt in 1 2 3 4 5; do
  if curl -fsS http://127.0.0.1:8080/health; then
    echo ""
    echo "✅ Health check passed."
    break
  fi
  if [[ "${attempt}" -eq 5 ]]; then
    echo "❌ Health check failed after 5 attempts."
    journalctl -u dart-serve-testing -n 30 --no-pager || true
    exit 1
  fi
  echo "Waiting for service (attempt ${attempt}/5)..."
  sleep 3
done

echo ""
echo "✅ Deploy complete."
