------------------------------------------------------------------------------
-- `core.admins` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.admins;
CREATE TABLE core.admins
(
    id         SERIAL PRIMARY KEY,
    user_id    INTEGER NOT NULL UNIQUE REFERENCES core.users (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------