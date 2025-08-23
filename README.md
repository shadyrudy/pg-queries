# pg-queries
A collection of useful PostgreSQL queries. 
This includes the following:
1. Database information
1. Index size and usage information
1. Table size and usage information
1. Current running sessions
1. Current locking and blocking
1. Replication information


# Version History
## 2023-11-10
1. Initial commit.
1. Updated folders for database, table, cluster, and permissions.
1. Added basic queries for all sections

## 2023-11-14
1. Added schema only backup via pg_dump
1. Added additional database size queries
1. Added query and commands to list all tables

## 2023-11-29
1. Added table row counts.
1. Changed the formatting in some queries.

## 2024-01-08
1. Updated table size query to use oid instead of reltoastrelid.
1. Removed redundant table size query.
1. Added byte column to total table size query.
1. Updated database size query to include bytes, MB, and GB.

## 2024-06-14
1. Added query for cache hit ratio
1. Added query for current locks
1. Added query for long running statements. Statements are 5 mins
1. Added query for current transactions. 
1. Added query for current uptime.

## 2024-07-28
1. Added queries for replication status from the primary server.
1. Added query for primary replication slots.
1. Added queries for replication status from secondary servers. 
1. Added query for secondary replication slot.
1. Added query for last WAL file received and replayed on secondary servers.

## 2025-08-29
1. Added script for index usage information
1. Updated replication queries for the primary instance
1. Updated replication queries for the secondary instances
1. Added missing semicolon