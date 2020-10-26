INSERT INTO cards(card_number, card_status, bank_account_id)
SELECT 
	REVERSE(c.full_name) AS 'full_name', 
    'Active', 
    c.id
FROM clients c
WHERE c.id BETWEEN 191 AND 200;