USE movie_ticket_db;

DROP PROCEDURE IF EXISTS sp_add_movie;
DROP PROCEDURE IF EXISTS sp_update_movie;
DROP PROCEDURE IF EXISTS sp_delete_movie;
DROP PROCEDURE IF EXISTS sp_toggle_movie_status;

DELIMITER //

CREATE PROCEDURE sp_add_movie(
    IN p_title VARCHAR(120),
    IN p_genre VARCHAR(60),
    IN p_price DECIMAL(8,2),
    IN p_duration INT,
    IN p_language VARCHAR(40)
)
BEGIN
    INSERT INTO movies(title, genre, price, duration, language)
    VALUES(p_title, p_genre, p_price, p_duration, p_language);
END //

CREATE PROCEDURE sp_update_movie(
    IN p_movie_id INT,
    IN p_title VARCHAR(120),
    IN p_genre VARCHAR(60),
    IN p_price DECIMAL(8,2),
    IN p_duration INT,
    IN p_language VARCHAR(40)
)
BEGIN
    UPDATE movies
    SET title=p_title, genre=p_genre, price=p_price,
        duration=p_duration, language=p_language
    WHERE movie_id=p_movie_id;
END //

CREATE PROCEDURE sp_delete_movie(IN p_movie_id INT)
BEGIN
    DELETE FROM movies WHERE movie_id=p_movie_id;
END //

CREATE PROCEDURE sp_toggle_movie_status(IN p_movie_id INT)
BEGIN
    UPDATE movies
    SET status = IF(status='Active', 'Inactive', 'Active')
    WHERE movie_id=p_movie_id;
END //

DELIMITER ;
