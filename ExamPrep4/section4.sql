DELIMITER $

CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL (19,2)
DETERMINISTIC
BEGIN
DECLARE result DECIMAL(19,2);
SET result := (SELECT 
       SUM(p.price) AS `bill`
FROM clients AS c
JOIN orders_clients AS oc
ON c.id=oc.client_id
JOIN orders_products AS op
ON op.order_id=oc.order_id
JOIN products AS p
ON p.id=op.product_id
WHERE CONCAT(c.first_name, ' ', c.last_name)= full_name
GROUP BY CONCAT(c.first_name, ' ', c.last_name)
);
RETURN result;
END $




DELIMITER ;

-- SELECT CONCAT(first_name,' ',last_name) AS `full_name`,
--        p.name,
--        SUM(p.price) AS `bill`
-- FROM clients AS c
-- JOIN orders_clients AS oc
-- ON c.id=oc.client_id
-- JOIN orders_products AS op
-- ON op.order_id=oc.order_id
-- JOIN products AS p
-- ON p.id=op.product_id
-- WHERE CONCAT(c.first_name, ' ', c.last_name)= full_name
-- GROUP BY `full_name`;

DELIMITER $

CREATE PROCEDURE udp_happy_hour(type VARCHAR(50))
BEGIN
UPDATE products
SET price= 0.80 * price
WHERE type IN (type) AND price >=10.00;
END $


DELIMITER ;
SELECT price FROM products
WHERE type='Cognac' AND price >=10;

CALL udp_happy_hour('Çognac');

SELECT price FROM products
WHERE type='Cognac';
