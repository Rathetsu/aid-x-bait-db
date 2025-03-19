-----------------------------------------------------------------------------------------------------------------------
--  `ep.program_videos` table
-----------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS ep.program_videos CASCADE;
CREATE TABLE IF NOT EXISTS ep.program_videos
(
    id           SERIAL PRIMARY KEY,
    program_id   INT NOT NULL,
    video_id     INT NOT NULL,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (program_id) REFERENCES ep.programs (id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES ep.videos (id) ON DELETE CASCADE
);
-----------------------------------------------------------------------------------------------------------------------