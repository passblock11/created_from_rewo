# Deploy on Oracle Cloud (Always Free ARM)

Professional setup for **1 vCPU / 1 GB RAM** Ampere instance:

```
Internet → Oracle Firewall → Nginx (:80/:443) → Rewo API binary (:8080) → Supabase Postgres
                ↑
           systemd (auto-restart on crash + reboot)
```

**Why this stack?**
- **Native binary** — uses ~50–100 MB RAM (fits 1 GB easily)
- **systemd** — restarts on failure, starts on boot
- **Nginx** — standard reverse proxy, free SSL with Let's Encrypt
- **No Docker** — saves ~200 MB RAM on a small VM

---

## Part 1 — Oracle Cloud (browser)

### 1.1 Create the VM (if not done)

1. **Compute → Instances → Create instance**
2. **Image:** Ubuntu 22.04 or 24.04 (aarch64)
3. **Shape:** `VM.Standard.A1.Flex` — 1 OCPU, 1 GB memory
4. **Networking:** assign a **public IP**
5. **SSH key:** upload your public key (or generate and download private key)

### 1.2 Open firewall ports (required!)

Oracle blocks traffic until you allow it:

1. Go to your instance → click the **Subnet** link
2. Click the **Security List** for that subnet
3. **Add Ingress Rules:**

| Source CIDR | Protocol | Dest Port | Description |
|-------------|----------|-----------|-------------|
| `0.0.0.0/0` | TCP | 22 | SSH |
| `0.0.0.0/0` | TCP | 80 | HTTP |
| `0.0.0.0/0` | TCP | 443 | HTTPS |

Save each rule.

---

## Part 2 — SSH into the server

From your Mac:

```bash
ssh -i ~/.ssh/your_oracle_key ubuntu@YOUR_PUBLIC_IP
```

Replace `YOUR_PUBLIC_IP` with the instance's public IP from the Oracle console.

---

## Part 3 — One-time server setup

```bash
# Clone the repo
sudo git clone https://github.com/passblock11/created_from_rewo.git /opt/dart-serve-testing
sudo chown -R ubuntu:ubuntu /opt/dart-serve-testing

# Install Dart, nginx, firewall
cd /opt/dart-serve-testing
sudo bash deploy/oracle/setup-server.sh
```

---

## Part 4 — Production environment file

```bash
sudo -u ubuntu cp /opt/dart-serve-testing/.env.example /opt/dart-serve-testing/.env
sudo -u ubuntu nano /opt/dart-serve-testing/.env
```

Set these values (example — use your real secrets):

```env
PORT=8080
HOST=127.0.0.1
ENV=production
JWT_SECRET=use-a-long-random-string-at-least-32-chars
LOG_REQUESTS=true
SERVER_ENGINE=shelf
STORAGE_PATH=/opt/dart-serve-testing/storage
RATE_LIMIT=100

DATABASE_URL=postgresql://...@....supabase.com:6543/postgres?pgbouncer=true
DIRECT_URL=postgresql://...@....supabase.com:5432/postgres
```

| Setting | Why |
|---------|-----|
| `HOST=127.0.0.1` | App only listens locally; nginx faces the internet |
| `ENV=production` | Enables strict JWT checks |
| `JWT_SECRET` | **Min 16 chars** in production — use a password generator |
| `DATABASE_URL` | Supabase **pooler** port `6543` for the running app |
| `DIRECT_URL` | Supabase port `5432` for migrations |

Lock down permissions:

```bash
chmod 600 /opt/dart-serve-testing/.env
```

> **Security:** Never commit `.env`. Rotate secrets if they were ever exposed.

---

## Part 5 — First deploy

```bash
cd /opt/dart-serve-testing
sudo bash deploy/oracle/deploy.sh
```

Verify:

```bash
curl http://127.0.0.1:8080/health
# {"status":"alive"}
```

---

## Part 6 — Nginx reverse proxy

### Option A — IP only (quick test)

```bash
sudo cp /opt/dart-serve-testing/deploy/nginx/dart-serve-testing.conf \
  /etc/nginx/sites-available/dart-serve-testing

# Use _ as server_name for IP-based access
sudo sed -i 's/YOUR_DOMAIN/_/' /etc/nginx/sites-available/dart-serve-testing

sudo ln -sf /etc/nginx/sites-available/dart-serve-testing /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t && sudo systemctl reload nginx
```

Test from your laptop:

```bash
curl http://YOUR_PUBLIC_IP/health
```

### Option B — Domain + HTTPS (recommended for production)

1. Point your domain's **A record** to `YOUR_PUBLIC_IP`
2. Edit nginx config:

```bash
sudo nano /etc/nginx/sites-available/dart-serve-testing
# Change YOUR_DOMAIN to api.yourdomain.com
```

3. Enable site and get free SSL:

```bash
sudo ln -sf /etc/nginx/sites-available/dart-serve-testing /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t && sudo systemctl reload nginx

sudo apt-get install -y certbot python3-certbot-nginx
sudo certbot --nginx -d api.yourdomain.com
```

Certbot auto-renews. Test:

```bash
curl https://api.yourdomain.com/health
```

---

## Part 7 — Useful commands (day-to-day)

```bash
# App logs
sudo journalctl -u dart-serve-testing -f

# Restart after .env change
sudo systemctl restart dart-serve-testing

# Deploy new code from GitHub
cd /opt/dart-serve-testing && sudo bash deploy/oracle/deploy.sh

# Check memory (should be well under 1 GB)
free -h
ps aux --sort=-%mem | head
```

---

## Part 8 — Test your API

```bash
# Health
curl https://api.yourdomain.com/health

# Signup
curl -X POST https://api.yourdomain.com/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"you@example.com","password":"SecurePass1!","name":"You"}'
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Can't SSH | Check Oracle ingress rule for port 22; verify public IP |
| Connection refused on :80 | Run `sudo ufw status`; check Oracle ingress for 80/443 |
| `502 Bad Gateway` | App not running: `sudo systemctl status dart-serve-testing` |
| `JWT_SECRET must be set` | Set `ENV=production` and a 16+ char `JWT_SECRET` in `.env` |
| DB errors | Check `DATABASE_URL` / `DIRECT_URL`; run `dart run bin/migrate.dart` |
| Out of memory | You're using the binary (good). Avoid Docker on 1 GB |

---

## Architecture summary

```
┌─────────────────────────────────────────┐
│  Oracle Cloud VM (ARM, 1 GB RAM)        │
│                                         │
│  systemd ──► /opt/.../server (binary)   │
│                    ▲                    │
│  nginx :80/:443 ───┘  (127.0.0.1:8080) │
└─────────────────────────────────────────┘
                    │
                    ▼
            Supabase Postgres (cloud)
```

This is the same pattern used by most production APIs: **reverse proxy + process manager + compiled binary**.
