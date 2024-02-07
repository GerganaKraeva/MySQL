DELIMITER $

CREATE FUNCTION udf_offers_from_city_name (cityName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE result INT;
SET result:= (SELECT COUNT(*)
FROM properties AS p
JOIN  cities AS c
ON p.city_id=c.id
JOIN property_offers AS po
ON po.property_id=p.id
WHERE c.name=cityName
);
RETURN result;
END $

DELIMITER ;
DROP FUNCTION udf_offers_from_city_name;


DELIMITER ;
SELECT udf_offers_from_city_name('Vienna');

DELIMITER $

CREATE PROCEDURE udp_special_offer(first_name VARCHAR(50))
BEGIN
UPDATE property_offers AS po
JOIN agents AS a
ON a.id=po.agent_id
SET po.price=0.9*po.price
WHERE a.first_name=first_name;
END $

