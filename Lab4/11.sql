SELECT w.deposit_group, 
    w.is_deposit_expired, 
    avg(w.deposit_interest) AS 'average_interest'
FROM wizzard_deposits AS w
WHERE w.deposit_start_date > '1985-01-01'
GROUP BY `is_deposit_expired`, `deposit_group`
ORDER BY `deposit_group` DESC, `is_deposit_expired`;