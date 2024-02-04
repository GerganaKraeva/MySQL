-- 1. Employees with Salary Above 35000
-- Create stored procedure usp_get_employees_salary_above_35000 that returns all employees' first
-- and last names for whose salary is above 35000. The result should be sorted by first_name then by 
-- last_name alphabetically, and id ascendi

DELIMITER $
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT first_name, last_name
FROM employees
WHERE salary > 35000
ORDER BY first_name, last_name;
END $

CALL  usp_get_employees_salary_above_35000();

-- 2. Employees with Salary Above Number
-- Create stored procedure usp_get_employees_salary_above that accept a decimal number 
-- (with precision, 4 digits after the decimal point) as parameter and return all employee's first
--  and last names whose salary is above or equal to the given number. The result should be sorted by 
--  first_name then by last_name alphabetically and id ascending

DELIMITER $
CREATE PROCEDURE usp_get_employees_salary_above(number DECIMAL(12,4))
BEGIN
SELECT first_name, last_name
FROM employees
WHERE salary >=number
ORDER BY first_name, last_name;
END $


-- 3. Town Names Starting With
-- Write a stored procedure usp_get_towns_starting_with that accept string as parameter and returns all town names
--  starting with that string. The result should be sorted by town_name alphabeticall

DELIMITER $

CREATE PROCEDURE usp_get_towns_starting_with(parameter VARCHAR(20))
BEGIN
SELECT name
FROM towns
WHERE name LIKE CONCAT(parameter,'%')
ORDER BY name;
END $
DELIMITER ;
DROP PROCEDURE usp_get_towns_starting_with;
CALL usp_get_towns_starting_with('B');


-- 4. Employees from Town
-- Write a stored procedure usp_get_employees_from_town that accepts town_name as parameter and return 
-- the employees' first and last name that live in the given town. The result should be sorted by first_name then by 
-- last_name alphabetically and id ascending.

DELIMITER $
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(20))
BEGIN
SELECT e.first_name, e.last_name FROM employees AS e
JOIN addresses AS a
ON a.address_id=e.address_id
JOIN towns AS t
ON t.town_id=a.town_id
WHERE t.name=town_name
ORDER BY e.first_name, e.last_name;
END $

 CALL usp_get_employees_from_town('Redmond');
 
--  5. Salary Level Function
-- Write a function ufn_get_salary_level that receives salary of an employee and returns the level of the salary.
-- · If salary is < 30000 return "Low"
-- · If salary is between 30000 and 50000 (inclusive) return "Average"
-- · If salary is > 50000 return "High"

DELIMITER $

CREATE FUNCTION ufn_get_salary_level(salary_of_employee DECIMAL(10,4))
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
DECLARE level_salary VARCHAR(20);
    IF( salary_of_employee < 30000) THEN 
    SET level_salary:='Low';
    ELSEIF (salary_of_employee <= 50000) THEN
    SET level_salary:='Average';
    ELSE
        SET level_salary:='High';
	END IF;
    RETURN level_salary;
END $

SELECT ufn_get_salary_level(13500);

-- 6. Employees by Salary Level
-- Write a stored procedure usp_get_employees_by_salary_level that receive as parameter level of salary
-- (low, average or high) and print the names of all employees that have given level of salary.
-- The result should be sorted by first_name then by last_name both in descending order.

DELIMITER $
CREATE FUNCTION ufn_get_salary_level(salary_of_employee DECIMAL(10,4))
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
DECLARE level_salary VARCHAR(20);
    IF( salary_of_employee < 30000) THEN 
    SET level_salary:='Low';
    ELSEIF (salary_of_employee <= 50000) THEN
    SET level_salary:='Average';
    ELSE
        SET level_salary:='High';
	END IF;
    RETURN level_salary;
END $

CREATE PROCEDURE usp_get_employees_by_salary_level(level_salary VARCHAR(20))
BEGIN
SELECT first_name, last_name FROM employees
WHERE level_salary=ufn_get_salary_level(salary)
ORDER BY first_name DESC, last_name DESC;
END $

CALL usp_get_employees_by_salary_level('High');
