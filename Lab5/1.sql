CREATE TABLE `persons`(
	`person_id` INT PRIMARY KEY AUTO_INCREMENT, 
    `first_name` VARCHAR(20), 
    `salary` DECIMAL (12, 2), 
    `passport_id` INT UNIQUE NOT NULL
);

CREATE TABLE `passports`(
	`passport_id` INT PRIMARY KEY AUTO_INCREMENT, 
    `passport_number` VARCHAR(8) UNIQUE
) AUTO_INCREMENT = 101;

INSERT INTO `persons`(`first_name`, `salary`, `passport_id`)
VALUES
	('Roberto', 43300.00, 102), 
    ('Tom', 56100.00, 103), 
    ('Yana', 60200.00, 101);
    
INSERT INTO `passports`(`passport_number`)
VALUES 
	('N34FG21B'), 
    ('K65LO4R7'), 
    ('ZE657QP2');
    
ALTER TABLE `persons`
ADD CONSTRAINT fk_persons_passports
FOREIGN KEY (passport_id)
REFERENCES passports(passport_id);