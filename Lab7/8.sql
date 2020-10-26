DELIMITER $$

CREATE PROCEDURE usp_get_holders_full_name()

BEGIN

		SELECT
			CONCAT(a.first_name, ' ', a.last_name) AS 'full_name'
		FROM account_holders a
        ORDER BY full_name, a.id;

END $$

DELIMITER ;

CALL usp_get_holders_full_name();