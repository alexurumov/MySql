SELECT
	b.title, 
    CONCAT(LEFT(b.content, 20), "...") AS 'summary'
FROM
	(SELECT
		a.id, 
		a.title, 
		a.content
	FROM 
			(SELECT
				*
			FROM
				articles
			ORDER BY
				length(content) DESC
			LIMIT 3) AS a
			ORDER BY a.id
    ) AS b;

