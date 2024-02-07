DELIMITER $

CREATE FUNCTION udf_average_alumni_grade_by_course_name(course_name VARCHAR(60))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE result DECIMAL(10,2);
SET result:= (SELECT AVG(sc.grade)
FROM students_courses AS sc
JOIN courses AS c
ON sc.course_id=c.id
JOIN students AS s
ON sc.student_id=s.id
WHERE c.name = course_name AND s.is_graduated=1
GROUP BY c.id);
RETURN result;
END $

DELIMITER ;
SELECT AVG(sc.grade),c.name
FROM students_courses AS sc
JOIN courses AS c
ON sc.course_id=c.id
JOIN studets AS s
ON sc.student_id=s.id
WHERE c.name = 'Quantum Physics' AND s.is_graduated=1
GROUP BY c.id;

DELIMITER $

CREATE PROCEDURE udp_graduate_all_students_by_year (year_started INT)
BEGIN
UPDATE courses AS c
JOIN students_courses AS sc
ON sc.course_id=c.id
JOIN students AS s
ON s.id=sc.student_id
SET s.is_graduated=1
WHERE YEAR(c.start_date)= year_started;
END $
