-- Title: Replication status for primary
-- The following script displays the replication status for the primary server.

-- Display the replication status for the primary server
SELECT  r1.client_addr, 
        r1.state, 
        r1.sent_lsn, 
        r1.write_lsn, 
        r1.flush_lsn, 
        r1.replay_lsn
FROM    pg_stat_replication r1;


-- Query the replication slots.
-- Primary servers should have a slot for each secondary server.
select	rs.slot_name,
		rs.plugin,
		rs.slot_type,
		rs.datoid,
		rs.database,
		rs.temporary,
		rs.active,
		rs.active_pid,
		rs.xmin,
		rs.catalog_xmin,
		rs.restart_lsn,
		rs.confirmed_flush_lsn,
		rs.wal_status,
		rs.safe_wal_size,
		rs.two_phase,
		rs.conflicting
from 	pg_replication_slots as rs;


-- Ensure that you are querying the primary server
-- On the primary server, this should return false
SELECT pg_is_in_recovery();

