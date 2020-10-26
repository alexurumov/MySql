SELECT
	e.employee_id, 
    e.first_name, 
    p.name AS 'project_name'
FROM employees e
LEFT JOIN employees_projects ep
ON e.employee_id = ep.employee_id
LEFT JOIN projects p
ON ep.project_id = p.project_id
WHERE date(p.start_date) > date('2002-08-13') AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5;
