-- Title: Table Size
-- The following query returns the size of each table in the current database 
-- (including indexes and toast tables).
select schemaname, relname, pg_size_pretty(pg_total_relation_size(relid)) as size
from pg_catalog.pg_statio_user_tables
order by pg_total_relation_size(relid) desc;

-- The following query returns the size of each table in the current database
-- along with indexes sizes and toast table sizes.
select schemaname, relname, pg_size_pretty(pg_total_relation_size(relid)) as size,
    pg_size_pretty(pg_indexes_size(relid)) as indexes_size,
    pg_size_pretty(pg_total_relation_size(reltoastrelid)) as toast_size
from pg_catalog.pg_statio_user_tables
order by pg_total_relation_size(relid) desc;

-- The following query returns the size of each table in the current database
-- along with index and combined toast table sizes.
-- THis version excludes pg_catalog and information_schema tables.
SELECT nspname AS schemaname,
       relname AS tablename,
       pg_table_size(C.oid) AS table_size,
       pg_indexes_size(C.oid) AS index_size,
       pg_total_relation_size(C.oid) - pg_table_size(C.oid) - pg_indexes_size(C.oid) AS toast_size,
       C.reltuples AS row_estimate
FROM pg_class C LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
AND   relkind = 'r'
ORDER BY pg_total_relation_size(C.oid) DESC;
