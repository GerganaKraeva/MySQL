-- 1. Mountains and Peaks
-- Write a query to create two tables – mountains and peaks and link their fields properly. Tables should have:
-- - Mountains:
-- • id 
-- • name
-- - Peaks: 
-- • id
-- • name
-- • mountain_id

CREATE TABLE mountains (
id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL );

CREATE TABLE peaks (
id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
mountain_id INT ,
CONSTRAINT fk_mountain_id_maountains_id
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
  );
  
--   2. Trip Organization
-- Write a query to retrieve information about SoftUni camp's transportation organization. Get information about the 
-- drivers (name and id) and their vehicle type.


SELECT
vehicles.driver_id ,
vehicle_type,
CONCAT(campers.first_name, ' ', campers.last_name) AS `driver_name`
FROM vehicles
    JOIN campers ON campers.id = vehicles.driver_id;