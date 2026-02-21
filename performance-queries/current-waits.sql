-- The following returns the current waits for all sessions
SELECT pid,
    usename,
    state,
    wait_event_type,
    wait_event,
    --query,
    to_char(now() - query_start, 'MI:SS') AS runtime,
    to_char(now(), 'YYYY-MM-DD HH24:MI:SS') AS last_updated
FROM pg_stat_activity
WHERE wait_event IS NOT NULL;