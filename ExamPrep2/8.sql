SELECT 
	p.name, 
    sp.name
FROM planets p
JOIN spaceports sp
	ON p.id = sp.planet_id
LEFT JOIN journeys j
	ON sp.id = j.destination_spaceport_id
WHERE j.purpose = 'Educational'
ORDER BY sp.name DESC;