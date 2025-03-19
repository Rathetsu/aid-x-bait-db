------------------------------------------------------------------------------
-- `core.patients` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.patients CASCADE;
CREATE TABLE core.patients
(
    id         SERIAL PRIMARY KEY,
    user_id    INTEGER NOT NULL UNIQUE REFERENCES core.users (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- `core.patient_sheets` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.patient_sheets;
CREATE TABLE core.patient_sheets
(
    id         SERIAL PRIMARY KEY,
    patient_id INTEGER      NOT NULL UNIQUE REFERENCES core.patients (id),
    sheet_type VARCHAR(255) NOT NULL, -- Add CHECK constraint later
    sheet_data JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- `core.patient_addresses` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.patient_addresses;
CREATE TABLE core.patient_addresses
(
    id                    SERIAL PRIMARY KEY,
    patient_id            INTEGER      NOT NULL REFERENCES core.patients (id),
    address_type          VARCHAR(255) NOT NULL CHECK (address_type IN ('House', 'Apartment')),
    address_label         VARCHAR(255) NOT NULL,
    latitude              DECIMAL(9, 6),
    longitude             DECIMAL(9, 6),
    governorate           VARCHAR(255) NOT NULL,
    city                  VARCHAR(255) NOT NULL,
    street                VARCHAR(255) NOT NULL,
    building_name         VARCHAR(255),
    floor                 VARCHAR(255),
    apartment             VARCHAR(255),
    additional_directions TEXT,
    phone                 VARCHAR(255),
    is_primary            BOOLEAN                  DEFAULT FALSE,
    is_deleted            BOOLEAN                  DEFAULT FALSE,
    created_at            TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at            TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
-- Ensure only one primary address per patient
CREATE UNIQUE INDEX unique_primary_address_per_patient ON core.patient_addresses (patient_id) WHERE is_primary;
CREATE INDEX idx_patient_addresses_latitude ON core.patient_addresses (latitude);
CREATE INDEX idx_patient_addresses_longitude ON core.patient_addresses (longitude);
CREATE INDEX idx_patient_addresses_governorate ON core.patient_addresses (governorate);
CREATE INDEX idx_patient_addresses_city ON core.patient_addresses (city);
CREATE INDEX idx_patient_addresses_phone ON core.patient_addresses (phone);
CREATE INDEX idx_patient_addresses_is_primary ON core.patient_addresses (is_primary);
CREATE INDEX idx_patient_addresses_is_deleted ON core.patient_addresses (is_deleted);
------------------------------------------------------------------------------