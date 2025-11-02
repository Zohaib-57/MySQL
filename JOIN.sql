use person;

CREATE TABLE student_7 (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Class INT
);

INSERT INTO student_7 (StudentID, Name, Class) VALUES
(1, 'Ali Khan', 10),
(2, 'Sara Ahmed', 11),
(3, 'Bilal Raza', 12),
(4, 'Hina Noor', 10);

CREATE TABLE result_3 (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Subject VARCHAR(50),
    Marks INT,
   FOREIGN KEY (StudentID) REFERENCES student_7(StudentID)
);

INSERT INTO result_3 (StudentID, Subject, Marks) VALUES
(1, 'Math', 88),
(1, 'English', 74),
(2, 'Math', 92),
(3, 'Physics', 81);
-- (5, 'Math', 85);  -- Note: StudentID 5 doesn’t exist in students

SELECT * FROM student_7;
SELECT * FROM result_3;

-- inner join
SELECT student_7.Name, result_3.Subject, result_3.Marks
FROM student_7
INNER JOIN result_3
ON student_7.StudentID = result_3.StudentID;

-- left join
SELECT * 
FROM student_7
LEFT JOIN result_3
ON student_7.StudentID = result_3.StudentID;

-- LEFT exclusivly join
SELECT * 
FROM student_7
LEFT JOIN result_3
ON student_7.StudentID = result_3.StudentID
WHERE result_3.StudentID IS NULL;

-- Right join
SELECT * 
FROM student_7
RIGHT JOIN result_3
ON student_7.StudentID = result_3.StudentID;

-- RIGHT exclusivly join
SELECT * 
FROM student_7
RIGHT JOIN result_3
ON student_7.StudentID = result_3.StudentID
WHERE student_7.StudentID IS NULL;

-- UNION && FULL OUTER JOIN 
SELECT Name, Class FROM student_7 WHERE Class >= 11
UNION
SELECT Name, Class FROM student_7 WHERE Class >= 11
ORDER BY Class DESC;

SELECT student_7.Name, result_3.Subject, result_3.Marks
FROM student_7
LEFT JOIN result_3 ON student_7.StudentID = result_3.StudentID
UNION
SELECT student_7.Name, result_3.Subject, result_3.Marks
FROM student_7
RIGHT JOIN result_3 ON student_7.StudentID = result_3.StudentID;

SELECT 
    A.Name AS Student1,
    B.Name AS Student2,
    A.Class
FROM student_7 A
JOIN student_7 B
ON A.Class = B.Class
WHERE A.StudentID <> B.StudentID;
