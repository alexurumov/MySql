SELECT 
	c.country_code, 
    m.mountain_range, 
    p.peak_name, 
    p.elevation
FROM peaks p
JOIN mountains m
ON p.mountain_id = m.id
JOIN mountains_countries mc
ON m.id = mc.mountain_id
JOIN countries c
ON mc.country_code = c.country_code
WHERE c.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;