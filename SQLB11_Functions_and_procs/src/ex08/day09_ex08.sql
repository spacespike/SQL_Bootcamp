CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop integer DEFAULT 10)
RETURNS TABLE (fibonacci_number bigint) AS $$
    WITH RECURSIVE fib AS (
        -- Start (0 и 1)
        SELECT 0::bigint AS current_num, 1::bigint AS next_num
        UNION ALL
        -- Recursive
        SELECT next_num, current_num + next_num
        FROM fib
        WHERE next_num < pstop
    )
    SELECT current_num 
    FROM fib
   WHERE current_num < pstop;
$$ LANGUAGE sql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();