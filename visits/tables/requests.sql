------------------------------------------------------------------------------
-- `visits.requests` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS visits.requests CASCADE;
CREATE TABLE visits.requests
(
    id           SERIAL PRIMARY KEY,
    patient_id   INTEGER      NOT NULL UNIQUE REFERENCES core.patients (id),
    location_id  INTEGER      NOT NULL UNIQUE REFERENCES core.locations (id),
    request_date DATE         NOT NULL,
    time_slot    VARCHAR(255) NOT NULL CHECK (time_slot IN ('8:00-12:00', '12:00-16:00', '16:00-20:00')),
    gender       VARCHAR(255) NOT NULL CHECK (gender IN ('Male', 'Female')),
    status       VARCHAR(255) NOT NULL CHECK (status IN ('Pending', 'Accepted', 'Rejected')),
    queue        VARCHAR(255) NOT NULL CHECK (queue IN ('Pending Requests', 'Review Queue')),
    attached_docs JSONB,
    notes        TEXT,
    is_archived  BOOLEAN DEFAULT FALSE,
    is_reviewed  BOOLEAN DEFAULT FALSE,
    reviewed_at  TIMESTAMP WITH TIME ZONE,
    reviewed_by  INTEGER REFERENCES core.admins (id),
    is_accepted  BOOLEAN DEFAULT FALSE,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------