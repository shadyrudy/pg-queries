# pg-queries
A collection of useful PostgreSQL queries. 
This includes the following:
1. table and database information. 
2. 


# Version History
## 2023-11-10
Initial commit.
Updated folders for database, table, cluster, and permissions.
Added basic queries for all sections

## 2023-11-14
Added schema only backup via pg_dump
Added additional database size queries
Added query and commands to list all tables

## 2023-11-29
Added table row counts.
Changed the formatting in some queries.

## 2024-01-08
Updated table size query to use oid instead of reltoastrelid.
Removed redundant table size query.
Added byte column to total table size query.
Updated database size query to include bytes, MB, and GB.

## 2024-06-14
Added query for cache hit ratio
Added query for current locks
Added query for long running statements. Statements are 5 mins
Added query for current transactions. 
Added query for current uptime.

## 2024-07-28
Added queries for replication status from the primary server.
Added query for primary replication slots.
Added queries for replication status from secondary servers. 
Added query for secondary replication slot.
Added query for last WAL file received and replayed on secondary servers.