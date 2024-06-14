-- Title: PostgreSQL Current Transactions
-- The following query returns the active transactions in the PostgreSQL server.
SELECT  pid,
        usename,
        datname,
        application_name,
        client_addr,
        state,
        backend_start,
        xact_start,
        query_start,
        state_change,
        query
FROM    pg_stat_activity
WHERE   state = 'active' 
AND     xact_start IS NOT NULL
ORDER BY xact_start;

-- The following query returns transactions in the PostgreSQL server.
-- This version includes all transactions, not just active ones.
SELECT  pid,
        usename,
        datname,
        application_name,
        client_addr,
        state,
        backend_start,
        xact_start,
        query_start,
        state_change,
        query
FROM    pg_stat_activity
WHERE   xact_start IS NOT NULL
ORDER BY xact_start;