-- 1. Find Book Titles
-- Write a SQL query to find books which titles start with "The". Order the result by id.

SELECT title FROM books
WHERE SUBSTRING(title,1,4)='The ';

SELECT title FROM books
WHERE title Like 'The%';

-- 2. Replace Titles
-- Write a SQL query to find books which titles start with "The" and replace the substring with 3 asterisks. Retrieve data about the updated titles. Order the result by id.

SELECT 
REPLACE (title,'The','***') AS 'title'
FROM books
WHERE SUBSTR(title, 1, 4)='The '
ORDER BY id;


-- 3. Sum Cost of All Books
-- Write a SQL query to sum prices of all books. Format the output to 2 digits after decimal point.

SELECT ROUND(SUM(cost),2) AS 'Cost' FROM books;

-- 4. Days Lived
-- Write a SQL query to calculate the days that an author lived. Your query should return:
-- · Full Name – the full name of the author.
-- · Days Lived – days that he/she lived. NULL values mean that the author is still alive.authors

SELECT 
CONCAT(first_name,' ',last_name) AS 'Full name', 
TIMESTAMPDIFF(DAY, born, died) AS 'Days Lived'
FROM authors;

-- 5. Harry Potter Books
-- Write a SQL query to retrieve titles of all the Harry Potter books. Order the information by id


SELECT title FROM books
WHERE title LIKE 'Harry Potter%';