-- WhatsApp-style message deletion: delete for everyone + delete for me.

ALTER TABLE messages
  ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS deleted_by TEXT REFERENCES users(id) ON DELETE SET NULL;

CREATE TABLE IF NOT EXISTS user_hidden_messages (
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  message_id TEXT NOT NULL REFERENCES messages(id) ON DELETE CASCADE,
  hidden_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, message_id)
);

CREATE INDEX IF NOT EXISTS idx_user_hidden_messages_user_id
  ON user_hidden_messages(user_id);

CREATE INDEX IF NOT EXISTS idx_messages_deleted_at
  ON messages(conversation_id, deleted_at)
  WHERE deleted_at IS NOT NULL;
