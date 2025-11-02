USE person;

CREATE TABLE student_5 (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Class INT
);
CREATE TABLE result_2 (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    RollNo INT,
    Marks INT,
    Grade VARCHAR(5),
    FOREIGN KEY (RollNo)
        REFERENCES student(RollNo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
INSERT INTO student_5 (RollNo, Name, Class) VALUES
(1, 'Ali', 10),
(2, 'Sara', 11),
(3, 'Bilal', 12);

INSERT INTO result_2 (RollNo, Marks, Grade) VALUES
(1, 88, 'A'),
(2, 79, 'B'),
(3, 92, 'A+');

--  before cascading
SELECT * FROM student_5;
SELECT * FROM result_2;

-- After cascading
DELETE FROM student_5 
WHERE RollNo = 2;

UPDATE student_5
SET RollNo = 10
WHERE RollNo = 1;

SELECT * FROM student_5;
SELECT * FROM result_2;


