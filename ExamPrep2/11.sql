DELIMITER $$

CREATE FUNCTION udf_count_colonists_by_destination_planet (planet_name VARCHAR (30)) 
RETURNS INT

BEGIN

		DECLARE colonists_count INT;
        SET colonists_count = 
			(SELECT 
				COUNT(c.id)
			FROM colonists c
            RIGHT JOIN travel_cards tc
				ON c.id = tc.colonist_id
			LEFT JOIN journeys j
				ON tc.journey_id = j.id
			LEFT JOIN spaceports sp
				ON j.destination_spaceport_id = sp.id
			LEFT JOIN planets p
				ON sp.planet_id = p.id
			WHERE p.name = planet_name);
                
		RETURN colonists_count;

END $$