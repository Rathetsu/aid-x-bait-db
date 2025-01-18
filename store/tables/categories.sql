------------------------------------------------------------------------------
-- `store.categories` table
------------------------------------------------------------------------------
DROP TABLE IF EXISTS store.categories;
CREATE TABLE store.categories
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description TEXT,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at  TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
------------------------------------------------------------------------------