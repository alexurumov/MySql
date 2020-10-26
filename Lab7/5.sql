DELIMITER $$

CREATE FUNCTION ufn_get_salary_level(salary DOUBLE)
RETURNS VARCHAR(10)

BEGIN
		DECLARE salary_level VARCHAR(10);
        SET salary_level := (
				SELECT 
					CASE
						WHEN salary < 30000 THEN 'Low'
                        WHEN salary <= 50000 THEN 'Average'
                        ELSE 'High'
					END);
		RETURN salary_level;
END $$

SELECT 
	e.salary, 
	ufn_get_salary_level(e.salary) AS 'salary_level'
FROM employees e;