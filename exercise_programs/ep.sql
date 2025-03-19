------------------------------------------------------------------------------
-- The `ep` schema
------------------------------------------------------------------------------
CREATE SCHEMA IF NOT EXISTS ep;
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- function to automatically update the `updated_at` column
------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION ep.update_updated_at_column()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Trigger to automatically update the `updated_at` column on all tables in the schema `ep`
------------------------------------------------------------------------------
DO $$
DECLARE
    table_name TEXT;
BEGIN
    FOR table_name IN
        SELECT t.table_name
        FROM information_schema.tables t
        WHERE t.table_schema = 'ep'
    LOOP
        EXECUTE format(
            'CREATE TRIGGER update_%I_updated_at BEFORE UPDATE ON ep.%I FOR EACH ROW EXECUTE FUNCTION ep.update_updated_at_column()',
            table_name,
            table_name
        );
    END LOOP;
END;
$$;
------------------------------------------------------------------------------