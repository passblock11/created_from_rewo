# Automated Deploy with GitHub Actions

Every push to `main` will:

1. Run `dart analyze` on GitHub
2. SSH into your Oracle VM
3. Run `deploy/oracle/deploy.sh` (pull → migrate → compile → restart)
4. Verify `/health` responds

---

## Overview

```
You push to main
      ↓
GitHub Actions (free tier)
      ↓ SSH
Oracle VM → git pull → build → systemctl restart
      ↓
http://YOUR_IP/health  ✅
```

---

## Part 1 — SSH key for GitHub Actions → Oracle VM

GitHub needs an SSH key to log into your server.

### 1.1 Generate a deploy key (on your Mac)

```bash
ssh-keygen -t ed25519 -C "github-actions-oracle" -f ~/.ssh/oracle_github_actions -N ""
```

This creates:

- `~/.ssh/oracle_github_actions` — **private** (goes to GitHub Secrets)
- `~/.ssh/oracle_github_actions.pub` — **public** (goes on the server)

### 1.2 Add public key to Oracle VM

```bash
# Copy public key to server (replace IP)
ssh-copy-id -i ~/.ssh/oracle_github_actions.pub ubuntu@140.245.8.15
```

Or manually on the server:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
# Paste the contents of oracle_github_actions.pub on a new line
chmod 600 ~/.ssh/authorized_keys
```

### 1.3 Test login with the new key

```bash
ssh -i ~/.ssh/oracle_github_actions ubuntu@140.245.8.15
```

Must log in **without a password**. Type `exit` when done.

---

## Part 2 — Allow deploy script without password (sudo)

GitHub Actions runs `sudo deploy.sh`. Allow it without typing a password:

**On the Oracle VM:**

```bash
echo 'ubuntu ALL=(ALL) NOPASSWD: /opt/dart-serve-testing/deploy/oracle/deploy.sh' | sudo tee /etc/sudoers.d/dart-serve-deploy
sudo chmod 440 /etc/sudoers.d/dart-serve-deploy
```

Verify:

```bash
sudo /opt/dart-serve-testing/deploy/oracle/deploy.sh
```

Should complete without asking for a password.

---

## Part 3 — Let the server `git pull` from GitHub

The deploy script runs `git pull` on the VM. The server needs permission to read your repo.

### Option A — Public repo (simplest)

If `created_from_rewo` is **public**, ensure remote is HTTPS:

```bash
cd /opt/dart-serve-testing
sudo chown -R ubuntu:ubuntu /opt/dart-serve-testing
git remote -v
# Should show: https://github.com/passblock11/created_from_rewo.git

sudo -u ubuntu git pull origin main
```

### Option B — Private repo (deploy key)

**On the Oracle VM as `ubuntu`:**

```bash
ssh-keygen -t ed25519 -f ~/.ssh/github_repo_deploy -N ""
cat ~/.ssh/github_repo_deploy.pub
```

Copy the output.

**On GitHub:**

1. Repo → **Settings → Deploy keys → Add deploy key**
2. Title: `oracle-vm`
3. Paste the public key
4. Leave **Allow write access** unchecked (read-only is enough)
5. Save

**Back on the VM:**

```bash
cat >> ~/.ssh/config <<'EOF'
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/github_repo_deploy
  IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config

cd /opt/dart-serve-testing
git remote set-url origin git@github.com:passblock11/created_from_rewo.git
git pull origin main
```

---

## Part 4 — GitHub Secrets

1. Open **https://github.com/passblock11/created_from_rewo**
2. **Settings → Secrets and variables → Actions → New repository secret**

Add these **3 secrets**:

| Secret name | Value |
|-------------|--------|
| `ORACLE_HOST` | `140.245.8.15` (your VM public IP) |
| `ORACLE_USER` | `ubuntu` |
| `ORACLE_SSH_KEY` | Full private key from `~/.ssh/oracle_github_actions` |

For `ORACLE_SSH_KEY`, paste **everything** including:

```
-----BEGIN OPENSSH PRIVATE KEY-----
...
-----END OPENSSH PRIVATE KEY-----
```

---

## Part 5 — Push the workflow file

The workflow is already in the repo at `.github/workflows/deploy-oracle.yml`.

If you haven't pulled it on GitHub yet, commit and push from your Mac:

```bash
cd dart_serve_testing
git add .github/workflows/deploy-oracle.yml DEPLOY_GITHUB_ACTIONS.md
git commit -m "Add GitHub Actions deploy to Oracle Cloud"
git push origin main
```

> **Note:** The first push that includes the workflow will trigger a deploy. Complete Parts 1–4 first, or the first run may fail.

---

## Part 6 — Watch it run

1. GitHub → **Actions** tab
2. Click **Deploy to Oracle Cloud**
3. You should see:
   - ✅ **Analyze** — `dart analyze`
   - ✅ **Deploy** — SSH + deploy script + health check

Manual deploy anytime: **Actions → Deploy to Oracle Cloud → Run workflow**

---

## Part 7 — Your day-to-day workflow

```bash
# 1. Code locally
# 2. Commit and push
git add .
git commit -m "Add new feature"
git push origin main

# 3. GitHub Actions deploys automatically (~2–3 min)
# 4. Test
curl http://140.245.8.15/health
```

You never SSH to deploy manually again (unless something breaks).

---

## Troubleshooting

| Error in Actions | Fix |
|------------------|-----|
| `Permission denied (publickey)` | Check `ORACLE_SSH_KEY` secret; verify public key in `authorized_keys` |
| `sudo: a password is required` | Run Part 2 (sudoers) on the VM |
| `git pull` failed | Part 3 — deploy key or public repo access |
| `dart: command not found` | Dart not in PATH for `ubuntu` — symlink `/usr/local/bin/dart` |
| Health check failed | `sudo journalctl -u dart-serve-testing -n 50` on VM |
| `Text file busy` on compile | Fixed in latest `deploy.sh` — compile to `server.new`, stop service, then swap |
| Analyze failed | Fix `dart analyze` errors locally before pushing |

---

## Security tips

- Use a **dedicated** SSH key only for GitHub Actions (not your personal key)
- Never commit `.env` — secrets stay only on the VM
- Deploy key is **read-only** (no write access to GitHub)
- Rotate keys if they are ever exposed

---

## What gets deployed?

The workflow does **not** copy files from GitHub to the server directly. It SSHs in and runs your existing script:

```bash
sudo /opt/dart-serve-testing/deploy/oracle/deploy.sh
```

That script: `git pull` → `dart pub get` → migrations → `dart compile exe` → `systemctl restart`.

Your `.env` on the server is **never overwritten** by CI.
