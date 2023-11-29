-- Title: Installed Postgresql Extensions
-- The following query returns a list of installed extensions.
-- This query uses pg_available_extensions
SELECT name, 
       default_version, 
       installed_version, 
       comment
FROM   pg_available_extensions
WHERE  installed_version IS NOT NULL;

-- The following query returns a list of installed extensions.
-- This query uses pg_extension
select oid,
       extname, 
       extversion, 
       extrelocatable, 
       extconfig, 
       extcondition
from   pg_extension;

-- The following psql command returns a list of installed extensions.
\dx
