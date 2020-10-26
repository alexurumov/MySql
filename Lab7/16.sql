CREATE TABLE logs(
	log_id INT PRIMARY KEY AUTO_INCREMENT, 
    account_id INT, 
    old_sum DECIMAL(19, 4), 
    new_sum DECIMAL(19, 4)
);

DELIMITER $$

CREATE TRIGGER tr_acount_sum_changes
AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO logs(account_id, old_sum, new_sum)
    VALUES (OLD.id, OLD.balance, NEW.balance);
END $$

CREATE TABLE notification_emails(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    recipient INT, 
    subject VARCHAR(50), 
    body TEXT
    ); 
    
CREATE TRIGGER tr_emails
AFTER UPDATE 
ON accounts
FOR EACH ROW
BEGIN
    INSERT INTO notification_emails(recipient, subject, body)
    VALUES (
        OLD.account_holder_id,
        concat('Balance change for account: ', OLD.id),
        concat('On ', current_date(), ' your balance was changed from ', OLD.balance, ' to ', NEW.balance)
    );
END
    
