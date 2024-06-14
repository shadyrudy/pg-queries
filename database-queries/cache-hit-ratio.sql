-- Title: Postgresql Cache Hit Ratio
-- The following query returns the cache hit ratio of the Postgresql server.
select  sum(heap_blks_read) as heap_read,
        sum(heap_blks_hit)  as heap_hit,
        100.00 * (sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read))) as ratio
from    pg_statio_user_tables;

-- Index Cache Hit Ratio
select  sum(idx_blks_read) as idx_read,
        sum(idx_blks_hit)  as idx_hit,
        100.00 * ((sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit)) as ratio
from    pg_statio_user_indexes;bing mapstime