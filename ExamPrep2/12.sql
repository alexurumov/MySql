DELIMITER $$

CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), 
																											light_speed_rate_increse INT(11)) 

BEGIN

		START TRANSACTION;
        
        IF (SELECT COUNT(ss.id) FROM spaceships ss WHERE ss.name = spaceship_name) = 0
    
		THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
			ROLLBACK;
		
        ELSE
        
			UPDATE spaceships
			SET light_speed_rate = light_speed_rate + light_speed_rate_increse
			WHERE name = spaceship_name;
			COMMIT;
        
        END IF;
END $$

DELIMITER ;

CALL udp_modify_spaceship_light_speed_rate('USS Templar', 9);