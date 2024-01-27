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
    
    -- 3. SoftUni Hiking
-- Get information about the hiking routes – starting point and ending point, and their leaders – name and id.

SELECT starting_point AS `route_starting_point`,
end_point AS `route_ending_point`,
leader_id,
CONCAT(first_name, ' ', last_name) AS `leader_name`
FROM routes
    JOIN campers ON routes.leader_id = campers.id; 
    
--     4. Delete Mountains
-- Drop tables from the task 1.
-- Write a query to create a one-to-many relationship between a table, holding information about 
-- mountains (id, name) and other - about peaks (id, name, mountain_id), so that when a mountain
-- gets removed from the database, all his peaks are deleted too.
    
DROP TABLE mountains;
DROP TABLE peaks;

CREATE TABLE mountains (
id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL );

INSERT INTO mountains(name) VALUES
('Rila'),
('Pirin')
;
SELECT*FROM mountains;

CREATE TABLE peaks (
id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
mountain_id INT ,
CONSTRAINT fk_mountain_id_maountains_id
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
ON DELETE CASCADE
  );
  
INSERT INTO peaks (name, mountain_id) VALUES 
('Musala',1);
SELECT*FROM peaks;

DELETE FROM peaks
WHERE id=1;

DELETE FROM mountains
WHERE id=1;