CREATE TABLE clients(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `client_name` VARCHAR(100), 
    `project_id` INT
);

CREATE TABLE projects2(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `client_id` INT, 
    `project_lead_id` INT, 
    CONSTRAINT fk_projects_clients
    FOREIGN KEY (client_id)
    REFERENCES clients(id)
);

CREATE TABLE employees2(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `first_name` VARCHAR(30) NOT NULL,
	`last_name` VARCHAR(30) NOT NULL, 
	`project_id` INT, 
    CONSTRAINT fk_employees2_projects
    FOREIGN KEY (project_id)
    REFERENCES projects(id)
);

ALTER TABLE projects2
ADD CONSTRAINT fk_projects_employees2
FOREIGN KEY (project_lead_id)
REFERENCES employees2(id);

ALTER TABLE clients
ADD CONSTRAINT fk_clients_projects2
FOREIGN KEY (project_id)
REFERENCES projects2(id);
