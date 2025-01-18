------------------------------------------------------------------------------
-- The `core` schema
------------------------------------------------------------------------------
CREATE SCHEMA IF NOT EXISTS core;
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- function to automatically update the `updated_at` column
------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION core.update_updated_at_column()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Trigger to automatically update the `updated_at` column on all tables in the schema `core`
------------------------------------------------------------------------------
DO $$
DECLARE
    table_name TEXT;
BEGIN
    FOR table_name IN
        SELECT t.table_name
        FROM information_schema.tables t
        WHERE t.table_schema = 'core'
    LOOP
        EXECUTE format(
            'CREATE TRIGGER update_%I_updated_at BEFORE UPDATE ON core.%I FOR EACH ROW EXECUTE FUNCTION core.update_updated_at_column()',
            table_name,
            table_name
        );
    END LOOP;
END;
$$;
------------------------------------------------------------------------------