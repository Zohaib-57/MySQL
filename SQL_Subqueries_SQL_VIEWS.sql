use techbuzz;

CREATE TABLE students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Class INT,
    City VARCHAR(50)
);
INSERT INTO students (StudentID, Name, Class, City) VALUES
(1, 'Ali Khan', 10, 'Peshawar'),
(2, 'Sara Ahmed', 11, 'Lahore'),
(3, 'Bilal Raza', 12, 'Karachi'),
(4, 'Hina Noor', 10, 'Peshawar'),
(5, 'Usman Malik', 12, 'Islamabad'),
(6, 'Ayesha Khan', 11, 'Karachi');

CREATE TABLE results (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Subject VARCHAR(50),
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID)
);
INSERT INTO results (StudentID, Subject, Marks) VALUES
(1, 'Math', 88),
(1, 'English', 74),
(2, 'Math', 92),
(2, 'Physics', 79),
(3, 'Chemistry', 85),
(3, 'Math', 81),
(4, 'English', 60),
(5, 'Math', 95),
(6, 'Physics', 77);

CREATE TABLE fees (
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    AmountPaid INT,
    Month VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES students(StudentID)
);
INSERT INTO fees (StudentID, AmountPaid, Month) VALUES
(1, 5000, 'January'),
(2, 5000, 'January'),
(3, 4500, 'January'),
(4, 5000, 'January'),
(5, 4000, 'January'),
(6, 5000, 'January'),
(1, 5000, 'February'),
(2, 5000, 'February'),
(3, 4500, 'February'),
(5, 4000, 'February');

SELECT * FROM students;
SELECT * FROM results;
SELECT * FROM fees;

SELECT Name
FROM students 
WHERE StudentID IN (
    SELECT StudentID FROM results 
    WHERE Marks > (SELECT AVG(Marks) FROM results)
);

SELECT Name
FROM students
WHERE StudentID IN (
    SELECT StudentID FROM fees
    GROUP BY StudentID
    HAVING AVG(AmountPaid) < (SELECT AVG(AmountPaid) FROM fees)
);

SELECT Name
FROM students s
WHERE NOT EXISTS (
    SELECT Month
    FROM fees f
    WHERE f.StudentID = s.StudentID
    AND Month NOT IN ('January', 'February')
);

SELECT r.Subject, s.Name, r.Marks
FROM results r
JOIN students s ON s.StudentID = r.StudentID
WHERE r.Marks = (
    SELECT MAX(Marks)
    FROM results
    WHERE Subject = r.Subject
);

SELECT Name
FROM students s
WHERE NOT EXISTS (
    SELECT 1 FROM results r WHERE r.StudentID = s.StudentID
);

-- VIEWS

CREATE VIEW student_view AS
SELECT Name, Class, City
FROM students;

SELECT * FROM student_view;

CREATE VIEW high_scorers AS
SELECT s.Name, r.Subject, r.Marks
FROM students s
JOIN results r ON s.StudentID = r.StudentID
WHERE r.Marks > 85;

SELECT * FROM high_scorers;

CREATE VIEW student_avg_marks AS
SELECT s.Name, AVG(r.Marks) AS Average_Marks
FROM students s
JOIN results r ON s.StudentID = r.StudentID
GROUP BY s.Name;

SELECT * FROM student_avg_marks;

CREATE OR REPLACE VIEW high_scorers AS
SELECT s.Name, r.Subject, r.Marks
FROM students s
JOIN results r ON s.StudentID = r.StudentID
WHERE r.Marks > 90;

DROP VIEW IF EXISTS high_scorers;
