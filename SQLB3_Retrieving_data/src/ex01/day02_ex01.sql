SELECT fl.missing_date
FROM (
    SELECT generate_series('2022-01-01'::date,
                           '2022-01-10'::date,
                           '1 day')::date AS missing_date
) AS fl --full_list
LEFT JOIN (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
) AS vh --visit_happened

ON fl.missing_date = vh.visit_date
WHERE vh.visit_date IS NULL
ORDER BY fl.missing_date;