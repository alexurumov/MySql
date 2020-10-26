SELECT
	a.title, 
    COUNT(c.id) as 'comments'
FROM articles a
JOIN comments c
	ON a.id = c.article_id
WHERE a.category_id = 5
GROUP BY a.title
ORDER BY `comments` DESC
LIMIT 1;


