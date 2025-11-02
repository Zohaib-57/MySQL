CREATE DATABASE school_db;
USE school_db;

-- Students Table
CREATE TABLE students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  class INT,
  contact VARCHAR(15)
);

-- Courses Table
CREATE TABLE courses (
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  course_name VARCHAR(50),
  teacher VARCHAR(50)
);

-- Enrollments Table (linking students & courses)
CREATE TABLE enrollments (
  enroll_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT,
  course_id INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (name, class, contact) VALUES
('Ali Khan', 10, '0321456789'),
('Sara Ahmed', 11, '0312123456'),
('Bilal Raza', 12, '0300987654');

INSERT INTO courses (course_name, teacher) VALUES
('Math', 'Mr. Aslam'),
('Physics', 'Ms. Hina'),
('English', 'Mr. Tariq');

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1), (1, 2),
(2, 3),
(3, 1), (3, 2);


-- Show all students with their class and contact info.
SELECT name,class,contact FROM students;

-- List all courses offered in the school.
SELECT course_id,course_name FROM courses;

-- Find all students enrolled in “Math”.
SELECT s.name, c.course_name 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Math';

-- Find how many students are enrolled in each course (use GROUP BY).
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Retrieve the list of students who are not enrolled in any course.
SELECT s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

-- Show all courses along with their enrolled student names using JOIN.
SELECT c.course_name, s.name AS student_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
ORDER BY c.course_name;