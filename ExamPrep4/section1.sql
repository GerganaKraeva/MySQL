

CREATE TABLE waiters (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(50),
salary DECIMAL(10,2)
);


CREATE TABLE tables (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
floor INT NOT NULL,
reserved TINYINT(1),
capacity INT NOT NULL
);



CREATE TABLE orders (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
table_id INT NOT NULL,
FOREIGN KEY (table_id)
REFERENCES tables (id),
waiter_id INT NOT NULL,
FOREIGN KEY (waiter_id)
REFERENCES waiters (id),
order_time TIME NOT NULL,
payed_status TINYINT(1)
);


CREATE TABLE products (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
`name` VARCHAR(30) NOT NULL UNIQUE,
`type` VARCHAR(30) NOT NULL,
price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders_products (
order_id INT,
FOREIGN KEY (order_id)
REFERENCES orders(id),
product_id INT,
FOREIGN KEY (product_id)
REFERENCES products (id)
);

CREATE TABLE clients (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birthdate DATE NOT NULL,
card VARCHAR(50),
review TEXT
);

CREATE TABLE orders_clients (
order_id INT,
FOREIGN KEY (order_id)
REFERENCES orders(id),
client_id INT,
FOREIGN KEY (client_id)
REFERENCES clients (id)
);

-- DROP DATABASE exam4;
-- CREATE DATABASE exam4;
-- USE exam4;

