------------------------------------------------------------------------------
-- `visits.requests` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS visits.requests;
CREATE TABLE visits.requests
(
    id         SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL UNIQUE REFERENCES core.patients (id),
    location_id INTEGER NOT NULL UNIQUE REFERENCES core.locations (id),
    request_date DATE NOT NULL,
    time_slot VARCHAR(255) NOT NULL CHECK (time_slot IN ('8:00-12:00', '12:00-16:00', '16:00-20:00')),
    status     VARCHAR(255) NOT NULL CHECK (status IN ('Pending', 'Accepted', 'Rejected')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------