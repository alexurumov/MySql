SELECT
	n.employee_id, 
    n.first_name
FROM
(SELECT 
	e.employee_id, 
	e.first_name, 
	ep.employee_id AS 'empl_id_2'
FROM employees AS e
LEFT JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id) AS n
WHERE n.empl_id_2 IS NULL
ORDER BY n.employee_id DESC
LIMIT 3;

