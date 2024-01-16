-- Title: List Index sizes
-- The following script displays index sizes for all tables in the current database.
-- This version excludes pg_catalog and information_schema tables.
SELECT n.nspname AS schema_name,
       t.relname AS table_name,
       i.relname AS index_name,
       pg_relation_size(i.oid) AS index_size_bytes,
       pg_size_pretty(pg_relation_size(i.oid)) AS index_size_pretty
FROM pg_class t
JOIN pg_index x ON t.oid = x.indrelid
JOIN pg_class i ON i.oid = x.indexrelid
JOIN pg_namespace n ON n.oid = t.relnamespace
WHERE t.relkind = 'r' AND i.relkind = 'i'
and   n.nspname not in ('pg_catalog', 'information_schema')
ORDER BY n.nspname, t.relname, i.relname;