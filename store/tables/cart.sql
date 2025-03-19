------------------------------------------------------------------------------
-- `store.cart` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS store.cart CASCADE;
CREATE TABLE IF NOT EXISTS store.cart (
    id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL REFERENCES core.patients(id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES store.products(id) ON DELETE CASCADE,
    quantity INT NOT NULL CHECK (quantity > 0),
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
------------------------------------------------------------------------------