SELECT*FROM agents
ORDER BY city_id DESC, phone DESC;

SELECT*FROM property_offers
WHERE YEAR(offer_datetime)='2021'
ORDER BY price
LIMIT 10;

SELECT SUBSTRING(p.address,1,6) AS `agent_name`, 
       (CHAR_LENGTH(p.address)*5430) AS `price`
FROM properties AS p
LEFT JOIN property_offers AS po
ON p.id=po.property_id
WHERE po.price is NULL
ORDER BY `agent_name` DESC, `price` DESC;

SELECT bank_name, COUNT(*) AS`count`
FROM property_transactions
GROUP BY bank_name
HAVING `count` >=8
ORDER BY `count` DESC , bank_name ASC;

SELECT p.address,
       p.area,
       CASE
          WHEN p.area <=100  THEN 'small'
		  WHEN p.area <=200  THEN 'medium'
          WHEN p.area <=500  THEN 'large'
          ELSE 'extra large'
	   END AS  `size`
FROM properties AS p
ORDER BY p.area ASC, p.address DESC;
