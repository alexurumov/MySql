SELECT 
	e.first_name, 
    e.last_name, 
    n.`name` AS 'town', 
    n.address_text
FROM employees AS e
JOIN 
	(SELECT
		a.address_id, 
		a.address_text, 
		a.town_id, 
		t.name
	FROM addresses AS a
    JOIN towns AS t
    ON a.town_id = t.town_id) AS n
ON e.address_id = n.address_id
ORDER BY e.first_name, e.last_name
LIMIT 5;