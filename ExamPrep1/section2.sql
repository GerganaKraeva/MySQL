

INSERT INTO courses (name, duration_hours, start_date, teacher_name, description,university_id)
SELECT  CONCAT(teacher_name,' ','course'),
        (CHAR_LENGTH(name))/10,
        DATE_ADD(start_date, INTERVAL 5 DAY),
		REVERSE(teacher_name),
		CONCAT('Course ', teacher_name, REVERSE(description)),
        DAY(start_date)
FROM courses
WHERE id <=5;

UPDATE universities
SET tuition_fee = tuition_fee+300
WHERE id  BETWEEN 5 AND 12;


DELETE FROM universities
WHERE number_of_staff IS NULL;
