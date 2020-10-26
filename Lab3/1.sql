SELECT e.first_name, e.last_name
FROM employees AS e
WHERE first_name LIKE 'sa%'
ORDER BY e.employee_id;