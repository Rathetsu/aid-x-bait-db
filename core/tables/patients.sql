------------------------------------------------------------------------------
-- `core.patients` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS core.patients;
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
    patient_id INTEGER NOT NULL UNIQUE REFERENCES core.patients (id),
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
    patient_id            INTEGER      NOT NULL UNIQUE REFERENCES core.patients (id),
    address_type          VARCHAR(255) NOT NULL CHECK (address_type IN ('House', 'Apartment')),
    address_label         VARCHAR(255) NOT NULL,
    governorate           VARCHAR(255) NOT NULL,
    city                  VARCHAR(255) NOT NULL,
    street                VARCHAR(255) NOT NULL,
    building_name         VARCHAR(255),
    floor                 VARCHAR(255),
    apartment             VARCHAR(255),
    additional_directions TEXT,
    phone                 VARCHAR(255),
    is_deleted            BOOLEAN DEFAULT FALSE,
    created_at            TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at            TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX idx_patient_addresses_governorate ON core.patient_addresses (governorate);
CREATE INDEX idx_patient_addresses_city ON core.patient_addresses (city);
CREATE INDEX idx_patient_addresses_phone ON core.patient_addresses (phone);
------------------------------------------------------------------------------