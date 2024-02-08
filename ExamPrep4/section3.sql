SELECT*FROM clients
ORDER BY birthdate DESC,id DESC;

SELECT first_name, last_name, birthdate, review
FROM clients
WHERE card IS NULL AND YEAR(birthdate) BETWEEN 1978 AND 1993
ORDER BY last_name DESC, id ASC
LIMIT 5;

SELECT 
  CONCAT(last_name, first_name,CHAR_LENGTH(first_name),'Restaurant') AS `username`,
 REVERSE(SUBSTRING(email,2,12)) AS `password`
FROM waiters
WHERE salary IS NOT NULL
ORDER BY `password` DESC;

SELECT p.id, p.name, COUNT(*) AS `count`
FROM products as p
JOIN orders_products AS op
ON op.product_id=p.id
GROUP BY p.name
HAVING `count` >=5
ORDER BY `count` DESC, p.name ASC;



SELECT 
       t.id, 
       t.capacity,
       COUNT(o.id) AS `count_clients`,
       CASE
       WHEN COUNT(o.id) < t.capacity THEN 'Free seats'
	   WHEN COUNT(o.id) = t.capacity THEN 'Full'
       ELSE 'Extra seats'
       END AS `availability`
FROM `tables` AS t
JOIN orders AS o
 ON o.table_id=t.id
JOIN orders_clients AS oc
ON oc.order_id=o.id
WHERE t.floor = 1
GROUP BY t.id
ORDER BY t.id DESC;



