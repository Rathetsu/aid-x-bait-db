------------------------------------------------------------------------------
-- `store.orders` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS store.orders CASCADE;
CREATE TABLE store.orders
(
    id                  SERIAL PRIMARY KEY,
    order_type          VARCHAR(10)    NOT NULL CHECK (order_type IN ('purchase', 'rental')),
    requires_shipping   BOOLEAN        NOT NULL  DEFAULT FALSE,
    shipping_address_id INTEGER REFERENCES core.patient_addresses (id),
    billing_address_id  INTEGER REFERENCES core.patient_addresses (id),
    total_amount        NUMERIC(10, 2) NOT NULL  DEFAULT 0,
    payment_method      VARCHAR(10)    NOT NULL  DEFAULT 'cash_on_delivery' CHECK (payment_method IN ('cash_on_delivery', 'online')),
    payment_status      VARCHAR(10)    NOT NULL  DEFAULT 'pending' CHECK (payment_status IN ('pending', 'paid', 'failed')),
    order_status        VARCHAR(10)    NOT NULL  DEFAULT 'pending' CHECK (order_status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled')),
    soft_deleted        BOOLEAN        NOT NULL  DEFAULT FALSE,
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at          TIMESTAMP WITH TIME ZONE
);
CREATE INDEX idx_orders_order_type ON store.orders (order_type);
CREATE INDEX idx_orders_requires_shipping ON store.orders (requires_shipping);
CREATE INDEX idx_orders_payment_method ON store.orders (payment_method);
CREATE INDEX idx_orders_payment_status ON store.orders (payment_status);
CREATE INDEX idx_orders_order_status ON store.orders (order_status);
CREATE INDEX idx_orders_soft_deleted ON store.orders (soft_deleted);
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