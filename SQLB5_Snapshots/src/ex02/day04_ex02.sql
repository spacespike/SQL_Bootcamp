CREATE VIEW v_generated_dates AS
SELECT generated_date::DATE
FROM generate_series(
    '2022-01-01'::TIMESTAMP, 
    '2022-01-31'::TIMESTAMP, 
    '1 day'::INTERVAL
) AS gs(generated_date)
ORDER BY generated_date ASC;