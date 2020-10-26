DELIMITER $$

CREATE PROCEDURE udp_clientinfo(full_name VARCHAR(50))

BEGIN

	SELECT 
		c.full_name, 
		c.age, 
		ba.account_number, 
		CONCAT('$', ba.balance) AS 'balance'
	FROM 
		clients c
	RIGHT JOIN bank_accounts ba
		ON c.id = ba.client_id
	HAVING c.full_name = full_name;

END $$