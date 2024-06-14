-- Title: Long running queries
-- The following query returns the long running queries in the PostgreSQL server.
-- The query returns the delta time of the query and the current time.
-- The interval is set to 5 minutes.
select  a.pid,
        a.usename,
        a.query_start,
        now() - a.query_start AS query_time,
        a.query,
        a.state,
        a.wait_event_type,
        a.wait_event
from    pg_stat_activity as a
WHERE   (now() - a.query_start) > interval '5 minutes';