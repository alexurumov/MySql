DELIMITER $$

CREATE FUNCTION ufn_calculate_future_value(initial_sum DECIMAL(19, 4), yearly_interest_rate DECIMAL(19, 4), n_years INT)
RETURNS DECIMAL(19, 4)

BEGIN

		DECLARE future_value DECIMAL(19, 4);
        SET future_value := (SELECT POW((1 + yearly_interest_rate), n_years) * initial_sum);
		RETURN future_value;
END; $$

DELIMITER $$

CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT, interest_rate DECIMAL(19,4))

BEGIN
	SELECT
		fnl.account_id, 
        fnl.first_name, 
        fnl.last_name, 
        fnl.current_balance, 
        round(ufn_calculate_future_value(fnl.current_balance, interest_rate, 5), 4) AS 'balance_in_5_years'
	FROM
		(SELECT
			a.id AS 'account_id', 
			ah.first_name, 
			ah.last_name, 
			a.balance AS 'current_balance'
		FROM accounts a
		JOIN account_holders ah
			ON a.account_holder_id = ah.id
		) fnl
	WHERE fnl.account_id = account_id;
END $$

DELIMITER ;

CALL usp_calculate_future_value_for_account(1, 0.1);
