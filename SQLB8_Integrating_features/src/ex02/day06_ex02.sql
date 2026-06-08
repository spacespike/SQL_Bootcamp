SELECT person.name AS name,
       menu.pizza_name AS pizza_name,
       menu.price AS price,
       ROUND(menu.price / 100 * (100 - person_discounts.discount)) AS discount_price,
       pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_discounts ON person_discounts.person_id = person_order.person_id 
                     AND person_discounts.pizzeria_id = menu.pizzeria_id
ORDER BY person.name, pizzeria_name;