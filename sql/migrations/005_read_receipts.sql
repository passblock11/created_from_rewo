-- 005_read_receipts.sql
-- Per-member read cursor for unread message counts.

ALTER TABLE conversation_members
  ADD COLUMN IF NOT EXISTS last_read_at TIMESTAMPTZ NOT NULL DEFAULT NOW();

CREATE INDEX IF NOT EXISTS idx_messages_conversation_sender_created
  ON messages(conversation_id, sender_id, created_at);
