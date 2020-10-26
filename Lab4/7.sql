SELECT w.deposit_group, 
	SUM(w.deposit_amount) AS 'total_sum'
FROM wizzard_deposits AS w
WHERE w.magic_wand_creator = 'Ollivander family'
GROUP BY w.deposit_group
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;