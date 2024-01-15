CREATE DATABASE soft_uni;
USE soft_uni;

CREATE TABLE  towns(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(85) NOT NULL
);

INSERT INTO towns(name) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

CREATE TABLE addresses (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
address_text VARCHAR(255) NOT NULL,
town_id INT
);

ALTER TABLE addresses
ADD CONSTRAINT FK_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

INSERT INTO addresses (address_text, town_id) VALUES
('Iztok',1),
('Zapad',2),
('Liulin',3),
('Manastirski livadi',4);


CREATE TABLE departments(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

INSERT INTO departments(name) VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');


CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(80),
middle_name VARCHAR(80),
last_name VARCHAR(80),
job_title VARCHAR(80),
department_id INT,
hire_date DATE,
salary DOUBLE (6,2),
address_id INT
);


ALTER TABLE employees
ADD CONSTRAINT fk_department_id FOREIGN KEY(department_id) REFERENCES departments(id);


ALTER TABLE employees
ADD CONSTRAINT fk_address_id FOREIGN KEY(address_id) REFERENCES addresses(id);

INSERT INTO employees(first_name, middle_name, last_name, job_title,department_id,hire_date, salary,address_id) VALUES
('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013-02-01','3500.00',1),
('Petar','Petrov','Petrov','Senior Engineer',1,'2004-03-02','4000.00',2),
('Maria','Petrova','Ivanova','Intern',5,'2016-08-28','525.25',1),
('Georgi','Terziev','Ivanov','CEO',2,'2007-12-09','3000.00',3),
('Peter','Pan','Pan','Intern',3,'2016-08-28','599.88',1);

-- Task14
-- Basic Select All Fields

USE soft_uni;
SELECT*FROM towns;
SELECT*FROM departments;
SELECT*FROM employees;

-- Task15
-- Basic Select All Fields and Order Them
-- towns - alphabetically by name
-- departments - alphabetically by name
-- employees - descending by salary

SELECT id, 
    name
 FROM towns
 ORDER BY name ASC;

SELECT id, 
    name
 FROM departments
 ORDER BY name ASC;

SELECT id ,
first_name,
middle_name,
last_name ,
job_title,
department_id ,
hire_date ,
salary,
address_id 
 FROM employees
 ORDER BY salary DESC;
 
--  Task16
-- Modify queries from previous problem to show only some of the columns. For table:
--  towns – name
-- ·departments – name
-- ·employees – first_name, last_name, job_title, salary

SELECT DISTINCT name FROM towns
ORDER BY name ASC;

SELECT DISTINCT name FROM departments
ORDER BY name ASC;

SELECT DISTINCT first_name, last_name, job_title, salary FROM employees
ORDER BY salary DESC;

-- 17. Increase Employees Salary 
UPDATE employees
SET  salary = salary * 1.1;

SELECT DISTINCT salary FROM employees;