SELECT
	e.employee_id, 
    e.first_name, 
    CASE
		WHEN date(p.start_date) >= date('2005-01-01') THEN NULL
        ELSE p.name
    END AS 'project_name'
FROM employees e
JOIN employees_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY `project_name`;
