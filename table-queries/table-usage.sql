-- Title: Table usage 
-- The following query returns the index usage for a particular table.
-- This query uses pg_stat_user_tables.
select schemaname as schema_name,
       relname as table_name,
       seq_scan as sequential_scans,
       seq_tup_read as sequential_tuples_read,
       idx_scan as index_scans,
       idx_tup_fetch as index_tuples_fetched
from   pg_stat_user_tables
where  relname = 'table_name';

-- The following query returns the index usage for all tables in the current database.
-- This query uses pg_stat_user_tables.
select schemaname as schema_name,
       relname as table_name,
       seq_scan as sequential_scans,
       seq_tup_read as sequential_tuples_read,
       idx_scan as index_scans,
       idx_tup_fetch as index_tuples_fetched    
from   pg_stat_user_tables
order by schemaname, relname;
