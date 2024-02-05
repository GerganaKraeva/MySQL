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

-- 7. Define Function
-- Define a function ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50)) that returns 1 or 0
--  depending on that if the word is a comprised of the given set of letters.

DELIMITER $

CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS TINYINT
DETERMINISTIC 
BEGIN
    RETURN word REGEXP CONCAT('^[',set_of_letters,']+$');
END $


-- 8. Find Full Name
-- You are given a database schema with tables:
-- · account_holders(id (PK), first_name, last_name, ssn) and
-- · accounts(id (PK), account_holder_id (FK), balance).
-- Write a stored procedure usp_get_holders_full_name that selects the full names of all people.
--  The result should be sorted by full_name alphabetically and id ascending

DELIMITER $

CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
SELECT CONCAT(first_name,' ', last_name) AS `full_name` FROM account_holders
ORDER BY `full_name` ASC,id;
END $

CALL usp_get_holders_full_name();


-- 9. People with Balance Higher Than
-- Your task is to create a stored procedure usp_get_holders_with_balance_higher_than that accepts a 
-- number as a parameter and returns all people who have more money in total of all their accounts than the 
-- supplied number. The result should be sorted by account_holders.id ascending. 

DELIMITER $

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(number DECIMAL(10,2))
BEGIN
SELECT ah.first_name, ah.last_name FROM account_holders AS ah
JOIN accounts AS a ON a.account_holder_id=ah.id
WHERE number < (SELECT
SUM(balance) FROM accounts
WHERE ah.id=account_holder_id)
GROUP BY ah.id
ORDER BY ah.id;
END $

DELIMITER $

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(number DECIMAL(10,2))
BEGIN
SELECT ah.first_name, ah.last_name FROM account_holders AS ah
JOIN accounts AS a ON a.account_holder_id=ah.id
GROUP BY ah.id
HAVING SUM(a.balance) > number
ORDER BY ah.id;
END $


-- 10. Future Value Function
-- Your task is to create a function ufn_calculate_future_value that accepts as parameters – sum 
-- (with precision, 4 digits after the decimal point), yearly interest rate (double) and number of years(int).
--  It should calculate and return the future value of the initial sum. The result from the function must be decimal, 
--  with percision 4.

DELIMITER $

CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(10,4), yearly_interest_rate DOUBLE, years INT) RETURNS DECIMAL(10,4)
DETERMINISTIC
BEGIN
DECLARE result DECIMAL(10,4);
SET result= sum*POWER((1+yearly_interest_rate),years);
RETURN result;
END $

SELECT  ufn_calculate_future_value(1000,0.5,5);

-- 11. Calculating Interest
-- Your task is to create a stored procedure usp_calculate_future_value_for_account that accepts as parameters –
--  id of account and interest rate. The procedure uses the function from the previous problem to give an interest 
--  to a person's account for 5 years, along with information about his/her account id, first name, last name and 
--  current balance as it is shown in the example below. It should take the account_id and the interest_rate as parameters.
--  Interest rate should have precision up to 0.0001, same as the calculated balance after 5 years. Be extremely careful 
--  to achieve the desired precision!

DELIMITER $
CREATE FUNCTION ufn_calculate_future_value(initial_sum DECIMAL(19,4), yearly_interest_rate Decimal(19,5), years INT) RETURNS DECIMAL(10,4)
DETERMINISTIC
BEGIN
DECLARE result DECIMAL(10,4);
SET result= initial_sum*POWER((1+yearly_interest_rate),years);
RETURN result;
END $

CREATE PROCEDURE usp_calculate_future_value_for_account(user_id INT , user_interest_rate DECIMAL(10,4))
BEGIN
SELECT a.id AS 'account_id', 
ah.first_name, ah.last_name, 
a.balance AS 'current_balance',
ufn_calculate_future_value(a.balance, user_interest_rate, 5) AS 'balance_in_5_years'
FROM accounts AS a
JOIN account_holders AS ah
ON a.account_holder_id=ah.id
WHERE user_id=a.id;
END  $

DELIMITER ;
CALL usp_calculate_future_value_for_account(2,0.1);

-- 12. Deposit Money
-- Add stored procedure usp_deposit_money(account_id, money_amount) that operate in transactions. Follow us:
-- Make sure to guarantee valid positive money_amount with precision up to fourth sign after decimal point.
--  The procedure should produce exact results working with the specified precision.

DELIMITER $

CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(10,4))
BEGIN
    START TRANSACTION;
    IF((select COUNT(*) FROM accounts 
        WHERE id=account_id ) <> 1 OR money_amount <0 ) THEN
    ROLLBACK;
    ELSE
       UPDATE accounts SET balance = balance + money_amount WHERE id=account_id;
       COMMIT;
    END IF;
END $

DELIMITER ;
CALL usp_deposit_money(1,10);

-- 13. Withdraw Money
-- Add stored procedures usp_withdraw_money(account_id, money_amount) that operate in transactions.
-- Make sure to guarantee withdraw is done only when balance is enough and money_amount is valid positive number.
--  Work with precision up to fourth sign after decimal point. The procedure should produce exact results working
--  with the specified precision.

DELIMITER $

CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19,4))
BEGIN
    START TRANSACTION;
    IF(((SELECT COUNT(*) FROM accounts 
        WHERE id=account_id ) <> 1) OR
        ((SELECT balance FROM accounts WHERE id=account_id ) < money_amount) OR 
        money_amount < 0 ) THEN
    ROLLBACK;
    ELSE
       UPDATE accounts SET balance = balance - money_amount WHERE id=account_id;
       COMMIT;
    END IF;
END $

-- 14. Money Transfer
-- Write stored procedure usp_transfer_money(from_account_id, to_account_id, amount) that transfers money from one account to another.
--  Consider cases when one of the account_ids is not valid, the amount of money is negative number, 
--  outgoing balance is enough or transferring from/to one and the same account. Make sure that the whole procedure passes
--  without errors and if error occurs make no change in the database.
-- Make sure to guarantee exact results working with precision up to fourth sign after decimal point.

DELIMITER $

CREATE PROCEDURE usp_transfer_money(from_account_id DECIMAL(19,4), to_account_id DECIMAL(19.4), amount DECIMAL(19,4))
BEGIN
START TRANSACTION;
IF (((SELECT COUNT(*) FROM accounts WHERE id=from_account_id) <> 1) OR
   ((SELECT balance FROM accounts WHERE id=from_account_id ) < amount) OR
   (( SELECT COUNT(*) FROM accounts WHERE id=to_account_id) <> 1) OR 
   (from_account_id=to_account_id) OR
   (amount < 0)) THEN 
   ROLLBACK;
ELSE  
       UPDATE accounts SET balance = balance - amount WHERE id=from_account_id;
	UPDATE accounts 
SET 
    balance = balance + amount
WHERE
    id = to_account_id;
       COMMIT;
END IF;
END $


-- 15. Log Accounts Trigger
-- Create another table – logs(log_id, account_id, old_sum, new_sum). Add a trigger to the accounts table
--  that enters a new entry into the logs table every time the sum on an account changes.

DELIMITER ;

CREATE TABLE logs(
 log_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 account_id INT NOT NULL,
 old_sum DECIMAL (19,4),
 new_sum DECIMAL (19,4)
 );
 DELIMITER $
 CREATE TRIGGER tr_update_logs
 AFTER UPDATE
 ON accounts
 FOR EACH ROW
 BEGIN
 INSERT logs(account_id,old_sum, new_sum)
 VALUES(old.id, old.balance, new.balance);
 END $
 
 
--  16. Emails Trigger
-- Create another table – notification_emails(id, recipient, subject, body). 
-- Add a trigger to logs table to create new email whenever new record is inserted in logs table.
--  The following data is required to be filled for each email:

-- · recipient – account_id
-- · subject – "Balance change for account: {account_id}"
-- · body - "On {date (current date)} your balance was changed from {old} to {new}.

DELIMITER ;

CREATE TABLE notification_emails(
id  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 recipient INT NOT NULL,
 subject VARCHAR(2000),
 body TEXT);
 
 CREATE TABLE logs(
 log_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 account_id INT NOT NULL,
 old_sum DECIMAL (19,4),
 new_sum DECIMAL (19,4)
 );
  DELIMITER $
 CREATE TRIGGER tr_update_logs
 AFTER UPDATE
 ON accounts
 FOR EACH ROW
 BEGIN
 INSERT logs(account_id,old_sum, new_sum)
 VALUES(old.id, old.balance, new.balance);
 END $
 
 DELIMITER $
 
 CREATE TRIGGER tr_insert
 AFTER INSERT
 ON logs
 FOR EACH ROW
 BEGIN
     INSERT INTO notification_emails(recipient, subject, body) 
     VALUES (new.account_id,
     CONCAT ('Balance change for account: ',new.account_id),
     CONCAT ('On ',DATE_FORMAT(NOW(),'%b %d %Y at %r'),' your balance was changed from ',
     ROUND(new.old_sum,0),' to ', ROUND(new.new_sum ,0),'.'));
 END $
 
 DELIMITER ;
 DROP TRIGGER tr_insert;
