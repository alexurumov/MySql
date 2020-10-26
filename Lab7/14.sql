DELIMITER $$
CREATE PROCEDURE  usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL (19, 4))

BEGIN

	START TRANSACTION;
		IF 
			(SELECT COUNT(id)
            FROM accounts
            WHERE id = from_account_id) = 0
		OR
			(SELECT COUNT(id)
            FROM accounts
            WHERE id = to_account_id) = 0
		OR 
			from_account_id = to_account_id
		OR
			amount < 0
		OR
			(SELECT balance FROM accounts WHERE id = from_account_id) < amount
		THEN
			ROLLBACK;
		ELSE
			UPDATE accounts a
            SET a.balance = a.balance - amount
            WHERE a.id = from_account_id;
            UPDATE accounts a
            SET a.balance = a.balance + amount
            WHERE a.id = to_account_id;
		END IF;
END $$

DELIMITER ;

CALL usp_transfer_money(1, 2, 10);

SELECT * FROM accounts WHERE id IN (1, 2);

 