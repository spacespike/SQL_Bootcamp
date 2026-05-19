WITH full_list AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date 
	AS missing_date),
	
	visit_happened AS (SELECT visit_date FROM person_visits 
		WHERE (person_visits.person_id = 1 OR person_visits.person_id = 2) 
		AND visit_date BETWEEN '2022-01-01' AND '2022-01-10')
		
SELECT fl.missing_date FROM full_list fl
LEFT JOIN visit_happened ON fl.missing_date=visit_happened.visit_date

WHERE visit_happened.visit_date IS NULL
ORDER BY fl.missing_date;
