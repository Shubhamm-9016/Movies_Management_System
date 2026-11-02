CREATE DATABASE IF NOT EXISTS movie_ticket_db;
USE movie_ticket_db;

CREATE TABLE IF NOT EXISTS movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(120) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    duration INT NULL COMMENT 'Duration in minutes',
    language VARCHAR(40) NOT NULL DEFAULT 'English',
    status ENUM('Active','Inactive') NOT NULL DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO movies (title, genre, price, duration, language)
SELECT 'Avatar: The Way of Water', 'Sci-Fi', 250.00, 192, 'English'
WHERE NOT EXISTS (SELECT 1 FROM movies WHERE title='Avatar: The Way of Water');

INSERT INTO movies (title, genre, price, duration, language)
SELECT 'The Avengers', 'Action', 220.00, 143, 'English'
WHERE NOT EXISTS (SELECT 1 FROM movies WHERE title='The Avengers');

INSERT INTO movies (title, genre, price, duration, language)
SELECT '3 Idiots', 'Comedy/Drama', 180.00, 170, 'Hindi'
WHERE NOT EXISTS (SELECT 1 FROM movies WHERE title='3 Idiots');
