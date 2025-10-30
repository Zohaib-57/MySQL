
USE person;
-- practise the primary key and foreign key  
CREATE TABLE student (

  RollNo INT PRIMARY KEY,   
  Name VARCHAR(50),
  Class INT,
  Contact VARCHAR(15)
);

INSERT INTO student (RollNo, Name, Class, Contact)
VALUES
(415, 'Sher Ali Khan', 12, '091344567'),
(123, 'Muhammad Shah', 11, '091322555'),
(890, 'Muskan Amal', 12, '091098789'),
(2341, 'Razaq', 12, '0913534267');

SELECT * FROM student;

CREATE TABLE result (
  ResultID INT AUTO_INCREMENT PRIMARY KEY,
  RollNo INT,
  Subject VARCHAR(50),
  Marks INT,
  Grade CHAR(2),

  FOREIGN KEY (RollNo) REFERENCES student(RollNo)
);
INSERT INTO result (RollNo, Subject, Marks, Grade)
VALUES
(415, 'Math', 85, 'A'),
(415, 'English', 78, 'B'),
(123, 'Math', 92, 'A'),
(890, 'Science', 66, 'C'),
(2341, 'Math', 75, 'B');

-- induvisual table result  
select * from result;

-- to see the combined result of the both student and the result table 

SELECT s.RollNo, s.Name, s.Class, r.Subject, r.Marks, r.Grade
FROM student s
JOIN result r ON s.RollNo = r.RollNo;


