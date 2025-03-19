-----------------------------------------------------------------------------------------------------------------------
--  `ep.programs` table
-----------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS ep.programs CASCADE;
CREATE TABLE IF NOT EXISTS ep.programs
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    description  TEXT,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_programs_created_at ON ep.programs (created_at);
CREATE INDEX IF NOT EXISTS idx_programs_updated_at ON ep.programs (updated_at);

-----------------------------------------------------------------------------------------------------------------------