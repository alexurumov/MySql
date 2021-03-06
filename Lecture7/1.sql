DELIMITER $$

CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS DOUBLE
BEGIN
	DECLARE e_count DOUBLE;
		SET e_count := (SELECT COUNT(employee_id) FROM employees AS e 
        INNER JOIN addresses AS a 
        ON a.address_id = e.address_id
        INNER JOIN towns AS t 
        ON t.town_id = a.town_id
		WHERE t.name = town_name);
    RETURN e_count;
END
