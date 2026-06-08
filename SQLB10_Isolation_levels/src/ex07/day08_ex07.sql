-- SESSION #1
BEGIN;
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- SESSION #2
BEGIN;
UPDATE pizzeria SET rating = 4 WHERE name = 'Dominos';

-- SESSION #1
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';

-- SESSION #2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';

-- SESSION #1
COMMIT;

-- SESSION #2
ROLLBACK;
