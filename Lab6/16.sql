SELECT 
	COUNT(a.country_code) as 'country_count'
    FROM (SELECT 
					c.country_code, 
                    m.id
				FROM countries c
				LEFT JOIN mountains_countries mc
				ON c.country_code = mc.country_code
				LEFT JOIN mountains m
				ON mc.mountain_id = m.id) as a
WHERE a.id IS NULL;