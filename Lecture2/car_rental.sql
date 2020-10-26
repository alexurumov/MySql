CREATE SCHEMA `car_rental`;

CREATE TABLE `categories`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `category` VARCHAR(50) NOT NULL, 
    `daily_rate` DOUBLE(2, 1) NOT NULL, 
    `weekly_rate` DOUBLE(2, 1), 
    `monthly_rate` DOUBLE(2, 1), 
    `weekend_rate` DOUBLE(2, 1)
);

CREATE TABLE `cars`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `plate_number` VARCHAR(50) NOT NULL, 
    `make` VARCHAR(50), 
    `model` VARCHAR(50), 
    `car_year` YEAR, 
    `category_id` INT NOT NULL, 
    `doors` INT, 
    `picture` BLOB, 
    `car_condition`VARCHAR(50),
    `available` VARCHAR(50)
);

CREATE TABLE `employees`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `first_name` VARCHAR(50) NOT NULL, 
    `last_name` VARCHAR(50) NOT NULL, 
    `title` VARCHAR(50), 
    `notes` TEXT
);

CREATE TABLE `customers`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `driver_licence_number` VARCHAR(50) NOT NULL, 
    `full_name` VARCHAR(50) NOT NULL, 
    `address` VARCHAR(50), 
    `city` VARCHAR(50), 
    `zip_code` INT,  
    `notes` TEXT
);

DROP TABLE `rental_orders`;

CREATE TABLE `rental_orders`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `employee_id` INT NOT NULL, 
    `customer_id` INT NOT NULL, 
    `car_id` INT NOT NULL, 
    `car_condition` VARCHAR(50), 
    `tank_level` INT NOT NULL,  
    `kilometrage_start` INT, 
    `kilometrage_end` INT, 
    `total_kilometrage` INT NOT NULL DEFAULT '0', 
    `start_date` DATE, 
    `end_date` DATE,
    `total_days` INT, 
    `rate_applied` DOUBLE(2, 1), 
    `tax_rate` DOUBLE(2, 1), 
    `order_status` VARCHAR(50), 
    `notes` TEXT
);

INSERT INTO `categories` (`category`, `daily_rate`) VALUES ('HEDGEBACK', '3.5');
INSERT INTO `categories` (`category`, `daily_rate`) VALUES ('LIMOUSINE', '4.5');
INSERT INTO `categories` (`category`, `daily_rate`) VALUES ('COMBI', '4.2');

INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`) VALUES ('E5402MB', 'VW', 'Passat', '1997', '3');
INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`) VALUES ('E6740KA', 'Merceds', 'C220', '1996', '2');
INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`) VALUES ('E1234KA', 'Nissan', 'Micra', '2004', '1');

INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Sasho', 'Sashov');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Gosho', 'Goshov');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Pesho', 'Peshov');

INSERT INTO `customers` (`driver_licence_number`, `full_name`) VALUES ('1044220072', 'Sasho Aleksandrov');
INSERT INTO `customers` (`driver_licence_number`, `full_name`) VALUES ('1234567890', 'Gosho Aleksandrov');
INSERT INTO `customers` (`driver_licence_number`, `full_name`) VALUES ('9876543210', 'Pesho Aleksandrov');

INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `tank_level`, `total_kilometrage`) VALUES ('1', '2', '3', '50', '150');
INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `tank_level`, `total_kilometrage`) VALUES ('2', '3', '2', '30', '200');
INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `tank_level`, `total_kilometrage`) VALUES ('3', '1', '1', '40', '50');


