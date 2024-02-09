DELIMITER $

CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE result INT;
SET result:=(SELECT COUNT(*)
FROM movies AS m
JOIN movies_actors AS ma
ON ma.movie_id=m.id
JOIN actors AS a
ON a.id=ma.actor_id
JOIN genres_movies AS gm
ON gm.movie_id=m.id
JOIN genres AS g
ON g.id=gm.genre_id
WHERE CONCAT(a.first_name,' ', a.last_name)=full_name AND g.name='History'
GROUP BY  CONCAT(a.first_name,' ', a.last_name)
);
RETURN result;
END $

DELIMITER ;
SELECT udf_actor_history_movies_count('Stephan Lundberg');


DELIMITER $

CREATE PROCEDURE udp_award_movie( movie_title VARCHAR(50))
BEGIN
UPDATE  actors AS a
JOIN movies_actors AS ma
ON a.id=ma.actor_id
JOIN movies AS m
ON m.id=ma.movie_id
SET awards=awards+1
WHERE m.title=movie_title;
END $

DELIMITER ;
CALL udp_award_movie('Tea For Two');
 


