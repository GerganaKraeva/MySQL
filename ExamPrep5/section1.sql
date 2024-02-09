

CREATE TABLE movies_additional_info (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
rating DECIMAL(10,2) NOT NULL,
runtime INT NOT NULL,
picture_url VARCHAR(80) NOT NULL,
budget DECIMAL(10,2),
release_date DATE NOT NULL,
has_subtitles TINYINT(1),
description TEXT
);

CREATE TABLE countries(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
continent VARCHAR(30) NOT NULL,
currency VARCHAR(5) NOT NULL
);

CREATE TABLE movies(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(70) NOT NULL UNIQUE,
country_id INT NOT NULL,
FOREIGN KEY (country_id)
REFERENCES countries(id),
movie_info_id INT NOT NULL UNIQUE,
FOREIGN KEY (movie_info_id)
REFERENCES movies_additional_info (id)
);

CREATE TABLE genres(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE genres_movies (
genre_id INT,
FOREIGN KEY (genre_id)
REFERENCES genres (id),
movie_id INT,
FOREIGN KEY (movie_id)
REFERENCES movies (id)
);

CREATE TABLE actors(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birthdate DATE NOT NULL,
height INT,
awards INT,
country_id INT NOT NULL,
FOREIGN KEY (country_id)
REFERENCES countries(id)
);

CREATE TABLE movies_actors (
movie_id INT,
FOREIGN KEY (movie_id)
REFERENCES movies (id),
actor_id INT,
FOREIGN KEY (actor_id)
REFERENCES actors (id)
);



-- CREATE DATABASE exam5;
-- USE exam5;

-- DROP DATABASE exam5;