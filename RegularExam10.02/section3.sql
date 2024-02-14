SELECT 
    CONCAT(first_name,' ', last_name) AS `full_name`,
   DATEDIFF('2024-01-01', start_date) AS `days_of_experience`
FROM workers
WHERE YEAR('2024-01-01')-YEAR(start_date)>5
ORDER BY `days_of_experience` DESC
LIMIT 10;


SELECT w.id, 
        w.first_name,
        w.last_name,
        p.name AS `preserve_name`,
        c.country_code AS `country_code`
FROM workers AS w
JOIN preserves AS p
ON p.id=w.preserve_id
JOIN countries_preserves AS cp
ON cp.preserve_id=p.id
JOIN countries AS c
ON c.id=cp.country_id
WHERE w.salary >5000 AND age <50
ORDER BY `country_code` ASC;


SELECT p.name ,COUNT(*) AS `armed_workers`
FROM preserves AS p
JOIN workers AS w
ON w.preserve_id=p.id
WHERE is_armed=1
GROUP BY p.name
ORDER BY `armed_workers` DESC, p.name ASC;


SELECT p.name,
       c.country_code,
       YEAR(p.established_on) AS `found`
FROM preserves AS p
JOIN countries_preserves AS cp
ON cp.preserve_id=p.id
LEFT JOIN countries AS c
ON c.id=cp.country_id
WHERE MONTH(established_on)=5
ORDER BY `found`
LIMIT 5;

SELECT id,
       name,
       CASE
       WHEN area < 100 THEN 'very small'
       WHEN area < 1000 THEN 'small'
       WHEN area < 10000 THEN 'medium'
       WHEN area < 50000 THEN 'large'
       ELSE 'very large'
       END AS `category`
FROM preserves
ORDER BY area DESC;
