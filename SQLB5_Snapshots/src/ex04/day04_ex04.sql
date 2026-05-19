CREATE VIEW v_symmetric_union AS
WITH 
R AS (
    SELECT person_id 
    FROM person_visits 
    WHERE visit_date::DATE = '2022-01-02'
),
S AS (
    SELECT person_id 
    FROM person_visits 
    WHERE visit_date::DATE = '2022-01-06'
),
symmetric_difference AS (
    (SELECT person_id FROM R EXCEPT SELECT person_id FROM S)
    UNION
    (SELECT person_id FROM S EXCEPT SELECT person_id FROM R)
)
SELECT person_id 
FROM symmetric_difference
ORDER BY person_id ASC;
