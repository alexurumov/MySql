DELIMITER $$

CREATE PROCEDURE usp_select_emoloyees_by_seniority()
BEGIN 
	SELECT *
    FROM employees
    WHERE ROUND((DATEDIFF(NOW(), hire_date) / 365.25)) < 15;
END $$

DROP PROCEDURE usp_select_emoloyees_by_seniority $$

CREATE PROCEDURE usp_select_emoloyees_by_seniority()
BEGIN 
	SELECT *
    FROM employees
    WHERE ROUND((DATEDIFF(NOW(), hire_date) / 365.25)) < 10;
END $$

DROP PROCEDURE usp_select_emoloyees_by_seniority $$

CREATE PROCEDURE usp_select_emoloyees_by_seniority(min_years_at_work INT)
BEGIN 
	SELECT first_name, last_name, hire_date, 
	ROUND(DATEDIFF(NOW(), DATE(hire_date)) / 365.25,0) AS 'years'
    FROM employees
    WHERE ROUND(DATEDIFF(NOW(), DATE(hire_date)) / 365.25,0) > min_years_at_work
    ORDER BY hire_date;
END $$


