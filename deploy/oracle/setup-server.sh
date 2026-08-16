#!/usr/bin/env bash
# One-time Oracle Cloud / Ubuntu ARM setup.
# Run on the VM: bash setup-server.sh
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run as root: sudo bash setup-server.sh"
  exit 1
fi

echo "==> Updating system..."
apt-get update
apt-get upgrade -y

echo "==> Installing packages..."
apt-get install -y curl git nginx ufw ca-certificates gnupg

echo "==> Installing Dart SDK (ARM64)..."
if ! command -v dart >/dev/null 2>&1; then
  wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | gpg --dearmor -o /usr/share/keyrings/dart.gpg
  echo "deb [signed-by=/usr/share/keyrings/dart.gpg arch=arm64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" \
    > /etc/apt/sources.list.d/dart_stable.list
  apt-get update
  apt-get install -y dart
fi

dart --version

echo "==> Creating app directory..."
APP_DIR=/opt/dart-serve-testing
mkdir -p "${APP_DIR}/storage"
chown -R ubuntu:ubuntu "${APP_DIR}"

echo "==> Configuring firewall (ufw)..."
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw allow 'Nginx Full'
ufw --force enable
ufw status

echo "==> Opening ports 80/443 in iptables (Oracle Ubuntu default blocks all except 22)..."
iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
iptables -I INPUT 6 -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
if command -v netfilter-persistent >/dev/null 2>&1; then
  netfilter-persistent save
elif [[ -d /etc/iptables ]]; then
  mkdir -p /etc/iptables
  iptables-save > /etc/iptables/rules.v4
fi

echo "==> Installing systemd service..."
cp "${APP_DIR}/deploy/systemd/dart-serve-testing.service" /etc/systemd/system/ 2>/dev/null \
  || echo "   (Skip: clone repo first, then re-run deploy.sh)"

echo "==> Enabling nginx..."
systemctl enable nginx
systemctl start nginx

echo ""
echo "✅ Server setup complete."
echo ""
echo "Next steps:"
echo "  1. Clone your app into ${APP_DIR}"
echo "  2. Create ${APP_DIR}/.env (production secrets)"
echo "  3. Run: sudo bash ${APP_DIR}/deploy/oracle/deploy.sh"
echo ""
echo "⚠️  Also open ports 80 and 443 in Oracle Cloud → VCN → Security List → Ingress Rules"
