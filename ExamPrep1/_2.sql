INSERT INTO comments(content, user_id, post_id)
  SELECT
  	CONCAT('Omg!', (
    	SELECT u.username
        FROM users u
        WHERE u.id = p.user_id
    ), '!This is so cool!') AS 'content', 
	CEIL(p.id * 3 / 2), 
	p.id
  FROM posts p
  WHERE p.id BETWEEN 1 AND 10; 