-- Title: Replication status for secondary PostgreSQL servers
-- The following script displays the replication status for any secondary PostgreSQL server.

-- Query the table pg_stat_wal_receiver to get the replication status for the secondary server
select  wr.pid,
        wr.status,
        wr.receive_start_lsn,
        wr.receive_start_tli,
        wr.written_lsn,
        wr.flushed_lsn,
        wr.received_tli,
        wr.last_msg_send_time,
        wr.last_msg_receipt_time,
        wr.latest_end_lsn,
        wr.latest_end_time,
        wr.slot_name,
        wr.sender_host,
        wr.sender_port
from    pg_stat_wal_receiver wr;

-- Check the last WAL received, the last WAL replayed, and the last replayed timestamp.
-- These should match but can be off by a few bytes or milliseconds.
select  pg_last_wal_receive_lsn(), 
        pg_last_wal_replay_lsn(), 
        pg_last_xact_replay_timestamp();

-- Query the replication slots. 
-- Secondary servers should have a slot for the primary server.
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


-- Ensure that you are querying a secondary server
-- On a secondary server, this should return true
SELECT  pg_is_in_recovery();

