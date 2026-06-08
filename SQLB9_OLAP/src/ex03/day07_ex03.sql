SELECT 
    p.name,
    COUNT(*) AS total_count
FROM (
    SELECT pizzeria_id FROM person_visits
    UNION ALL
    SELECT m.pizzeria_id FROM person_order po JOIN menu m ON po.menu_id = m.id
) AS combined
JOIN pizzeria p ON combined.pizzeria_id = p.id
GROUP BY p.name
ORDER BY total_count DESC, name ASC;
