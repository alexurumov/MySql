SELECT
	e.employee_id, 
    e.first_name, 
    e.manager_id, 
    m.first_name
FROM employees e
JOIN 
	(SELECT employee_id, first_name
    FROM employees) m
ON e.manager_id = m.employee_id
WHERE m.employee_id IN (3, 7)
ORDER BY e.first_name;