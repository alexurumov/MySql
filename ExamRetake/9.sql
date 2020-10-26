SELECT
	CONCAT(LEFT(c.comment, 20), "...") AS 'summary'
FROM 
	comments c
WHERE id NOT IN (
	SELECT
		c.id
	FROM comments c
	JOIN likes l
		ON c.id = l.comment_id
        )
	ORDER BY c.id DESC;
        