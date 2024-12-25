------------------------------------------------------------------------------
-- `core.users` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.users;
CREATE TABLE core.users
(
    id           SERIAL PRIMARY KEY,
    phone_number VARCHAR(255) NOT NULL UNIQUE,
    email        VARCHAR(255) NOT NULL UNIQUE,
    clerk_id     VARCHAR(255) NOT NULL UNIQUE,
    first_name   VARCHAR(50),
    last_name    VARCHAR(50),
    address      TEXT,
    latitude     NUMERIC(9, 6),
    longitude    NUMERIC(9, 6),
    payment_info JSONB,
    last_login   TIMESTAMP WITH TIME ZONE,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_users_phone_number ON core.users (phone_number);
CREATE INDEX IF NOT EXISTS idx_users_email ON core.users (email);
CREATE INDEX IF NOT EXISTS idx_users_clerk_id ON core.users (clerk_id);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON core.users (created_at);
CREATE INDEX IF NOT EXISTS idx_users_updated_at ON core.users (updated_at);
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Trigger to update the `updated_at` column
------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS update_users_updated_at ON core.users;
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON core.users
    FOR
        EACH ROW
EXECUTE FUNCTION core.update_updated_at_column();
------------------------------------------------------------------------------