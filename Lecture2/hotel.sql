CREATE SCHEMA `hotel`;

CREATE TABLE `employees` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `first_name` VARCHAR(50) NOT NULL, 
    `last_name` VARCHAR(50) NOT NULL, 
    `title` VARCHAR(50), 
    `notes` TEXT
);

CREATE TABLE `customers` (
	`account_number` INT AUTO_INCREMENT PRIMARY KEY, 
    `first_name` VARCHAR(50) NOT NULL, 
    `last_name` VARCHAR(50) NOT NULL, 
    `phone_number` VARCHAR(50) NOT NULL, 
    `emergency_name` VARCHAR(50), 
    `emergency_number` VARCHAR(50), 
    `notes` TEXT
);

CREATE TABLE `room_status` (
    `room_status` VARCHAR(50) PRIMARY KEY NOT NULL, 
    `notes` TEXT
);

CREATE TABLE `room_types` (
    `room_type` VARCHAR(50) PRIMARY KEY NOT NULL, 
    `notes` TEXT
);

CREATE TABLE `bed_types` (
    `bed_type` VARCHAR(50) PRIMARY KEY NOT NULL, 
    `notes` TEXT
);

CREATE TABLE `rooms` (
	`room_number` INT AUTO_INCREMENT PRIMARY KEY, 
    `room_type` VARCHAR(50) NOT NULL, 
    `bed_type` VARCHAR(50) NOT NULL, 
    `rate` DOUBLE (2, 1), 
    `room_status` VARCHAR(50) NOT NULL, 
    `notes` TEXT
);

CREATE TABLE `payments` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `emplpyee_id` INT NOT NULL DEFAULT '0', 
    `payment_date` DATE NOT NULL, 
    `account_number` INT NOT NULL, 
    `first_date_occupied` DATE, 
    `last_date_occupied` DATE, 
    `total_days` INT NOT NULL, 
    `amount_charged` DOUBLE (8, 2), 
    `tax_rate` DOUBLE (4, 2), 
    `payment_total` DOUBLE (8, 2) NOT NULL, 
    `notes` TEXT
);

CREATE TABLE `occupancies` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `emplpyee_id` INT NOT NULL DEFAULT '0', 
    `date_occupied` DATE NOT NULL, 
    `account_number` INT, 
    `room_number` INT NOT NULL, 
    `rate_applied` DOUBLE(2, 1), 
    `phone_charge` DOUBLE (8, 2), 
    `notes` TEXT
);

INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Sasho', 'Sashov');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Gosho', 'Sashov');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Pesho', 'Sashov');

INSERT INTO `customers` (`first_name`, `last_name`, `phone_number`) VALUES ('Sasho', 'Sashov', '0876543210');
INSERT INTO `customers` (`first_name`, `last_name`, `phone_number`) VALUES ('Gosho', 'Sashov', '0876543211');
INSERT INTO `customers` (`first_name`, `last_name`, `phone_number`) VALUES ('Pesho', 'Sashov', '0876543212');

INSERT INTO `room_status` (`room_status`) VALUES ('Occupied');
INSERT INTO `room_status` (`room_status`) VALUES ('For Cleaning');
INSERT INTO `room_status` (`room_status`) VALUES ('Free');

INSERT INTO `room_types` (`room_type`) VALUES ('Luxury');
INSERT INTO `room_types` (`room_type`) VALUES ('Budget');
INSERT INTO `room_types` (`room_type`) VALUES ('Normal');

INSERT INTO `bed_types` (`bed_type`) VALUES ('Single');
INSERT INTO `bed_types` (`bed_type`) VALUES ('Medium');
INSERT INTO `bed_types` (`bed_type`) VALUES ('Double');

INSERT INTO `rooms` (`room_type`, `bed_type`, `room_status`) VALUES ('Luxury', 'Double', 'Occupied');
INSERT INTO `rooms` (`room_type`, `bed_type`, `room_status`) VALUES ('Budget', 'Single', 'For Cleaning');
INSERT INTO `rooms` (`room_type`, `bed_type`, `room_status`) VALUES ('Normal', 'Medium', 'Free');

INSERT INTO `payments` (`payment_date`, `account_number`, `total_days`, `payment_total`) VALUES ('2018-01-01', '3', '5', '640.23');
INSERT INTO `payments` (`payment_date`, `account_number`, `total_days`, `payment_total`) VALUES ('2019-02-05', '1', '1', '120.50');
INSERT INTO `payments` (`payment_date`, `account_number`, `total_days`, `payment_total`) VALUES ('2019-05-10', '2', '7', '1000.00');

INSERT INTO `occupancies` (`date_occupied`, `room_number`) VALUES ('2019-02-15', '3');
INSERT INTO `occupancies` (`date_occupied`, `room_number`) VALUES ('2019-03-20', '2');
INSERT INTO `occupancies` (`date_occupied`, `room_number`) VALUES ('2019-05-28', '1');