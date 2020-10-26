UPDATE employees_clients
SET employee_id = 
	(SELECT 
			eclow.employee_id
		FROM 
			(SELECT 
				ec.employee_id, 
				COUNT(client_id) AS 'client_count'
			FROM employees_clients ec
			GROUP BY employee_id
			ORDER BY client_count ASC, employee_id
			LIMIT 1) eclow
	)
WHERE client_id = employee_id;