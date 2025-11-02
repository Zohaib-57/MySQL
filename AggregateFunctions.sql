USE person;
CREATE TABLE student_3 (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Age INT CHECK (Age >= 10 AND Age <= 25),
    Class INT NOT NULL,
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    City VARCHAR(30) DEFAULT 'Peshawar'
);
INSERT INTO student_3 (RollNo, Name, Gender, Age, Class, Marks, City) VALUES
(101, 'Ali Khan', 'Male', 17, 11, 78, 'Peshawar'),
(102, 'Sara Noor', 'Female', 16, 10, 85, 'Islamabad'),
(103, 'Raza Ahmed', 'Male', 18, 12, 92, 'Lahore'),
(104, 'Muskan Amal', 'Female', 17, 11, 88, 'Karachi'),
(105, 'Hassan Riaz', 'Male', 19, 12, 75, 'Peshawar'),
(106, 'Fatima Noor', 'Female', 15, 10, 90, 'Multan'),
(107, 'Bilal Shah', 'Male', 17, 11, 68, 'Quetta'),
(108, 'Ayesha Malik', 'Female', 18, 12, 96, 'Islamabad'),
(109, 'Zain Ali', 'Male', 16, 10, 82, 'Lahore'),
(110, 'Maryam Tariq', 'Female', 17, 11, 91, 'Peshawar');

SELECT * from student_3;

SELECT COUNT(*) FROM student_3 WHERE gender = "Female";
SELECT MAX(marks) FROM student_3;
SELECT SUM(marks) AS TotalMarks FROM student_3;

-- use if GROUP BY Clause
SELECT  class, AVG(marks) AS AverageMarks FROM student_3 GROUP BY class;
SELECT class,SUM(marks) as TotalMarks_Per_Class  FROM student_3 GROUP  BY class;

-- multiple fucntions
SELECT 
    COUNT(*) AS TotalStudents,
    AVG(Marks) AS AverageMarks,
    MAX(Marks) AS HighestMarks,
    MIN(Marks) AS LowestMarks
FROM student_3;


SELECT city, AVG(marks) 
FROM student_3
GROUP BY city
ORDER BY city;

