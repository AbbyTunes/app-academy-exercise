

SELECT * FROM cats;
SELECT * FROM toys;
SELECT * FROM cattoys;


UPDATE toys
SET color = 'black'
Where name = 'ball';

UPDATE cats
SET color = 'white'
Where name = 'Bagel';

UPDATE cattoys
SET cat_id = 2, toy_id = 2
WHERE id = 5;

UPDATE toys
SET color = 'yellow'
WHERE price = 1;


INSERT INTO toys
    (price, color, name)
VALUES 
    (12, 'green', 'laser pen');


EXPLAIN DELETE FROM toys WHERE toys.name = 'feather';


EXPLAIN ANALYZE UPDATE toys
SET color = 'black'
WHERE name = 'string';

EXPLAIN ANALYZE SELECT name FROM cats WHERE name = 'Silver';

EXPLAIN SELECT toys.name FROM toys 
JOIN cattoys ON cattoys.toy_id = toys.id
JOIN cats ON cats.id = cattoys.cat_id
WHERE cats.name = 'Freyja';

# ONE TIME
EXPLAIN SELECT toys.name AS red_toys, cats.name AS red_cats
FROM toys
JOIN cattoys ON cattoys.toy_id = toys.id
JOIN cats ON cats.id = cattoys.cat_id
WHERE toys.color = 'Red' OR cats.color = 'Red';

# NESTED LOOPS
EXPLAIN SELECT toys.name, cats.name FROM toys, cats
WHERE toys.color = 'Red' OR cats.color = 'Red';

EXPLAIN (SELECT toys.name FROM toys
WHERE toys.color = 'Red')
AND
SELECT name FROM cats
WHERE color = 'Yellow';


EXPLAIN ANALYZE SELECT toys.name
FROM toys
JOIN cattoys ON cattoys.toy_id = toys.id
JOIN cats ON cats.id = cattoys.cat_id
WHERE cats.breed = 'British Shorthair';


EXPLAIN ANALYZE SELECT name FROM toys WHERE price < 10;

