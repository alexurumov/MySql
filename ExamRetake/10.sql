DELIMITER $$

CREATE FUNCTION udf_users_articles_count(username VARCHAR(30)) 
RETURNS INT

BEGIN

	DECLARE articles_count INT;
    SET articles_count:= 
		(SELECT
			COUNT(a.id) AS 'count'
		FROM users_articles ua
		LEFT JOIN articles a
			ON ua.article_id = a.id
		LEFT JOIN users u
			ON ua.user_id = u.id
		WHERE u.username = username);
	RETURN articles_count;

END $$
    