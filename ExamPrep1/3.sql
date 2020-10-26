UPDATE repositories_contributors rc
SET rc.repository_id = 

(SELECT rep.id
FROM repositories rep
WHERE rep.id NOT IN (SELECT repository_id FROM (SELECT repository_id FROM repositories_contributors) AS a ) ORDER BY rep.id LIMIT 1)
WHERE rc.repository_id = rc.contributor_id;