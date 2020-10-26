CREATE VIEW `v_groups_avg_wand_size` AS 
SELECT w.deposit_group, 
AVG(w.magic_wand_size) AS 'Average Wand Size'
FROM wizzard_deposits AS w
GROUP BY w.deposit_group
ORDER BY `Average Wand Size`;

SELECT deposit_group 
FROM `v_groups_avg_wand_size`
LIMIT 1;