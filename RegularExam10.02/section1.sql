

CREATE TABLE positions(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE,
description TEXT,
is_dangerous TINYINT(1) NOT NULL
);

CREATE TABLE continents(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE countries(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE,
country_code VARCHAR(10) NOT NULL UNIQUE,
continent_id INT NOT NULL,
FOREIGN KEY (continent_id)
REFERENCES continents(id)
);

CREATE TABLE preserves(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE,
latitude DECIMAL(9,6),
longitude DECIMAL(9,6),
area INT,
type VARCHAR(20),
established_on DATE
);

-- CREATE DATABASE regular_exam;
-- USE regular_exam;

CREATE TABLE countries_preserves(
country_id INT,
FOREIGN KEY (country_id)
REFERENCES countries (id),
preserve_id INT,
FOREIGN KEY (preserve_id)
REFERENCES preserves (id)
);

CREATE TABLE workers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
age INT,
personal_number VARCHAR(20) NOT NULL UNIQUE,
salary DECIMAL (19,2),
is_armed TINYINT(1) NOT NULL,
start_date DATE,
preserve_id INT,
FOREIGN KEY (preserve_id)
REFERENCES preserves (id),
position_id INT,
FOREIGN KEY (position_id)
REFERENCES positions (id)
);