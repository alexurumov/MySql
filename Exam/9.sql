SELECT 
	b.name, 
    COUNT(c.id) AS 'count_of_cards'
FROM branches b
LEFT JOIN employees e
	ON b.id = e.branch_id
LEFT JOIN employees_clients ec
	ON e.id = ec.employee_id
LEFT JOIN clients cl
	ON ec.client_id = cl.id
LEFT JOIN bank_accounts ba
	ON cl.id = ba.client_id
LEFT JOIN cards c
	ON ba.id = c.bank_account_id
GROUP BY b.name
ORDER BY count_of_cards DESC, b.name;