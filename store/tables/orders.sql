------------------------------------------------------------------------------
-- `store.orders` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS store.orders;
CREATE TABLE store.orders
(
    id                  SERIAL PRIMARY KEY,
    order_type          VARCHAR(10)    NOT NULL CHECK (order_type IN ('purchase', 'rental')),
    requires_shipping   BOOLEAN        NOT NULL  DEFAULT FALSE,
    shipping_address_id INTEGER REFERENCES core.patient_addresses (id),
    billing_address_id  INTEGER REFERENCES core.patient_addresses (id),
    total_amount        NUMERIC(10, 2) NOT NULL  DEFAULT 0,
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at          TIMESTAMP WITH TIME ZONE
);
CREATE INDEX idx_orders_order_type ON store.orders (order_type);
CREATE INDEX idx_orders_requires_shipping ON store.orders (requires_shipping);
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- `store.order_items` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS store.order_items;
CREATE TABLE store.order_items
(
    id                SERIAL PRIMARY KEY,
    order_id          INTEGER        NOT NULL REFERENCES store.orders (id) ON DELETE CASCADE,
    product_id        INTEGER        NOT NULL REFERENCES store.products (id),
    quantity          INTEGER        NOT NULL  DEFAULT 1,
    price_at_purchase NUMERIC(10, 2) NOT NULL,
    rental_start_date DATE,
    rental_end_date   DATE,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at        TIMESTAMP WITH TIME ZONE
);
CREATE INDEX idx_order_items_rental_start_date ON store.order_items (rental_start_date);
CREATE INDEX idx_order_items_rental_end_date ON store.order_items (rental_end_date);
------------------------------------------------------------------------------