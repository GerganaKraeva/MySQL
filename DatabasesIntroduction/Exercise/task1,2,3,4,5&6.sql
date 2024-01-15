-- 1. Create Tables

CREATE TABLE minions(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(80),
age INT
);

CREATE TABLE towns(
town_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(80)
);

-- 2. Alter Minions Table

ALTER TABLE minions
ADD COLUMN town_id INT ;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

-- 3. Insert Records in Both Tables

INSERT INTO towns (id, name) 
VALUES 
(1,"Sofia"),
(2,"Plovdiv"),
(3,"Varna");

INSERT INTO minions ( id, name, age, town_id)
VALUES 
(1,"Kevin", 22,1),
(2,"Bob", 15,3),
(3,"Steward", NULL,2);

-- 4. Truncate Table Minions

TRUNCATE TABLE minions;

-- 5. Drop All Tables 
DROP TABLE minions;
DROP TABLE towns;

-- 6. Create Table People

CREATE TABLE people(
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height DOUBLE(6,2),
    weight DOUBLE(6,2),
    gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography BLOB
);

INSERT INTO people( name, picture, height, weight, gender, birthdate, biography) VALUES 
('Ivan', 'test', 1.89, 95.5,'m','1975-06-10','test'),
('Maria', 'test', 1.89, 95.5,'f','1975-06-10','test'),
('Gery', 'test', 1.89, 95.5,'f','1975-06-10','test'),
('Ivana', 'test', 1.89, 95.5,'f','1975-06-10','test'),
('Peter', 'test', 1.89, 95.5,'m','1975-06-10','test');