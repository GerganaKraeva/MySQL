
INSERT INTO products (name , type, price)
(SELECT
    CONCAT(w.last_name,' ','specialty'),
    'Cocktail',
    CEILING(w.salary/100)
FROM waiters AS w
WHERE w.id > 6);

UPDATE orders 
SET table_id = table_id-1
WHERE id BETWEEN 12 AND 23;

SET SQL_SAFE_UPDATES=0;

DELETE FROM waiters AS w
WHERE (SELECT COUNT(*) FROM orders WHERE waiter_id=w.id)=0;

