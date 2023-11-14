-- Title: List all tables in the current database
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE';

-- List all tables in all schemas in the current database
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
ORDER BY table_schema, table_name;

-- List all tables in a specific schema in the current database
-- and exclude system tables
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE'
AND table_name NOT LIKE 'pg_%'
and table_schema != 'information_schema'
ORDER BY table_schema, table_name;

-- List all tables in all schemas in the current database
-- using a psql command
\dt *.*
