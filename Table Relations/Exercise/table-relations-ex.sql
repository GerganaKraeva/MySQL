-- 1. One-To-One Relationship
-- Create two tables as follows. Use appropriate data types

CREATE TABLE passports (
passport_id  INT PRIMARY KEY AUTO_INCREMENT,
passport_number VARCHAR(10) UNIQUE
);

INSERT INTO passports VALUES 
(101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2');

CREATE TABLE people (
person_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(80) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
passport_id INT UNIQUE NOT NULL,
CONSTRAINT fk_passport_id_passpots_passport_id
FOREIGN KEY (passport_id)
REFERENCES passports(passport_id)
);

INSERT INTO people (first_name, salary, passport_id) VALUES 
('Roberto', 43300.00,102),
('Tom', 56100.00,103),
('Yana', 60200.00,101);

    payment_amount DECIMAL(8,2),
    student_id INT,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

CREATE TABLE agenda (
    student_id INT(11),
    subject_id INT(11),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id)
    REFERENCES students(student_id),
    FOREIGN KEY (subject_id)
    REFERENCES subjects(subject_id)
);
-- 9. Peaks in Rila
USE geography;

SELECT m.mountain_range, p.peak_name, p.elevation AS `peak_elevation`FROM peaks p
JOIN mountains m
ON p.mountain_id = m.id
WHERE m.mountain_range = 'Rila'
ORDER BY p.elevation DESC;




