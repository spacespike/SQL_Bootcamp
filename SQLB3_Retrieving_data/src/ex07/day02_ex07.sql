SELECT pizzeria.name, menu.price
FROM person
JOIN person_visits ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN menu ON pizzeria.id = menu.pizzeria_id

WHERE person.name = 'Dmitriy' AND menu.price < 800 AND person_visits.visit_date = '2022-01-08';