-- Title: List all tables in the current database

-- List all tables in a specific schema in the current database
-- and excludes tables in the pg_catalog and information_schema schemas
SELECT t.table_schema, 
        t.table_name
FROM information_schema.tables as t
WHERE t.table_schema = 'public' -- Change schema name as needed
AND t.table_type = 'BASE TABLE'
AND t.table_schema not in ('pg_catalog', 'information_schema')
ORDER BY t.table_schema, t.table_name;

-- List all tables in all schemas in the current database
-- using a psql command
\dt *.*
