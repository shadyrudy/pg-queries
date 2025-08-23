-- Title: List Index usage
-- The following script displays index usage for all tables in the current database.
-- This version excludes pg_catalog and information_schema tables.
SELECT   i.schemaname AS schema_name
       , i.relname AS table_name
       , i.indexrelname AS index_name
       , i.idx_scan AS index_scans
       , i.idx_tup_read as index_tuples_read
       , i.idx_tup_fetch as index_tuples_fetched
FROM   pg_stat_user_indexes as i
WHERE  i.schemaname not in ('pg_catalog', 'information_schema')
ORDER BY i.schemaname, i.relname, i.indexrelname;