-- Title: Schema Permissions
-- A query to view postgresql permission information
-- TODO: Handle different schemas. 
-- TODO: Exclude pg_catalog and information_schema.
SELECT 
    'TABLE' AS object_type,
    grantee,
    table_schema,
    table_name,
    privilege_type
FROM 
    information_schema.role_table_grants
WHERE 
    table_schema = (SELECT current_schema())
UNION ALL
SELECT 'sequence' AS object_type,
    grantee,
    sequence_schema,
    sequence_name,
    privilege_type
FROM
    information_schema.sequences
    LEFT JOIN information_schema.role_table_grants 
    ON information_schema.sequences.sequence_name = information_schema.role_table_grants.table_name
    where sequence_schema = (SELECT current_schema())
UNION ALL
SELECT 
    'FUNCTION' AS object_type,
    grantee,
    specific_schema,
    routine_name,
    privilege_type
FROM 
    information_schema.role_routine_grants
WHERE 
    specific_schema = (SELECT current_schema())
UNION ALL
SELECT 
    'VIEW' AS object_type,
    grantee,
    table_schema,
    table_name,
    privilege_type
FROM 
    information_schema.role_table_grants
WHERE 
    table_schema = (SELECT current_schema())
    AND table_name IN (SELECT viewname FROM pg_views WHERE schemaname = (SELECT current_schema()));