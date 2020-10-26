DELIMITER $$

CREATE FUNCTION udf_client_cards_count(name VARCHAR(30)) 
RETURNS INT

BEGIN

	DECLARE cards_count INT;
    SET cards_count := 
		(SELECT
			COUNT(c.id) AS 'cards'
		FROM
			cards c
		RIGHT JOIN bank_accounts ba
			ON c.bank_account_id = ba.id
		LEFT JOIN clients cl
			ON ba.client_id = cl.id
		GROUP BY cl.full_name
        HAVING cl.full_name = name);
	RETURN cards_count;

END $$
        
        

