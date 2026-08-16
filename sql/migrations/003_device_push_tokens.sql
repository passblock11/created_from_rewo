-- 003_device_push_tokens.sql
-- FCM/APNs device tokens for incoming-call push when the app is killed.

CREATE TABLE IF NOT EXISTS device_push_tokens (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token TEXT NOT NULL,
  platform TEXT NOT NULL CHECK (platform IN ('android', 'ios')),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (user_id, token)
);

CREATE INDEX IF NOT EXISTS idx_device_push_tokens_user_id
  ON device_push_tokens(user_id);
