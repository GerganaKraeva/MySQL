DELIMITER $
CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE  result INT;
SET result =(SELECT  COUNT(f.flight_code)
FROM flights AS f
JOIN countries AS c
ON c.id=f.departure_country
WHERE c.name=country
GROUP BY f.departure_country
ORDER BY f.departure_country );
RETURN result;
END $

DELIMITER $

CREATE  PROCEDURE udp_delay_flight(code VARCHAR(50))
BEGIN
UPDATE flights

-- SET has_delay=1, departure = ADDTIME(departure ,'0:30')

-- SET has_delay=1 , departure = departure + INTERVAL 30 MINUTE

SET has_delay=1, departure = DATE_ADD(departure ,INTERVAL 30 MINUTE)

WHERE flight_code IN (code);
END$

DELIMITER ;

CALL udp_delay_flight('ZP-782');
SELECT*FROM flights
WHERE flight_code = 'ZP-782';



