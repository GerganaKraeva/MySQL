-- 1. Records' Count
-- Import the database and send the total count of records to Mr. Bodrog. Make sure nothing got lost.

SELECT COUNT(*) FROM wizzard_deposits;

-- 2. Longest Magic Wand
-- Select the size of the longest magic wand. Rename the new column appropriately.

SELECT MAX(magic_wand_size) AS `longest_magic_wand`
 FROM wizzard_deposits;
 
--  3. Longest Magic Wand Per Deposit Groups
-- For wizards in each deposit group show the longest magic wand. Sort result by longest magic wand for each deposit group in increasing order, then by deposit_group alphabetically. Rename the new column appropriately.

SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand`
 FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY `longest_magic_wand`, deposit_group;

-- 4. Smallest Deposit Group Per Magic Wand Size*
-- Select the deposit group with the lowest average wand size.

-- 5. Deposits Sum
-- Select all deposit groups and its total deposit sum. Sort result by total_sum in increasing order.

SELECT deposit_group, SUM(deposit_amount) AS `total_sum`FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY `total_sum`,deposit_group;

-- 6. Deposits Sum for Ollivander Family
-- Select all deposit groups and its total deposit sum but only for the wizards who has their magic wand crafted by Ollivander family. Sort result by deposit_group alphabetically.

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` 
FROM wizzard_deposits
WHERE magic_wand_creator='Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;

-- 7. Deposits Filter
-- Select all deposit groups and its total deposit sum but only for the wizards who has their magic wand crafted by Ollivander family. After this, filter total deposit sums lower than 150000. Order by total deposit sum in descending order.

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` 
FROM wizzard_deposits
WHERE magic_wand_creator='Ollivander family'
GROUP BY deposit_group
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

-- 8. Deposit Charge
-- Create a query that selects:
-- • Deposit group
-- • Magic wand creator
-- • Minimum deposit charge for each group
-- Group by deposit_group and magic_wand_creator.
-- Select the data in ascending order by magic_wand_creator and deposit_group.

SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) AS `min_deposit_charge`
FROM wizzard_deposits
GROUP BY deposit_group , magic_wand_creator
ORDER BY magic_wand_creator,deposit_group;

-- 9. Age Groups
-- Write down a query that creates 7 different groups based on their age.
-- Age groups should be as follows:
-- • [0-10]
-- • [11-20]
-- • [21-30]
-- • [31-40]
-- • [41-50]
-- • [51-60]
-- • [61+]
-- The query should return:
-- • Age groups
-- • Count of wizards in it
-- Sort result by increasing size of age groups.