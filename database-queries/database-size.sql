-- Title: Database Size
-- Display database size in MB and GB for all databases on the cluster.
SELECT datname AS database_name,
       pg_size_pretty(pg_database_size(datname)) AS size_in_mb,
       (pg_database_size(datname) / 1024 / 1024 / 1024)::numeric(10,2) AS size_in_gb
FROM pg_database
WHERE datistemplate = false;
