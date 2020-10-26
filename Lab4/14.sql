CREATE VIEW `v_empl_avg_salaries` AS
SELECT * FROM employees
WHERE salary > 30000;

DELETE FROM v_empl_avg_salaries
WHERE manager_id = 42;

UPDATE v_empl_avg_salaries
SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id, 
	AVG(`salary`) AS 'avg_salary'
FROM v_empl_avg_salaries
GROUP BY department_id
ORDER BY department_id;
