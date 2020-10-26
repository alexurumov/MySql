SELECT
	b.id AS 'article_id', 
    b.title
FROM
	(SELECT
		*
	FROM articles a
	JOIN users_articles ua
		ON ua.article_id = a.id
	) AS b
WHERE
	b.id = b.user_id
ORDER BY b.id;