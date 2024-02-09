INSERT INTO airplanes (model, passengers_capacity, tank_capacity, cost)
SELECT 
  CONCAT(REVERSE(first_name),'797'),
  (CHAR_LENGTH(last_name))*17,
  id*790,
  (CHAR_LENGTH(first_name))*50.6
FROM passengers
WHERE id<=5;

SELECT*FROM airplanes;
  
  UPDATE  flights AS f
  JOIN countries AS c
  ON c.id=f.departure_country
  SET f.airplane_id=f.airplane_id+1
  WHERE c.name IN ('Armenia');


SET SQL_SAFE_UPDATES=0;

DELETE f FROM flights AS f
LEFT JOIN flights_passengers AS fp
ON f.id=fp.flight_id
WHERE fp.passenger_id IS NULL;









 
  