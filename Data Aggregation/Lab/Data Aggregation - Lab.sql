-- 1. Departments Info
-- Write a query to count the number of employees in each department by id. Order the information by deparment_id, then by Number of employees.

SELECT department_id,COUNT(department_id) AS 'Number of employees'
FROM employees
GROUP BY  department_id;

-- 2. Average Salary
-- Write a query to calculate the average salary in each department. Order the information by department_id. Round the salary result to two digits after the decimal point. Submit your queries with the MySQL prepare DB & run queries strategy.

SELECT department_id, ROUND(AVG(salary),2) AS 'Average Salary'
FROM employees
GROUP BY  department_id
ORDER BY department_id;

-- 3. Min Salary
-- Write a query to retrieve information about the departments grouped by department_id with minimum salary higher than 800. Round the salary result to two digits after the decimal point. Submit your queries with the MySQL prepare DB & run queries strategy.

SELECT 
department_id,
MIN(salary) AS `Min Salary`
FROM employees
GROUP BY department_id
HAVING `Min Salary` > 800;

-- 4. Appetizers Count
-- Write a query to retrieve the count of all appetizers (category id = 2) with price higher than 8

SELECT  COUNT(*) FROM products
WHERE category_id=2 AND price > 8;

-- 5. Menu Prices
-- Write a query to retrieve information about the prices of each category. The output should consist of:
-- · Category_id
-- · Average Price
-- · Cheapest Product
-- · Most Expensive Product
-- See the examples for more information. Round the results to 2 digits after the decimal poin

SELECT category_id, 
ROUND(AVG(price),2) AS `Average Price`,
ROUND(MIN(price),2) AS `Cheapest Product`,
ROUND(max(price),2) AS `Most Expensive Product`
FROM products
GROUP BY category_id;