SELECT 
	ss.name AS 'spaceship_name', 
    sp.name AS 'spaceport_name'
FROM spaceships ss
JOIN journeys j
ON ss.id = j.spaceship_id
JOIN spaceports sp
ON j.destination_spaceport_id = sp.id
ORDER BY ss.light_speed_rate DESC
LIMIT 1;