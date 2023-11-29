-- Title: Database Size
-- Display database size in MB and GB for all databases on the cluster.
SELECT datname AS database_name,
       pg_size_pretty(pg_database_size(datname)) AS size_in_mb,
       (pg_database_size(datname) / 1024 / 1024 / 1024)::numeric(10,2) AS size_in_gb
FROM   pg_database
WHERE  datistemplate = false;

-- Display the database size for all databases using psql command
\l+

-- Display the database size for a specific database using the psql command
\l+ database_name
