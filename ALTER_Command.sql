USE person;

CREATE TABLE student_6 (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);
INSERT INTO student_6 (Name, Age, Department) VALUES
('Ali Khan', 19, 'Computer Science'),
('Sara Ahmed', 21, 'Mathematics'),
('Bilal Raza', 20, 'Physics'),
('Hina Noor', 22, 'Computer Science'),
('Usman Tariq', 23, 'Chemistry');

SELECT * FROM student_6;

ALTER TABLE student_6
ADD Email VARCHAR(60);

SELECT * FROM student_6;

ALTER TABLE student_6
ADD City VARCHAR(30) 
DEFAULT 'Peshawar';

SELECT * FROM student_6;

ALTER TABLE student_6
CHANGE Name FullName VARCHAR(60);

SELECT * FROM student_6;

ALTER TABLE student_6
DROP COLUMN Department;

SELECT * FROM student_6;

ALTER TABLE student_6
ADD CONSTRAINT chk_age CHECK (Age >= 18);

SELECT * FROM student_6;

RENAME TABLE student_6 TO student_info;
SELECT * FROM student_info;

TRUNCATE student_info;

SELECT * FROM student_info;