------------------------------------------------------------------------------
-- `store.products` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS store.products;
CREATE TABLE store.products
(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(255)   NOT NULL,
    description      TEXT,
    price            NUMERIC(10, 2) NOT NULL,
    discounted_price NUMERIC(10, 2),
    currency         VARCHAR(5)     NOT NULL  DEFAULT 'L.E',
    stock            INTEGER        NOT NULL,
    main_image_url   TEXT,
    images_url       TEXT[],
    category_id      INTEGER        NOT NULL REFERENCES store.categories (id),
    isBestSeller     BOOLEAN                  DEFAULT FALSE,
    isFeatured       BOOLEAN                  DEFAULT FALSE,
    isAvailable      BOOLEAN                  DEFAULT TRUE,
    isForRent        BOOLEAN                  DEFAULT FALSE,
    rent_term        VARCHAR(50)              DEFAULT 'per_day',
    isFreeShipping   BOOLEAN                  DEFAULT FALSE,
    tags             VARCHAR(50)[],
    created_at       TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at       TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_products_name ON store.products (name);
CREATE INDEX IF NOT EXISTS idx_products_currency ON store.products (currency);
CREATE INDEX IF NOT EXISTS idx_products_isBestSeller ON store.products (isBestSeller);
CREATE INDEX IF NOT EXISTS idx_products_isFeatured ON store.products (isFeatured);
CREATE INDEX IF NOT EXISTS idx_products_isAvailable ON store.products (isAvailable);
CREATE INDEX IF NOT EXISTS idx_products_isForRent ON store.products (isForRent);
CREATE INDEX IF NOT EXISTS idx_products_isFreeShipping ON store.products (isFreeShipping);
CREATE INDEX IF NOT EXISTS idx_products_created_at ON store.products (created_at);
CREATE INDEX IF NOT EXISTS idx_products_updated_at ON store.products (updated_at);
------------------------------------------------------------------------------