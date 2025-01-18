------------------------------------------------------------------------------
-- The `visits` schema
------------------------------------------------------------------------------
CREATE SCHEMA IF NOT EXISTS visits;
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Function to automatically update the `updated_at` column
------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION visits.update_updated_at_column()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Trigger to automatically update the `updated_at` column on all tables in the schema `visits`
------------------------------------------------------------------------------
DO $$
DECLARE
    table_name TEXT;
BEGIN
    FOR table_name IN
        SELECT t.table_name
        FROM information_schema.tables t
        WHERE t.table_schema = 'visits'
    LOOP
        EXECUTE format(
            'CREATE TRIGGER update_%I_updated_at BEFORE UPDATE ON visits.%I FOR EACH ROW EXECUTE FUNCTION visits.update_updated_at_column()',
            table_name,
            table_name
        );
    END LOOP;
END;
$$;
------------------------------------------------------------------------------
