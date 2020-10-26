CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(20)
);

CREATE TABLE exams (
	exam_id INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(20)
) AUTO_INCREMENT = 101;

CREATE TABLE students_exams (
	student_id INT, 
    exam_id INT
);

INSERT INTO students(`name`) VALUES ('Mila'), ('Toni'), ('Ron');

INSERT INTO exams(`name`) VALUES ('Spring MVC'), ('Neo4j'), ('Oracle 11g');

INSERT INTO students_exams(student_id, exam_id) VALUES (1, 101), (1, 102), (2, 101), (3, 103), (2, 102), (2, 103);

ALTER TABLE students_exams
ADD CONSTRAINT pk_students_exams
PRIMARY KEY (student_id, exam_id), 
ADD CONSTRAINT fk_students_exams_students
FOREIGN KEY (student_id)
REFERENCES students(student_id), 
ADD CONSTRAINT fk_students_exams_exams
FOREIGN KEY (exam_id)
REFERENCES exams(exam_id);
