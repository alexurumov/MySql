DELIMITER $$

CREATE FUNCTION udf_calculate_followers(user_id INT)
RETURNS INT

BEGIN
	
    DECLARE followers_count INT;
    SET followers_count = (SELECT COUNT(*) FROM users_followers uf WHERE uf.user_id = user_id);
    RETURN followers_count;
    
END; $$ 

DELIMITER ;

UPDATE users u
SET u.profile_picture_id = 
	(
		CASE
			WHEN (udf_calculate_followers(id)) <> 0 THEN udf_calculate_followers(id)
            ELSE id
        END
    )
WHERE profile_picture_id IS NULL;