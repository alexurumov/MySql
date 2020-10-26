DELIMITER $$

CREATE PROCEDURE usp_get_towns_starting_with(town_string VARCHAR(20))

BEGIN
			SELECT name
			FROM towns
			WHERE name LIKE CONCAT(town_string, '%')
            ORDER BY name;
END $$

DELIMITER ;

CALL usp_get_towns_starting_with('b');
