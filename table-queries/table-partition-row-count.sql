-- Count the number of rows in each partition of a partitioned table
-- This query uses the tableoid system column to identify the partition each row belongs to
SELECT tableoid::regclass AS partition_name,  -- Convert tableoid to regclass for a human-readable partition name
       COUNT(*) AS record_count               -- Count the number of records in each partition
FROM table_name                               -- Query the partitioned table_name table
GROUP BY tableoid
order by partition_name desc;

-- Estimate the number of rows in each partition of a partitioned table
-- using reltuples from pg_class
-- Uses a LIKE statement with a parenthesis to match the partition names, which usually follow a naming convention based on the parent table
SELECT relname           AS partition,
       reltuples::bigint AS estimated_rows
FROM   pg_class
WHERE  relkind = 'r'
AND    relname like 'table_name%'
ORDER BY relname desc;