SELECT av.`average_salary` AS 'min_average_salary'
FROM 
	(SELECT
		d.name, 
		AVG(e.salary) AS 'average_salary'
	FROM departments d
	JOIN employees e 
	ON d.department_id = e.department_id
	GROUP BY d.name
    ) av
ORDER BY av.`average_salary`
LIMIT 1;