SELECT
	a.country_code, 
    COUNT(a.mountain_range) AS 'mountain_range'
FROM 
	(SELECT
		c.country_code, 
		m.mountain_range
	FROM countries c
	JOIN mountains_countries mc
	ON c.country_code = mc.country_code
	JOIN mountains m
	ON mc.mountain_id = m.id) a
    GROUP BY a.country_code
    HAVING a.country_code IN ('US', 'RU', 'BG')
    ORDER BY `mountain_range` DESC;