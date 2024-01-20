-- 1. Find Names of All Employees by First Name
-- Write a SQL query to find first and last names of all employees whose first name starts with "Sa" (case 
-- insensitively). Order the information by id. 

SELECT first_name, last_name FROM employees
WHERE SUBSTRING(first_name, 1,2)='Sa'
ORDER BY employee_id;

-- 2. Find Names of All Employees by Last Name
-- Write a SQL query to find first and last names of all employees whose  last name contains "ei" (case insensitively). 
-- Order the information by id.

SELECT first_name, last_name FROM employees
WHERE last_name like '%ei%'
ORDER BY employee_id;

-- 3. Find First Names of All Employees
-- Write a SQL query to find the first names of all employees in the departments with ID 3 or 10 and whose hire year is 
-- between 1995 and 2005 inclusively. Order the information by id.

SELECT first_name FROM employees
WHERE department_id IN(3,10) AND DATE_FORMAT(hire_date,'%Y') BETWEEN 1995 AND 2005
ORDER BY employee_id;

-- 4. Find All Employees Except Engineers
-- Write a SQL query to find the first and last names of all employees whose job titles does not contain "engineer". 
-- Order the information by id.

SELECT first_name, last_name FROM employees
WHERE LOCATE ('engineer' , job_title) = 0
ORDER BY employee_id;

-- 5. Find Towns with Name Length
-- Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name. 

SELECT `name` FROM towns
WHERE CHAR_LENGTH(name) IN(5,6)
ORDER BY `name`;

-- 6. Find Towns Starting With
-- Write a SQL query to find all towns that start with letters M, K, B or E (case insensitively). Order them 
-- alphabetically by town name. 

SELECT town_id,`name` FROM towns
WHERE `name` REGEXP '^[M,K,B,E]'
ORDER BY `name`;

-- 7. Find Towns Not Starting With
-- Write a SQL query to find all towns that do not start with letters R, B or D (case insensitively). Order them 
-- alphabetically by name.

SELECT town_id,`name` FROM towns
WHERE `name` REGEXP '^[^R,B,D]'
ORDER BY `name`;

-- 8. Create View Employees Hired After 2000 Year
-- Write a SQL query to create view v_employees_hired_after_2000 with the first and the last name of all employees 
-- hired after 2000 year. Select all from the created view.

CREATE VIEW v_employees_hired_after_2000 AS
SELECT  first_name, last_name FROM employees
WHERE DATE_FORMAT(hire_date,'%Y') > 2000;

-- 9. Length of Last Name
-- Write a SQL query to find the first and last names of all employees whose last name is exactly 5 characters long.

SELECT first_name, last_name FROM employees
WHERE CHAR_LENGTH(last_name)=5;

-- 10. Countries Holding 'A' 3 or More Times
-- Find all countries that hold the letter 'A' in their name at least 3 times (case insensitively), sorted by ISO code. 
-- Display the country name and the ISO code.





-- 11. Mix of Peak and River Names
-- Combine all peak names with all river names, so that the last letter of each peak name is the same as the first letter 
-- of its corresponding river name. Display the peak name, the river name, and the obtained mix(converted to lower 
-- case). Sort the results by the obtained mix alphabetically.

SELECT peak_name, river_name, CONCAT( Lower(peak_name),LOWER(SUBSTRING(river_name,2))) AS 'mix' FROM peaks, rivers
WHERE RIGHT(peak_name,1)=LEFT(river_name,1)
ORDER BY mix;

-- 12. Games from 2011 and 2012 Year
-- Find the top 50 games ordered by start date, then by name. Display only the games from the years 2011 and 2012. 
-- Display the start date in the format "YYYY-MM-DD".

SELECT name, DATE_FORMAT(start,'%Y-%m-%d') AS 'start'FROM games
WHERE DATE_FORMAT(start,'%Y') IN (2011,2012)
ORDER BY start;