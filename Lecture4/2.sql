SELECT e.department_id, 
	ROUND(AVG(e.salary), 2) AS 'Average Salary'
FROM employees AS e
GROUP BY e.department_id;
