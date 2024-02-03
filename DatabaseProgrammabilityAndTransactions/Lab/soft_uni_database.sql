-- 1. Count Employees by Town
-- Write a function ufn_count_employees_by_town(town_name) that accepts town_name as parameter and returns
--  the count of employees who live in that to

DELIMITER $
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE  result INT;
SET @result:=(SELECT
  COUNT(*)
  FROM employees AS e
  JOIN addresses AS a
  ON a.address_id=e.address_id
  JOIN towns AS t
  ON a.town_id=t.town_id
  WHERE t.name=town_name
  );
RETURN @result;
END$

SELECT ufn_count_employees_by_town('Sofia');


-- 2. Employees Promotion
-- Write a stored procedure usp_raise_salaries(department_name) to raise the salary of all
--  employees in given department as parameter by 5

DELIMITER $

CREATE PROCEDURE  usp_raise_salaries(department_name VARCHAR(50))
BEGIN
UPDATE employees AS e
JOIN departments AS d
ON d.department_id= e.department_id
SET e.salary=e.salary*1.05
WHERE d.name=department_name;
END$


-- 3. Employees Promotion by ID
-- Write a stored procedure usp_raise_salary_by_id(id) that raises a given employee's
--  salary (by id as parameter) by 5%. Consider that you cannot promote an employee that doesn't 
--  exist – if that happens, no changes to the database should be made.

DELIMITER $

CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
START TRANSACTION;
IF ( (SELECT COUNT(*) FROM employees WHERE employee_id = id ) <> 1) THEN
ROLLBACK;
ELSE 
UPDATE employees
SET salary=1.05*salary
WHERE employee_id=id;
COMMIT;
END IF;
END$


-- 4. Triggered
-- Create a table deleted_employees(employee_id PK, first_name,last_name,middle_name,job_title,deparment_id,salary) that will hold
-- information about fired(deleted) employees from the employees table. 
-- Add a trigger to employees table that inserts the corresponding information in deleted_employees.

CREATE TABLE deleted_employees (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
middle_name VARCHAR(50),
job_title VARCHAR(80),
department_id INT,
salary DOUBLE
);

CREATE TRIGGER deleted_employees_trigger
AFTER DELETE
ON employees
FOR EACH ROW
INSERT INTO deleted_employees(first_name, last_name, middle_name, job_title,department_id, salary)
VALUES (old.first_name, old.last_name, old.middle_name, old.job_title, old.department_id, old.salary);





