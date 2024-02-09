SELECT*FROM airplanes
ORDER BY cost DESC, id DESC;

SELECT
flight_code,
departure_country,
airplane_id,
departure
FROM flights
WHERE YEAR(departure)='2022'
ORDER BY airplane_id ASC, flight_code
LIMIT 20;

SELECT c.name,
 c.currency,
 COUNT(fp.passenger_id) AS booked_tickets
FROM countries c
JOIN flights f ON f.destination_country = c.id
JOIN flights_passengers fp ON fp.flight_id = f.id
GROUP BY  c.name
HAVING COUNT(fp.passenger_id) >= 20
ORDER BY booked_tickets DESC;

SELECT 
   CONCAT(UPPER(LEFT(p.last_name,2)),(p.country_id)) AS `flight_code`,
   CONCAT (p.first_name,' ',p.last_name) AS `full_name`,
   country_id
FROM passengers AS p
LEFT JOIN flights_passengers AS fp
ON p.id=fp.passenger_id
WHERE fp.passenger_id IS NULL
ORDER BY p.country_id ASC;






SELECT
  flight_code,
  departure,
  CASE
    WHEN TIME(departure) >= '05:00:00' AND TIME(departure) < '12:00:00' THEN 'Morning'
    WHEN TIME(departure) >= '12:00:00' AND TIME(departure) < '17:00:00' THEN 'Afternoon'
    WHEN TIME(departure) >= '17:00:00' AND TIME(departure) < '21:00:00' THEN 'Evening'
    ELSE 'Night'
  END AS day_part
FROM flights
ORDER BY flight_code DESC;
