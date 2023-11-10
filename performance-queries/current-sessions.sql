-- Title: Current Sessions
SELECT pid, usename, application_name, client_addr, client_port, backend_start, state, query
FROM pg_stat_activity
WHERE state = 'active';
