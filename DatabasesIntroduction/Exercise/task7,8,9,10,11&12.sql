-- 7. Create Table Users

CREATE TABLE users(
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time DATETIME,
    is_deleted BOOL
);


INSERT INTO users(name, password, profile_picture, last_login_time, is_deleted) VALUES 
('Maria','gdsgdsg7','test', NOW(),false),
('Ana','gdsgdsg7','test', NOW(),true),
('Ema','gdsgdsg7','test',  NOW(),true),
('Sonia','gdsgdsg7','test',  NOW(),false),
('Eva','gdsgdsg7','test',  NOW(),false);

-- 8. Change Primary Key

ALTER TABLE users
 DROP PRIMARY KEY,
ADD PRIMARY KEY (id, username) ;

-- 9. Set Default Value of a Field

ALTER TABLE users
CHANGE last_login_time last_login_time DATETIME DEFAULT NOW();

-- 10. Set Unique Field

ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id),
ADD UNIQUE(username);

-- 11. Movies Database

CREATE TABLE directors (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
director_name VARCHAR(50) NOT NULL,
notes TEXT
);

INSERT INTO directors(director_name, notes) VALUES
('Ivan','test'),
('Gery','test'),
('Ani','test'),
('Eli','test'),
('Moni','test');

CREATE TABLE genres(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
genre_name VARCHAR(50) NOT NULL,
notes TEXT
);
INSERT INTO genres(genre_name, notes) VALUES
('comedy','test'),
('adventure','test'),
('action','test'),
('crime','test'),
('fantasy','test');

CREATE TABLE categories(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
notes TEXT
);
INSERT INTO categories(category_name, notes) VALUES
('comedy','test'),
('drama','test'),
('horror','test'),
('western','test'),
('action','test');


CREATE TABLE movies(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
director_id INT,
copyright_year YEAR,
length TIME,
genre_id INT,
category_id INT,
rating DOUBLE(6,2),
notes TEXT
);


INSERT INTO movies(title, director_id, copyright_year, length, genre_id,category_id, rating, notes) VALUES
('Example',1,2002, '02:20:28',3,4,5.6,'test'),
('Example',1,2002, '02:20:28',3,4,5.6,'test'),
('Example',1,2002, '02:20:28',3,4,5.6,'test'),
('Example',1,2002, '02:20:28',3,4,5.6,'test'),
('Example',1,2002, '02:20:28',3,4,5.6,'test');

-- 12. Car Rental Database

CREATE TABLE categories(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(50) NOT NULL,
daily_rate DOUBLE(6,2),
weekly_rate DOUBLE(6,2),
monthly_rate DOUBLE(6,2),
weekend_rate DOUBLE(6,2)
);

INSERT INTO categories(category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES
('TEST1',5.1,6.3,4.0,7.5),
('TEST2',5.1,6.3,4.0,7.5),
('TEST3',5.1,6.3,4.0,7.5);

CREATE TABLE cars(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
plate_number VARCHAR(50) NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
car_year YEAR,
category_id INT,
doors INT,
picture BLOB,
car_condition TEXT,
available BOOL
);

INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, picture, car_condition, available) VALUES
('CA5580CB','Germany','AUDI',2020,1,5,'TEST','new',false),
('CA6080CB','Germany','BMW',2016,1,5,'TEST','used',false),
('CA5530CB','France','Peugeot',2021,1,5,'TEST','new',false);

CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
title VARCHAR(250) NOT NULL,
notes TEXT
);

INSERT INTO employees (first_name, last_name, title,notes) VALUES
('Gergana','Kraeva','test','TEST'),
('Ivo','KIvanov','test','TEST'),
('Pesho','Peshev','test','TEST');

CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
driver_licence_number INT UNIQUE NOT NULL,
full_name VARCHAR(250) NOT NULL,
address VARCHAR(250) NOT NULL,
city VARCHAR(80),
zip_code INT,
notes TEXT
);

INSERT INTO customers (driver_licence_number, full_name, address, city, zip_code, notes) VALUES
(156283,'Gergana Kraeva','Iztok','Sofia',1000,'test'),
(196283,'Petya Ilieva','Iztok','Sofia',1000,'test'),
(176283,'Draga Petkova','Iztok','Sofia',1000,'test');

CREATE TABLE rental_orders(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
employee_id INT,
customer_id INT,
car_id INT,
car_condition VARCHAR(90),
tank_level INT NOT NULL,
kilometrage_start INT,
kilometrage_end INT,
total_kilometrage INT,
start_date DATE,
end_date DATE,
total_days INT NOT NULL,
rate_applied DOUBLE(6,2),
tax_rate DOUBLE(6,2),
order_status BOOL,
notes TEXT
);

INSERT INTO rental_orders (employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage,start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes) VALUES
(1,1,1,'new',125,10000,12000,15000,"2024-12-05","2024-12-10",5,5.20,4.00,false,'test'),
(1,1,1,'new',125,10000,12000,15000,"2024-12-05","2024-12-10",5,5.20,4.00,false,'test'),
(1,1,1,'new',125,10000,12000,15000,"2024-12-05","2024-12-10",5,5.20,4.00,false,'test');