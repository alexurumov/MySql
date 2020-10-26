SELECT 
	e1.first_name, 
    e1.last_name, 
    e1.department_id
FROM employees AS e1
WHERE e1.salary > (
	SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e1.department_id = e2.department_id)
ORDER BY e1.department_id
LIMIT 10;