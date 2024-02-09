
INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)
SELECT
    REVERSE(first_name),
    REVERSE(last_name),
    birthdate -INTERVAL 2 DAY,
    height+10,
    country_id,
(SELECT id FROM countries WHERE name='Armenia')
FROM actors
WHERE id <= 10;


UPDATE movies_additional_info
SET runtime=runtime-10
WHERE  id BETWEEN 15 and 25;

DELETE FROM countries as c
WHERE (select COUNT(*) FROM movies AS m WHERE m.country_id=c.id ) =0; 