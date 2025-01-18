------------------------------------------------------------------------------
-- `core.therapists` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.therapists;
CREATE TABLE core.therapists
(
    id           SERIAL PRIMARY KEY,
    user_id      INTEGER NOT NULL UNIQUE REFERENCES core.users (id),
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- `core.therapist_locations` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.therapist_locations;
CREATE TABLE core.therapist_locations
(
    id           SERIAL PRIMARY KEY,
    therapist_id INTEGER NOT NULL UNIQUE REFERENCES core.therapists (id),
    location_id  INTEGER NOT NULL UNIQUE REFERENCES core.locations (id),
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------