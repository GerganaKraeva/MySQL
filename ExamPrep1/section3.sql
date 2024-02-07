SELECT id, name, population, country_id
FROM cities
ORDER BY population DESC;

SELECT first_name, last_name,age, phone, email
FROM students
WHERE age>=21
ORDER BY first_name DESC, email ASC, id ASC
lIMIT 10;


SELECT
    CONCAT(first_name, ' ', last_name) AS 'full_name',
    SUBSTRING(email,2,10) AS 'username',
    REVERSE(phone) AS 'password'
FROM students
LEFT JOIN students_courses AS sc
ON students.id=sc.student_id
WHERE sc.course_id IS NULL
ORDER BY  REVERSE(phone) DESC;

SELECT  COUNT(*) AS `students_count`, u.name AS `university_name`
FROM students_courses AS sc
LEFT JOIN courses AS c ON c.id=sc.course_id
LEFT JOIN students AS s ON sc.student_id=s.id
LEFT JOIN universities AS u ON c.university_id=u.id
GROUP BY c.university_id
HAVING `students_count` >= 8
ORDER BY `students_count` DESC, `university_name` DESC;

SELECT u.name AS `university_name`,
       c.name AS `city_name`,
       u.address,
	   CASE
           WHEN u.tuition_fee < 800 THEN 'cheap'
		   WHEN u.tuition_fee < 1200 THEN 'normal'
           WHEN u.tuition_fee < 2500 THEN 'high'
           ELSE 'expensive'
		END AS `price_rank`,
        u.tuition_fee
FROM universities AS u
JOIN cities AS c
ON c.id=u.city_id
ORDER BY u.tUition_fee ASC;
