SELECT e.department_id, 
	ROUND(MIN(e.salary), 2) AS 'Min Salary'
FROM employees AS e
GROUP BY e.department_id
HAVING `Min Salary` > 800;
