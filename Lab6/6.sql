SELECT 
	e.first_name, 
    e.last_name, 
    e.hire_date, 
    d.name AS 'dept_name'
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
WHERE date(e.hire_date) > date('1999-01-01 00:00:00') AND d.name in ('Sales', 'Finance')
ORDER BY hire_date;