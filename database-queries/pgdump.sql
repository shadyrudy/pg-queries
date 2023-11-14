-- Title: Dump PostgreSQL database schema
-- The following command backups up the schema for a PostgreSQL database
-- to a file. The file can be used to restore the schema to a database
-- The -s flag tells pg_dump to only dump the schema and not the data.
pg_dump -s DBName > schema_backup.sql
