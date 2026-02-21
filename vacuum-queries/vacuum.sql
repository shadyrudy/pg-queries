-- Display the age of each table in transactions along with its total size
select c.oid,
       c.relname as table_name,
       age(c.relfrozenxid) as age_in_transactions,
       2147483647 - age(c.relfrozenxid) as transactions_until_wraparound,
       pg_size_pretty(pg_total_relation_size(c.oid)) as total_size,
       to_char(now(), 'YYYY-MM-DD HH24:MI:SS') as last_updated
from  pg_class as c
join  pg_namespace as n 
      on c.relnamespace = n.oid
where c.relkind in ('r','t','m')
and   n.nspname not in ('pg_catalog', 'information_schema')
and   c.relname not like 'pg_%_toast'
order by age_in_transactions desc

-- Display the age of the database in transactions along with the autovacuum freeze max age setting
select datname,
       age(datfrozenxid) as age_in_transactions,
       current_setting('autovacuum_freeze_max_age')::int as autovacuum_freeze_max_age,
       to_char(now(), 'YYYY-MM-DD HH24:MI:SS') as last_updated
from pg_database
order by age_in_transactions desc;

-- Display vacuum progress for all tables
-- Note: This several columns are only available in PostgreSQL 13 and later
-- and were then removed in PostgreSQL 15 and later. 
-- Adjust the column selection based on your PostgreSQL version.
select pid,
      datname,
      relname::regclass as table_name,
      phase,
      heap_blks_total,
      heap_blks_scanned,
      heap_blks_vacuumed,
      index_vacuum_count,
      max_dead_tuples,
      num_dead_tuples,
      to_char(now() - query_start, 'HH24:MI:SS') as runtime, 
      to_char(now(), 'YYYY-MM-DD HH24:MI:SS') as last_updated
from pg_stat_progress_vacuum as v
