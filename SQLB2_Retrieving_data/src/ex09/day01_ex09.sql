SELECT id, name
FROM pizzeria
WHERE id NOT IN (
    SELECT DISTINCT pizzeria_id
    FROM person_visits
);

SELECT id, name
FROM pizzeria p
WHERE NOT EXISTS (
    SELECT *
    FROM person_visits
    WHERE person_visits.pizzeria_id = p.id
);