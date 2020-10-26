DELIMITER $$

CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
			START TRANSACTION;
            IF (	(SELECT 
					COUNT(employee_id) 
					FROM employees 
					WHERE employee_id LIKE id)
			<> 1)
            THEN 
					ROLLBACK;
			ELSE
					UPDATE employees e
                    SET e.salary = e.salary * 1.05
                    WHERE e.employee_id = id;
			END IF;
END $$

DELIMITER ;

CALL usp_raise_salary_by_id(1);

SELECT * 
FROM employees
WHERE employee_id = 1;