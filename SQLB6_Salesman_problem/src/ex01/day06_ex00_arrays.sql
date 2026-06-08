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
    -- Anchor part: Start with an array containing ['a', point2]
    SELECT 
        edges.point2 AS current_city, 
        edges.cost AS total_cost, 
        ARRAY['a', edges.point2] AS tour_array, -- Using native SQL array
        2 AS visited_count 
    FROM graph_edges edges 
    WHERE edges.point1 = 'a'
    
    UNION ALL
    
    -- Recursive part: Append new cities to the array
    SELECT 
        edges.point2, 
        tp.total_cost + edges.cost, 
        array_append(tp.tour_array, edges.point2),       
        tp.visited_count + 1 
    FROM tour_paths tp 
    JOIN graph_edges edges ON tp.current_city = edges.point1 
    WHERE 
        -- NOT IN array: ensures the city has not been visited yet
        NOT (edges.point2 = ANY(tp.tour_array)) 
), 
completed_tours AS (
    -- Close the loop by returning to 'a'
    SELECT 
        tp.total_cost + edges.cost AS total_cost, 
        tp.tour_array AS final_tour_array
    FROM tour_paths tp 
    JOIN graph_edges edges ON tp.current_city = edges.point1 
    WHERE tp.visited_count = 4 
      AND edges.point2 = 'a' 
) 
-- Final output: Cast the native array directly to text format
SELECT DISTINCT 
    total_cost, 
    final_tour_array::text AS tour -- Converts ['a','b','c','d'] directly to '{a,b,c,d}'
FROM completed_tours 
ORDER BY total_cost ASC, tour ASC;
