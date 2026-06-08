CREATE TABLE IF NOT EXISTS graph_edges (
    point1 VARCHAR(10),
    point2 VARCHAR(10),
    cost INT
);

INSERT INTO graph_edges (point1, point2, cost) VALUES 
('a', 'b', 10), ('b', 'a', 10),
('a', 'c', 15), ('c', 'a', 15),
('a', 'd', 20), ('d', 'a', 20),
('b', 'c', 35), ('c', 'b', 35),
('b', 'd', 25), ('d', 'b', 25),
('c', 'd', 30), ('d', 'c', 30);

WITH RECURSIVE tour_paths AS (
    -- Anchor part
    SELECT 
        edges.point2 AS current_city,
        edges.cost AS total_cost,
        'a' || edges.point2 AS tour_string,  -- Строка для отслеживания уникальных городов (например, на 1м шаге это 'ab')
        2 AS visited_count                -- Количество уже посещенных уникальных городов (уже посетили 2 города, a & b)
    FROM 
        graph_edges edges
    WHERE 
        edges.point1 = 'a'

    UNION ALL
    -- Recursive part
    SELECT 
        edges.point2,
        tp.total_cost + edges.cost,
        tp.tour_string || edges.point2,
        tp.visited_count + 1
    FROM 
        tour_paths tp
    JOIN 
        graph_edges edges ON tp.current_city = edges.point1
    WHERE 
        -- position() возвращает 0, если буква еще не встречалась в строке или позицию буквы, если она уже есть, например в строке 'ab' позиция a=1
        position(edges.point2 in tp.tour_string) = 0
),
completed_tours AS (
    -- Замыкаем круг, возвращаясь в 'a'
    SELECT 
        tp.total_cost + edges.cost AS total_cost,
        -- Форматируем строку в требуемый вид: из 'abcd' делаем '{a,b,c,d}'
        -- tp.tour_string || 'a': To turn text (like abcd) into a raw text string. 
        -- (.):The dot . to match any single character. 
        -- The parentheses () to create "capturing group" to remember that character.
        -- \1,: The \1 means "take the character we just remembered," and the , means "put a comma right after it."
        -- 'g': Stands for "global." Do this for every character in the string, not just the first one.
        '{' || regexp_replace(tp.tour_string ||'a', '(.)', '\1,', 'g') AS raw_tour
    FROM 
        tour_paths tp
    JOIN 
        graph_edges edges ON tp.current_city = edges.point1
    WHERE 
        tp.visited_count = 4 
        AND edges.point2 = 'a'
)

-- Вывод результатов с финальной очисткой формата и сортировкой
SELECT DISTINCT 
    total_cost, 
    -- Убираем лишнюю запятую перед закрывающей скобкой: '{a,b,c,d,a,}' -> '{a,b,c,d,a}' с помощью Right Trim 
    rtrim(raw_tour, ',') || '}' AS tour
FROM 
    completed_tours

WHERE total_cost = (SELECT MIN(total_cost) FROM completed_tours)

ORDER BY 
    total_cost ASC, 
    tour ASC;