INSERT INTO travel_cards(card_number, job_during_journey, colonist_id, journey_id)
SELECT 
		(
        SELECT
			CASE
				WHEN DATE (c.birth_date) > DATE ('1980-01-01') THEN CONCAT ( YEAR (c.birth_date), DAY (c.birth_date), LEFT (c.ucn, 4) )
				ELSE CONCAT ( YEAR (c.birth_date), MONTH (c.birth_date), RIGHT (c.ucn, 4) )
            END
		), 
        (
        SELECT
			CASE
				WHEN MOD(c.id, 2) = 0 THEN 'Pilot'
                WHEN MOD(c.id, 3) = 0 THEN 'Cook'
                ELSE 'Engineer'
            END
        ), 
        c.id, 
        (
        SELECT LEFT(c.ucn, 1)
        FROM colonists
        WHERE id = c.id
        )
		FROM colonists c
        WHERE c.id BETWEEN 96 AND 100; 