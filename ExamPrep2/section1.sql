
CREATE TABLE cities (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name  VARCHAR(60) NOT NULL UNIQUE);
    
    
CREATE TABLE buyers (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name  VARCHAR(40) NOT NULL,
	last_name  VARCHAR(40) NOT NULL,
    phone  VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    city_id INT,
    FOREIGN KEY (city_id)
    REFERENCES cities (id)
    );
    
    CREATE TABLE agents (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name  VARCHAR(40) NOT NULL,
	last_name  VARCHAR(40) NOT NULL,
    phone  VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50)  NOT NULL UNIQUE,
    city_id INT,
    FOREIGN KEY (city_id)
    REFERENCES cities (id)
    );
    
    CREATE TABLE property_types(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `type` VARCHAR(40) NOT NULL UNIQUE,
    `description` TEXT
     );
     
     CREATE TABLE properties(
	 id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	 address VARCHAR(80) NOT NULL UNIQUE,
     price DECIMAL(19,2) NOT NULL,
	 area DECIMAL(19,2),
     property_type_id INT,
     FOREIGN KEY (property_type_id)
     REFERENCES property_types (id),
	city_id INT,
    FOREIGN KEY (city_id)
    REFERENCES cities (id)
     );
    
    CREATE TABLE property_transactions (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    property_id INT NOT NULL,
	FOREIGN KEY (property_id)
    REFERENCES properties (id),
    buyer_id INT NOT NULL,
    FOREIGN KEY (buyer_id)
    REFERENCES buyers (id),
    transaction_date DATE,
    bank_name VARCHAR(30),
    iban VARCHAR(40) UNIQUE,
    is_successful TINYINT(1)
    );
    
    CREATE TABLE property_offers(
	property_id INT NOT NULL,
	FOREIGN KEY (property_id)
    REFERENCES properties(id),
    agent_id INT NOT NULL,
    FOREIGN KEY (agent_id)
    REFERENCES agents(id),
    price DECIMAL(19,2) NOT NULL,
    offer_datetime DATETIME
    );
    
   
