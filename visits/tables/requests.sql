------------------------------------------------------------------------------
-- `visits.requests` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS visits.requests;
CREATE TABLE visits.requests
(
    id         SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL UNIQUE REFERENCES core.patients (id),
    location_id INTEGER NOT NULL UNIQUE REFERENCES core.locations (id),
    status     VARCHAR(255) NOT NULL CHECK (status IN ('Pending', 'Accepted', 'Rejected')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------