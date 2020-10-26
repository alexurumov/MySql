DELIMITER $$

CREATE PROCEDURE udp_like_article(username VARCHAR(30), title VARCHAR(30)) 

BEGIN

		START TRANSACTION;
        
        IF 
			(SELECT
				COUNT(id) AS 'count'
			FROM users AS u
			WHERE u.`username` = username
			) = 0
            
		THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Non-existent user.';
			ROLLBACK;
        
		ELSE IF
	
			(SELECT
				COUNT(id) AS 'count'
			FROM articles AS a
			WHERE a.`title` = title
			) = 0
            
		THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Non-existent article.';
			ROLLBACK;
		
        ELSE
        
			INSERT INTO likes(article_id, user_id)
            SELECT
				(SELECT
					a.id
				FROM articles AS a
                WHERE a.`title` = title)
                ,
				(SELECT
					u.id
				FROM users AS u
                WHERE u.`username` = username);
			
			COMMIT;
        
        END IF;
        END IF;
END $$

DELIMITER ;


