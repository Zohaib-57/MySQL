USE person;

CREATE TABLE student_4 (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Age INT CHECK (Age BETWEEN 10 AND 25),
    Class INT NOT NULL,
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    City VARCHAR(30) DEFAULT 'Peshawar'
);
INSERT INTO student_4 (RollNo, Name, Gender, Age, Class, Marks, City) VALUES
(201, 'Ali Khan', 'Male', 17, 10, 76, 'Peshawar'),
(202, 'Sara Noor', 'Female', 16, 10, 88, 'Peshawar'),
(203, 'Hassan Riaz', 'Male', 18, 11, 81, 'Lahore'),
(204, 'Fatima Zahra', 'Female', 17, 11, 92, 'Lahore'),
(205, 'Bilal Shah', 'Male', 19, 12, 67, 'Islamabad'),
(206, 'Ayesha Malik', 'Female', 18, 12, 95, 'Islamabad'),
(207, 'Zain Ahmed', 'Male', 16, 10, 82, 'Karachi'),
(208, 'Maryam Tariq', 'Female', 15, 10, 90, 'Karachi'),
(209, 'Raza Hussain', 'Male', 18, 11, 73, 'Peshawar'),
(210, 'Muskan Ali', 'Female', 17, 11, 86, 'Multan'),
(211, 'Hamza Iqbal', 'Male', 17, 12, 84, 'Multan'),
(212, 'Sana Mir', 'Female', 16, 12, 91, 'Lahore'),
(213, 'Usman Khan', 'Male', 18, 10, 79, 'Peshawar'),
(214, 'Noor Fatima', 'Female', 17, 11, 93, 'Islamabad'),
(215, 'Ahmed Raza', 'Male', 19, 12, 72, 'Karachi');

-- Find the total number of students in each class.
SELECT class,COUNT(*) 
FROM student_4 
GROUP BY class; 

-- Show the average marks of students from each city.
SELECT city, AVG(marks) 
FROM student_4 
GROUP BY city;
-- Display the maximum marks obtained in each class.
SELECT class,MAX(marks)
FROM student_4
GROUP BY class;
-- List the minimum marks from each city.
SELECT city,MIN(marks)
FROM student_4
GROUP BY city;
-- Find how many male and female students are there in total.
SELECT gender,COUNT(*) 
FROM student_4
GROUP BY gender;

-- GROUP BY + HAVING
-- Show only those cities having more than 2 students.
SELECT city,COUNT(*)
FROM student_4
GROUP BY city
HAVING COUNT(*) > 2;

-- List classes where the average marks are greater than 80.
SELECT class,AVG(marks)
FROM student_4
GROUP BY class
HAVING AVG(marks) > 80;

-- Display the cities where the total number of students is at least 3 and their average marks are above 85.
SELECT city,COUNT(*) AND AVG(marks)
FROM student_4
GROUP BY city
HAVING COUNT(*) >= 3 AND AVG(marks) > 85;

-- Find all genders whose average marks exceed 82.
SELECT gender,COUNT(*) AND AVG(marks) as No_Of_Female_Topper
FROM student_4
GROUP BY gender
HAVING AVG(marks) > 82;
-- Show the classes that have more than 4 students enrolled.
SELECT class,COUNT(*)
FROM student_4
GROUP BY class
HAVING COUNT(*) > 4;