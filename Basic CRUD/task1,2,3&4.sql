-- Problem 1: Select Employee Information
-- Write a query to select all employees and retrieve information about their id, first_name, last_name and job_title ordered by id.

SELECT id, first_name, last_name ,job_title  FROM employees
ORDER BY id ASC;

-- Problem 2: Select Employees with Filter
-- Write a query to select all employees (id, first_name and last_name (as full_name), job_title, salary) whose salaries are higher than 1000.00, ordered by id. Concatenate fields first_name and last_name into 'full_name'.

SELECT id, 
CONCAT(first_name,' ',last_name) AS 'full_name',
job_title,
salary
FROM employees
WHERE salary>1000
ORDER BY id ASC;

-- Problem 3: Update Employees Salary
-- Update all employees' salaries whose job_title is "Manager" by adding 100.
SET SQL_SAFE_UPDATES=0;


UPDATE employees
SET salary = salary+100
WHERE job_title = 'Manager';

Select salary FROM employees;

-- Problem 4: Top Paid Employee
CREATE VIEW `top_paid_employee` AS
SELECT id, first_name, last_name,job_title, department_id, salary FROM employees
ORDER BY salary DESC
LIMIT 1;

SELECT*FROM top_paid_employee;
