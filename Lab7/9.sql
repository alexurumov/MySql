DELIMITER $$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(min_balance DOUBLE)

BEGIN
		SELECT
			aht.first_name, 
            aht.last_name
		FROM (SELECT 
						ah.first_name, 
						ah.last_name, 
						SUM(a.balance) AS 'total_balance'
					FROM account_holders ah
					JOIN accounts a
						ON ah.id = a.account_holder_id
					GROUP BY ah.first_name, ah.last_name
                    ORDER BY a.id
					) aht
		WHERE aht.total_balance > min_balance;
END $$

DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);