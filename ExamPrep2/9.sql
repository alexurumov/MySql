SELECT 
	p.name, 
    COUNT(j.id) AS 'journeys_count'
FROM planets p
JOIN spaceports sp
	ON p.id = sp.planet_id
LEFT JOIN journeys j
	ON sp.id = j.destination_spaceport_id
GROUP BY p.name
HAVING journeys_count > 0
ORDER BY journeys_count DESC, p.name ASC;