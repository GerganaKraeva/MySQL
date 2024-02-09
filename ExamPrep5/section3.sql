SELECT*FROM countries
ORDER BY currency DESC, id ASC;

SELECT 
m.id,
m.title,
mai.runtime,
mai.budget,
mai.release_date
FROM movies_additional_info AS mai
JOIN movies AS m
ON mai.id=m.movie_info_id
WHERE YEAR(release_date) BETWEEN '1996' AND '1999'
ORDER BY runtime ASC, m.id ASC
limit 20;

SELECT 
  CONCAT(a.first_name, ' ', a.last_name) AS `full_name`,
  CONCAT(REVERSE(a.last_name),CHAR_LENGTH(a.last_name),'@cast.com')AS `email`,
  2022-YEAR(a.birthdate)AS `age`,
  a.height
FROM actors AS a
LEFT JOIN movies_actors AS ma
ON ma.actor_id=a.id
WHERE ma.movie_id IS NULL
ORDER BY a.height;


SELECT c.name, count(m.id) AS `movie_count`
FROM countries AS c
JOIN movies AS m
ON m.country_id=c.id
GROUP BY c.name
HAVING `movie_count`>=7
ORDER BY  c.name DESC
;

SELECT m.title,
       CASE
       WHEN mai.rating <=4 THEN 'poor'
	   WHEN mai.rating <=7 THEN 'good'
       ELSE 'excellent'
       END AS `rating`,
       IF(mai.has_subtitles, 'english','-') AS `subtitles`,
       mai.budget
FROM movies AS m
JOIN movies_additional_info AS mai
ON mai.id=m.movie_info_id
ORDER BY mai.budget DESC;