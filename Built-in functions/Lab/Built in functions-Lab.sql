-- 1. Find Book Titles
-- Write a SQL query to find books which titles start with "The". Order the result by id.

SELECT title FROM books
WHERE SUBSTRING(title,1,4)='The ';

-- 2. Replace Titles
-- Write a SQL query to find books which titles start with "The" and replace the substring with 3 asterisks. Retrieve data about the updated titles. Order the result by id.

SELECT 
REPLACE (title,'The','***') AS 'title'
FROM books
WHERE SUBSTR(title, 1, 4)='The '
ORDER BY id;