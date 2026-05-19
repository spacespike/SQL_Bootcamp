SELECT menu.id as menu_id
FROM menu 
WHERE  menu.id  NOT IN (
    SELECT menu_id
    FROM person_order
)
ORDER BY menu_id;