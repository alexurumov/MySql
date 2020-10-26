DELIMITER $$

CREATE PROCEDURE udp_findbyextension(extension VARCHAR(50))

BEGIN

	SELECT
	id, 
    name, 
    CONCAT(size, 'KB') AS 'size'
FROM files
WHERE name LIKE CONCAT('%', extension)
ORDER BY id;

END $$

DELIMITER ;

CALL udp_findbyextension('.html');