SELECT object_name
FROM (
    SELECT 'menu' AS source_type, pizza_name AS object_name
    FROM menu

    UNION ALL
    
    SELECT 'person' AS source_type, name AS object_name
    FROM person
) AS combined_data
ORDER BY source_type DESC, object_name;
