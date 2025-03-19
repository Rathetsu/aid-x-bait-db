------------------------------------------------------------------------------
-- `core.user_types` enum type
------------------------------------------------------------------------------
DROP TYPE IF EXISTS core.user_types;
CREATE TYPE core.user_types AS ENUM ('patient', 'therapist', 'consultant', 'admin', 'support');
------------------------------------------------------------------------------
-- `core.users` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.users CASCADE;
CREATE TABLE IF NOT EXISTS core.users
(
    id           SERIAL PRIMARY KEY,
    phone_number VARCHAR(255)    NOT NULL UNIQUE,
    email        VARCHAR(255) UNIQUE,
    clerk_id     VARCHAR(255)    NOT NULL UNIQUE,
    first_name   VARCHAR(50),
    last_name    VARCHAR(50),
    user_type    core.user_types NOT NULL,
    image_url    VARCHAR(255),
    last_login   TIMESTAMP WITH TIME ZONE,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_users_phone_number ON core.users (phone_number);
CREATE INDEX IF NOT EXISTS idx_users_email ON core.users (email);
CREATE INDEX IF NOT EXISTS idx_users_clerk_id ON core.users (clerk_id);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON core.users (created_at);
CREATE INDEX IF NOT EXISTS idx_users_updated_at ON core.users (updated_at);
------------------------------------------------------------------------------------------------------------------------