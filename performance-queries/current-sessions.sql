-- Title: Current Sessions
-- Obtain a list of current, active sessions.
SELECT pid, 
       usename,
       application_name, 
       client_addr, 
       client_port, 
       backend_start, 
       state
FROM   pg_stat_activity
WHERE  state = 'active';

-- Obtain a list of current, active sessions.
-- Include the query being executed by each session.
SELECT pid, 
       usename,
       application_name, 
       client_addr, 
       client_port, 
       backend_start, 
       state,
       query
FROM   pg_stat_activity
WHERE  state = 'active';

-- Obtain a list of current, active sessions.
-- include the database name and the query being executed by each session.
SELECT pid, 
       usename,
       application_name, 
       client_addr, 
       client_port, 
       backend_start, 
       state,
       datname,
       query
FROM   pg_stat_activity
WHERE  state = 'active';
