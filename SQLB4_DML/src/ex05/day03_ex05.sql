SELECT DISTINCT pz.name AS pizzeria_name
FROM person p
JOIN person_visits pv ON p.id = pv.person_id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
LEFT JOIN menu m ON m.pizzeria_id = pz.id
LEFT JOIN person_order po 
    ON po.menu_id = m.id 
   AND po.person_id = p.id
WHERE p.name = 'Andrey'
  AND po.person_id IS NULL
ORDER BY pz.name;