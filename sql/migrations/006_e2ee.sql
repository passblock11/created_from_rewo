-- 006_e2ee.sql
-- Public key storage for DM end-to-end encryption (ciphertext in messages.body).

CREATE TABLE IF NOT EXISTS user_e2ee_keys (
  user_id TEXT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  public_key TEXT NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE messages
  ADD COLUMN IF NOT EXISTS e2ee_version SMALLINT NOT NULL DEFAULT 0;
