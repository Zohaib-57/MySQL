use person;
select *  from student_2;
-- (=) & != equalto && notEqualTo operator
select * from student_2 where class = 12;
SELECT * FROM student_2 WHERE Class != 12;
SELECT * FROM student_2 WHERE Age > 18;
SELECT * FROM student_2 WHERE Age > 18;
SELECT * FROM student_2 WHERE Age < 20;	
SELECT * FROM student_2 WHERE Age >= 18;	
SELECT * FROM student_2 WHERE Age <= 25;

-- Logical Operators
SELECT * FROM student_2 WHERE Class = 12 AND Name = 'Sara';
SELECT * FROM student_2 WHERE Class = 12 OR Class = 11;
SELECT * FROM student_2 WHERE NOT Class = 12;

-- Range and Set
SELECT * FROM student_2 WHERE age  BETWEEN 18 AND 25;
SELECT * FROM stduent_2 WHERE age IN (12,10);

SELECT * FROM student_2
WHERE Gender = "Male" OR Class = "None";

-- ORDER BY
SELECT * FROM student_2
ORDER BY Name ASC;

SELECT * FROM student_2
ORDER BY Name DESC;
