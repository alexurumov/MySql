DELIMITER $$

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))

BEGIN
			SELECT 
				el.first_name,
                el.last_name
			FROM 
				(SELECT 
					e.first_name, 
                    e.last_name, 
					CASE
						WHEN e.salary < 30000 THEN 'Low'
                        WHEN e.salary <= 50000 THEN 'Average'
                        ELSE 'High'
					END AS 'salary_level'
				FROM employees e) el
            WHERE el.salary_level LIKE salary_level
            ORDER BY el.first_name DESC, el.last_name DESC;
END $$

DELIMITER ;

CALL usp_get_employees_by_salary_level('High');