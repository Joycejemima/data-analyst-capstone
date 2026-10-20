SELECT column_name, COUNT(*) AS tables, STRING_AGG(table_name, ', ') AS in_tables
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY column_name
HAVING COUNT(*) > 1
ORDER BY tables DESC;