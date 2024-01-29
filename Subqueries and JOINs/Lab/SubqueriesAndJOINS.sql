-- 1. Managers
-- Write a query to retrieve information about the managers – id, full_name, deparment_id and department_name.
--  Select the first 5 departments ordered by employee_id

SELECT
 employee_id,
 CONCAT(first_name,' ', last_name) AS 'full_name',
 departments.department_id,
 name AS 'department_name'
FROM departments 
    JOIN employees 
    ON   departments.manager_id = employees.employee_id
ORDER BY employee_id
LIMIT 5;

-- 2. Towns Addresses
-- Write a query to get information about the addresses in the database, which are in San Francisco, Sofia or Carnation.
--  Retrieve town_id, town_name, address_text. Order the result by town_id, then by address_id.

SELECT t.town_id,
t.name,
address_text
FROM towns AS t
    JOIN addresses AS a ON  a.town_id=t.town_id
WHERE t.name IN ('San Francisco', 'Sofia','Carnation')
ORDER BY t.town_id,a.address_id;

-- 3. Employees Without Managers
-- Write a query to get information about employee_id, first_name, last_name, department_id and salary 
-- for all employees who don't have a manager

SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees
WHERE manager_id IS NULL;

-- 4. Higher Salary
-- Write a query to count the number of employees who receive salary higher than the average.