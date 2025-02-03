------------------------------------------------------------------------------
-- `visits.therapist_notifications` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS visits.therapist_notifications;
CREATE TABLE visits.therapist_notifications
(
    id           SERIAL PRIMARY KEY,
    request_id   INTEGER      NOT NULL UNIQUE REFERENCES visits.requests (id),
    therapist_id INTEGER      NOT NULL UNIQUE REFERENCES core.therapists (id),
    status       VARCHAR(255) NOT NULL CHECK (status IN ('Pending', 'Accepted', 'Rejected')),
    responded_at TIMESTAMP WITH TIME ZONE,
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at   TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------