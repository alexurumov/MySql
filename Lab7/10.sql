DELIMITER $$

CREATE FUNCTION ufn_calculate_future_value(initial_sum DOUBLE, yearly_interest_rate DOUBLE, n_years INT)
RETURNS DOUBLE

BEGIN

		DECLARE future_value DOUBLE;
        SET future_value := (SELECT POW((1 + yearly_interest_rate), n_years) * initial_sum);
		RETURN future_value;
END $$

DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.1, 5);
