SELECT
	e.employee_id, 
    CONCAT(e.first_name, ' ', e.last_name) AS 'employee_name', 
	m.`manager_name`, 
    d.name AS 'department_name'
FROM employees e
JOIN
	(SELECT employee_id, 
    CONCAT(first_name, ' ', last_name) AS 'manager_name'
    FROM employees) AS m
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;


