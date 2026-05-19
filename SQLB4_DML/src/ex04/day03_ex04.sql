WITH orders AS (
    SELECT pz.name AS pizzeria_name, p.gender
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
)

(
    SELECT pizzeria_name FROM orders WHERE gender = 'female'
    EXCEPT
    SELECT pizzeria_name FROM orders WHERE gender = 'male'
)
UNION
(
    SELECT pizzeria_name FROM orders WHERE gender = 'male'
    EXCEPT
    SELECT pizzeria_name FROM orders WHERE gender = 'female'
)
ORDER BY pizzeria_name;