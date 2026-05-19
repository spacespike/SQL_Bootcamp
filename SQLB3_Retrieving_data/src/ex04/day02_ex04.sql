WITH favorite_pizzas AS (
    SELECT pizza_name, pizzeria_id, price 
	FROM menu
	WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza'))
	
SELECT 
    favorite_pizzas.pizza_name, 
    pizzeria.name, 
    favorite_pizzas.price
FROM favorite_pizzas
LEFT JOIN pizzeria 
    ON pizzeria.id = favorite_pizzas.pizzeria_id
ORDER BY 
    favorite_pizzas.pizza_name,
    pizzeria.name;