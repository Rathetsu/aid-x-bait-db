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
-- Trigger to update the `updated_at` column
------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS update_categories_updated_at ON store.categories;
CREATE TRIGGER update_categories_updated_at
    BEFORE UPDATE
    ON store.categories
    FOR
        EACH ROW
EXECUTE FUNCTION core.update_updated_at_column();
------------------------------------------------------------------------------