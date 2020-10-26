CREATE SCHEMA `people`;

DROP TABLE `people`;

CREATE TABLE `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` MEDIUMBLOB, 
`height` DOUBLE(10, 2), 
`weight` DOUBLE(10, 2), 
`gender` CHAR(1) NOT NULL, 
`birthdate` DATE NOT NULL, 
`biography` TEXT
);

INSERT INTO `people`(`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) 
VALUES ('Alex Urumov', (LOAD_FILE('/Users/macbookair/Downloads/453-4.jpg')), 
'1.94', '105.15', 'M', '1992-05-28', 
'My name is Alex and I am a programmer.');
INSERT INTO `people`(`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) 
VALUES ('Hrisi Korcheva', (LOAD_FILE('/Users/macbookair/Downloads/453-4.jpg')), 
'1.70', '55.00', 'F', '1997-02-01', 
'My name is Hrisi and I am an architect.');
INSERT INTO `people`(`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) 
VALUES ('Niki Ruychev', (LOAD_FILE('/Users/macbookair/Downloads/453-4.jpg')), 
'1.75', '75.95', 'M', '1993-07-21', 
'My name is Niki and I am a designer.');
INSERT INTO `people`(`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) 
VALUES ('Joji Urumov', (LOAD_FILE('/Users/macbookair/Downloads/453-4.jpg')), 
'1.85', '89.00', 'M', '1981-07-29', 
'My name is Joji and I am a truck driver.');
INSERT INTO `people`(`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) 
VALUES ('Emi Urumova', (LOAD_FILE('/Users/macbookair/Downloads/453-4.jpg')), 
'1.80', '85.00', 'F', '1959-10-17', 
'My name is Emi and I am an accountant.');

