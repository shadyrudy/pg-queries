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
select schemaname, relname, pg_size_pretty(pg_total_relation_size(relid)) as size,
    pg_size_pretty(pg_indexes_size(relid)) as indexes_size,
    pg_size_pretty(pg_total_relation_size(reltoastrelid)) as toast_size,
    pg_size_pretty(pg_total_relation_size(relid) + pg_total_relation_size(reltoastrelid) + pg_indexes_size(relid)) as total_size    
from pg_catalog.pg_statio_user_tables
where schemaname not in ('pg_catalog', 'information_schema')
order by pg_total_relation_size(relid) desc;
