-- Title: Table Row Counts
-- The following query returns the row count for each table in the current database.
-- This query uses pg_stat_user_tables.
-- This query is known to be inaccurate for tables with large numbers of dead rows.
SELECT  schemaname AS schema_name,
        relname AS table_name,
        n_live_tup AS row_count
FROM    pg_stat_user_tables
ORDER BY n_live_tup DESC;

-- The following query returns the row count for each table in the current database.
-- This query uses pg_class.
select relname as table_name,
        reltuples as row_count
from   pg_class
where  relkind = 'r'
order by reltuples desc;
