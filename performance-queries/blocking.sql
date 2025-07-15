-- Title: PostgreSQL Current blocking queries
-- The following query returns the current blocking queries in 
-- PostgreSQL server.
SELECT  blocked_locks.pid AS blocked_pid
	  , blocked_activity.usename AS blocked_user
	  , blocking_locks.pid AS blocking_pid
	  , blocking_activity.usename AS blocking_user
	  , blocked_activity.query AS blocked_query
	  , blocking_activity.query AS blocking_query
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity
	ON blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks blocking_locks
	ON blocking_locks.locktype = blocked_locks.locktype
		AND blocking_locks.DATABASE IS NOT DISTINCT
FROM blocked_locks.DATABASE
	AND blocking_locks.relation IS NOT DISTINCT
FROM blocked_locks.relation
	AND blocking_locks.page IS NOT DISTINCT
FROM blocked_locks.page
	AND blocking_locks.tuple IS NOT DISTINCT
FROM blocked_locks.tuple
	AND blocking_locks.transactionid IS NOT DISTINCT
FROM blocked_locks.transactionid
	AND blocking_locks.classid IS NOT DISTINCT
FROM blocked_locks.classid
	AND blocking_locks.objid IS NOT DISTINCT
FROM blocked_locks.objid
	AND blocking_locks.objsubid IS NOT DISTINCT
FROM blocked_locks.objsubid
JOIN pg_catalog.pg_stat_activity blocking_activity
	ON blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted;

-- Title: PostgreSQL Current blocking queries
-- The following query returns the current blocking queries in 
-- PostgreSQL server. This version returns the actual query text
-- for both blocked and blocking processes.
SELECT  blocked_locks.pid AS blocked_pid
	  , blocked_activity.usename AS blocked_user
	  , blocking_locks.pid AS blocking_pid
	  , blocking_activity.usename AS blocking_user
	  , blocked_activity.query AS blocked_query
	  , blocking_activity.query AS blocking_query
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity
	ON blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks blocking_locks
	ON blocking_locks.locktype = blocked_locks.locktype
		AND blocking_locks.DATABASE IS NOT DISTINCT
FROM blocked_locks.DATABASE
	AND blocking_locks.relation IS NOT DISTINCT
FROM blocked_locks.relation
	AND blocking_locks.page IS NOT DISTINCT
FROM blocked_locks.page
	AND blocking_locks.tuple IS NOT DISTINCT
FROM blocked_locks.tuple
	AND blocking_locks.transactionid IS NOT DISTINCT
FROM blocked_locks.transactionid
	AND blocking_locks.classid IS NOT DISTINCT
FROM blocked_locks.classid
	AND blocking_locks.objid IS NOT DISTINCT
FROM blocked_locks.objid
	AND blocking_locks.objsubid IS NOT DISTINCT
FROM blocked_locks.objsubid
JOIN pg_catalog.pg_stat_activity blocking_activity
	ON blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted;