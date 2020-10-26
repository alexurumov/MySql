CREATE VIEW v_employees_job_titles AS
SELECT 
concat(first_name, ' ', COALESCE(middle_name, ''), ' ', last_name) AS 'full_name', job_title
FROM employees;

SELECT * FROM v_employees_job_titles;
