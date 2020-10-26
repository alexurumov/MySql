DELIMITER $$

CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19, 4))

BEGIN

	START TRANSACTION;
		IF money_amount <= 0 
        OR (SELECT COUNT(id)
				FROM accounts
                WHERE id = account_id) < 1
		THEN
		ROLLBACK;
		ELSE
			UPDATE accounts a
            SET a.balance = a.balance + money_amount
            WHERE a.id = account_id;
		END IF;
        COMMIT;
END $$

DELIMITER ;

CALL usp_deposit_money(1, 10);

SELECT *
FROM accounts
WHERE id =1;