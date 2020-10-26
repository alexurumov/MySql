SELECT
	ss.name, 
    ss.manufacturer
FROM spaceships ss
RIGHT JOIN journeys j
	ON ss.id = j.spaceship_id
RIGHT JOIN travel_cards tc
	ON j.id = tc.journey_id
LEFT JOIN colonists c
	ON tc.colonist_id = c.id
WHERE tc.job_during_journey = 'Pilot' AND TIMESTAMPDIFF (year, DATE(c.birth_date), date ('2019-01-01') ) < 30
ORDER BY ss.name ASC;
