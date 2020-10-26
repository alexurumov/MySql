SELECT
	 c.id, 
    CONCAT(c.card_number, ' : ', cl.full_name)
FROM cards c
LEFT JOIN bank_accounts b
	ON c.bank_account_id = b.id
JOIN clients cl
	ON b.client_id = cl.id
ORDER BY c.id DESC;
    
   