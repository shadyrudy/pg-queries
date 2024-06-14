-- Title: Postgresql Uptime query
-- The following query returns the current uptime of the Postgresql server.
SELECT date_trunc('second', current_timestamp - pg_postmaster_start_time()) as uptime;
