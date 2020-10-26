CREATE TABLE `minions`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL, 
`age` INT 
);

CREATE TABLE `towns`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL;

ALTER TABLE `minions`
ADD CONSTRAINT fk_minions_towns 
FOREIGN KEY (`town_id`) 
REFERENCES `towns`(`id`);

INSERT INTO `towns` (`name`) VALUES ('Sofia');
INSERT INTO `towns` (`name`) VALUES ('Plovdiv');
INSERT INTO `towns` (`name`) VALUES ('Varna');

INSERT INTO `minions` (`name`, `age`, `town_id`) VALUES ('Kevin', '22', 1);
INSERT INTO `minions` (`name`, `age`, `town_id`) VALUES ('Bob', '15', 3);
INSERT INTO `minions` (`name`, `town_id`) VALUES ('Steward', 2);

TRUNCATE TABLE `minions`;

DROP TABLE `minions`;
DROP TABLE `towns`;