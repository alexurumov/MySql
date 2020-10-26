SELECT
	pj.job_during_journey AS 'job_name'
FROM
	(SELECT 
		tc.job_during_journey, 
		COUNT(tc.job_during_journey) AS 'popularity'
	FROM journeys j
	RIGHT JOIN travel_cards tc
		ON j.id = tc.journey_id
	WHERE j.id = 
		(SELECT
			id
		FROM journeys
		ORDER BY timestampdiff(day, journey_start, journey_end) DESC
		LIMIT 1
		)
	GROUP BY job_during_journey
	ORDER BY popularity ASC
	LIMIT 1) pj;