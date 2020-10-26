SELECT w.deposit_group, 
	SUM(w.deposit_amount) AS 'total_sum'
FROM wizzard_deposits AS w
WHERE w.magic_wand_creator = 'Ollivander family'
GROUP BY w.deposit_group
ORDER BY w.deposit_group;