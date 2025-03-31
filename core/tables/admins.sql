------------------------------------------------------------------------------
-- `core.admins` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.admins CASCADE;
CREATE TABLE core.admins
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL,
    email      VARCHAR(255) UNIQUE,
    password   VARCHAR(255) NOT NULL,
    otp        VARCHAR(255),
    otp_expiry TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_admins_first_name ON core.admins (first_name);
CREATE INDEX IF NOT EXISTS idx_admins_last_name ON core.admins (last_name);
CREATE INDEX IF NOT EXISTS idx_admins_email ON core.admins (email);
CREATE INDEX IF NOT EXISTS idx_admins_created_at ON core.admins (created_at);
CREATE INDEX IF NOT EXISTS idx_admins_updated_at ON core.admins (updated_at);
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- `core.admin_refresh_tokens` table
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.admin_refresh_tokens CASCADE;
CREATE TABLE core.admin_refresh_tokens
(
    id         SERIAL PRIMARY KEY,
    token      VARCHAR(255)             NOT NULL,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    admin_id   INTEGER                  NOT NULL REFERENCES core.admins (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
--------------------------------------------------------------------------------