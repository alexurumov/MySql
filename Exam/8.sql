SELECT
	CONCAT(e.first_name, ' ', e.last_name), 
    e.started_on, 
    COUNT(c.id) AS 'count_of_clients'
FROM employees e
RIGHT JOIN employees_clients ec
	ON e.id = ec.employee_id
LEFT JOIN clients c
	ON ec.client_id = c.id
GROUP BY e.id
ORDER BY count_of_clients DESC, e.id
LIMIT 5; 
