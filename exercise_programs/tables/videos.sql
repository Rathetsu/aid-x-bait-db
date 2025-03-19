-----------------------------------------------------------------------------------------------------------------------
--  `ep.videos` table
-----------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS ep.videos CASCADE;
CREATE TABLE IF NOT EXISTS ep.videos
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    description  TEXT,
    bucket_path  VARCHAR(255) NOT NULL,
    signed_url   VARCHAR(255) NOT NULL,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_videos_created_at ON ep.videos (created_at);
CREATE INDEX IF NOT EXISTS idx_videos_updated_at ON ep.videos (updated_at);
-----------------------------------------------------------------------------------------------------------------------