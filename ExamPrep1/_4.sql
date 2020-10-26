DELIMITER $$

CREATE FUNCTION udf_calculate_followers(user_id INT)
RETURNS INT

BEGIN
	
    DECLARE followers_count INT;
    SET followers_count = (SELECT COUNT(*) FROM users_followers uf WHERE uf.user_id = user_id);
    RETURN followers_count;
    
END; $$ 

CREATE FUNCTION udf_calculate_following(user_id INT)
RETURNS INT

BEGIN
	
    DECLARE following_count INT;
    SET following_count = (SELECT COUNT(*) FROM users_followers uf WHERE uf.follower_id = user_id);
    RETURN following_count;
    
END; $$ 

DELETE
FROM users
WHERE udf_calculate_followers(id) = 0 AND udf_calculate_following(id) = 0;