SELECT `name`
FROM towns
WHERE length(`name`) BETWEEN 5 AND 6
ORDER BY `name` ASC;