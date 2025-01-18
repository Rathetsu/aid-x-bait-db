------------------------------------------------------------------------------
-- `core.locations` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.locations;
CREATE TABLE core.locations
(
    id         SERIAL PRIMARY KEY,
    location_name    INTEGER NOT NULL UNIQUE REFERENCES core.users (id),
    latitude    DOUBLE PRECISION NOT NULL,
    longitude   DOUBLE PRECISION NOT NULL,
    latitude_delta    DOUBLE PRECISION NOT NULL,
    longitude_delta   DOUBLE PRECISION NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------