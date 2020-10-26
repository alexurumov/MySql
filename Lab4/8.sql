SELECT 
	w.deposit_group, 
	w.magic_wand_creator, 
    MIN(w.deposit_charge) AS 'min_deposit_charge'
FROM wizzard_deposits AS w
GROUP BY w.deposit_group, w.magic_wand_creator
ORDER BY w.magic_wand_creator, w.deposit_group;