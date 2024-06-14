-- Title: PostgreSQL Current Locks
-- The following query returns the current locks in the PostgreSQL server.
-- The query returns the actual query as well. 

SELECT  a.pid,
        a.usename,
        a.application_name,
        a.client_addr,
        l.locktype,
        l.mode,
        l.granted,
        l.relation::regclass AS relation_name,
        l.page,
        l.tuple,
        l.virtualxid,
        l.transactionid,
        l.classid,
        l.objid,
        l.objsubid,
        l.virtualtransaction,
        a.backend_start,
        a.query
FROM    pg_locks as l
JOIN    pg_stat_activity as a
ON      l.pid = a.pid
ORDER BY relation_name,
        l.locktype,
        l.mode;

-- The following returns the locks in PostgreSQL grouped by pid
-- and ordered by pid.
-- This does not specify the lock type, mode, or relation name.
SELECT  a.pid,
        a.usename,
        a.application_name,
        a.client_addr,
        count(*) as lock_total
FROM    pg_locks as l
JOIN    pg_stat_activity as a
ON      l.pid = a.pid
group by a.pid,
        a.usename,
        a.application_name,
        a.client_addr
ORDER BY a.pid