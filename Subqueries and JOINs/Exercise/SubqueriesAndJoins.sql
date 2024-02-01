-- 1. Employee Address
-- Write a query that selects:
-- • employee_id
-- • job_title
-- • address_id
-- • address_text

SELECT e.employee_id, e.job_title, e.address_id, addresses.address_text
FROM employees AS e
JOIN  addresses ON e.address_id =addresses.address_id
ORDER BY e.address_id
LIMIT 5;

-- 2. Addresses with Towns
-- Write a query that selects:
-- · first_name
-- · last_name
-- · town
-- · address_text
-- Sort the result by first_name in ascending order then by last_name. Select first 5 employees.

SELECT e.first_name, e.last_name, towns.name,  addresses.address_text
FROM employees AS e
JOIN addresses ON  e.address_id=addresses.address_id
JOIN towns ON towns.town_id=addresses.town_id
ORDER BY e.first_name, e.last_name
LIMIT 5;

-- 3. Sales Employee
-- Write a query that selects:
-- · employee_id
-- · first_name
-- · last_name
-- · department_name
-- Sort the result by employee_id in descending order. Select only employees from the "Sales" department

SELECT e.employee_id, e.first_name, e.last_name, d.name
FROM departments AS d
JOIN employees AS e
 ON e.department_id=d.department_id
 WHERE d.name='Sales'
ORDER BY e.employee_id DESC;

-- 4. Employee Departments
-- Write a query that selects:
-- · employee_id
-- · first_name
-- · salary
-- · department_name
-- Filter only employees with salary higher than 15000. Return the first 5 rows sorted by department_id in descending order.

SELECT e.employee_id, e.first_name, e.salary, d.name
FROM employees AS e
JOIN departments AS d
ON d.department_id=e.department_id
WHERE e.salary > 15000
ORDER BY e.department_id DESC
LIMIT 5;

-- 5. Employees Without Project
-- Write a query that selects:
-- · employee_id
-- · first_name
-- Filter only employees without a project.
--  Return the first 3 rows sorted by employee_id in descending order.

SELECT e.employee_id, e.first_name
FROM employees AS e
LEFT JOIN  employees_projects AS ep
ON e.employee_id =ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

-- 6. Employees Hired After
-- Write a query that selects:
-- · first_name
-- · last_name
-- · hire_date
-- · dept_name
-- Filter only employees hired after 1/1/1999 and from either the "Sales" or the "Finance" departments. Sort the result by hire_date (ascending).

SELECT e.first_name, e.last_name, e.hire_date, d.name
FROM employees AS e
JOIN departments AS d ON
d.department_id=e.department_id
WHERE d.name  IN ('Sales', 'Finance')  AND e.hire_date >'1999-01-01'
ORDER BY e.hire_date;

-- 7. Employees with Project
-- Write a query that selects:
-- · employee_id
-- · first_name
-- · project_name
-- Filter only employees with a project, which has started after 13.08.2002 and it is still ongoing (no end date).
--  Return the first 5 rows sorted by first_name then by project_name both in ascending order.


SELECT e.employee_id, e.first_name, pr.name
FROM employees AS e
 JOIN employees_projects AS ep ON
e.employee_id=ep.employee_id
 JOIN projects AS pr ON
pr.project_id=ep.project_id
WHERE DATE(pr.start_date) > '2002-08-13'  AND  pr.end_date IS NULL
ORDER BY e.first_name, pr.name
LIMIT 5;

-- 8. Employee 24
-- Write a query that selects:
-- · employee_id
-- · first_name
-- · project_name
-- Filter all the projects of employees with id 24.
--  If the project has started after 2005 inclusively the return value should be NULL.
--  Sort the result by project_name alphabetically.

SELECT e.employee_id, e.first_name,
IF (YEAR(pr.start_date)>=2005, NULL,pr.name) AS 'project_name'
FROM employees AS e
  JOIN employees_projects AS ep
  ON e.employee_id=ep.employee_id
  JOIN projects AS pr 
 ON pr.project_id=ep.project_id
WHERE e.employee_id = 24
ORDER BY pr.name;

-- 9. Employee Manager
-- Write a query that selects:
-- · employee_id
-- · first_name
-- · manager_id
-- · manager_name
-- Filter all employees with a manager who has id equal to 3 or 7. 
-- Return all rows sorted by employee first_name in ascending order.

SELECT e.employee_id,
 e.first_name,
 e.manager_id,
 m.first_name AS 'manager_id'
 FROM employees AS e
 JOIN employees AS m
 ON e.manager_id = m.employee_id
 WHERE e.manager_id IN (3, 7)
ORDER BY e.first_name;


-- 10. Employee Summary
-- Write a query that selects:
-- · employee_id
-- · employee_name
-- · manager_name
-- · department_name
-- Show the first 5 employees (only for employees who have a manager) 
-- with their managers and the departments they are in (show the departments of the employees). Order by employee_id.

SELECT e.employee_id,
CONCAT( e.first_name,' ',e.last_name) AS 'employee_name',
CONCAT(m.first_name,' ', m.last_name) AS 'manager_name',
d.name AS 'department_name'
FROM employees AS e
JOIN employees AS m
ON e.manager_id = m.employee_id
JOIN departments AS d
ON e.department_id= d.department_id
ORDER BY e.employee_id
LIMIT 5;


-- 11. Min Average Salary
-- Write a query that returns the value of the lowest average salary of all departments.

SELECT AVG(salary) 'min_average_salary'
FROM employees 
GROUP BY department_id
ORDER BY min_average_salary
LIMIT 1;


-- 12. Highest Peaks in Bulgaria
-- Write a query that selects:
-- · country_code
-- · mountain_range
-- · peak_name
-- · elevation
-- Filter all peaks in Bulgaria with elevation over 2835.
--  Return all rows sorted by elevation in descending order

SELECT mc.country_code,
m.mountain_range,
p.peak_name,
p.elevation
FROM mountains_countries AS mc
JOIN mountains AS m
ON mc.mountain_id= m.id
JOIN peaks AS p
ON p.mountain_id=mc.mountain_id
WHERE p.elevation>2835 AND mc.country_code = (SELECT country_code
FROM countries
WHERE country_name IN ('Bulgaria'))
ORDER BY p.elevation DESC;


-- 13. Count Mountain Ranges
-- Write a query that selects:
-- · country_code
-- · mountain_range
-- Filter the count of the mountain ranges in the United States, Russia and Bulgaria.
--  Sort result by mountain_range count in decreasing order.

SELECT mc.country_code, COUNT(*) AS `mountain_range`
FROM mountains_countries AS mc
WHERE mc.country_code IN ('BG', 'RU','ÚS') 
GROUP BY mc.country_code
ORDER BY `mountain_range` DESC;

-- 14. Countries with Rivers
-- Write a query that selects:
-- · country_name
-- · river_name
-- Find the first 5 countries with or without rivers in Africa. Sort them by country_name in ascending order.

SELECT c.country_name,
r.river_name
FROM countries AS c
 LEFT JOIN countries_rivers AS cr
ON c.country_code=cr.country_code
LEFT JOIN rivers AS r
ON cr.river_id=r.id
 LEFT JOIN continents AS cont
 ON c.continent_code=cont.continent_code
WHERE cont.continent_name IN ('Africa')  
ORDER BY c.country_name
LIMIT 5;



