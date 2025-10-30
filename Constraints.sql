use person;
-- practising the constraint
CREATE TABLE student_2 (
  Name VARCHAR(50) NOT NULL,                  -- Must have a value
  Email VARCHAR(100) UNIQUE,                  -- No duplicate emails
  Age INT CHECK (Age >= 5 AND Age <= 25),     -- Must be between 5 and 25
  Gender ENUM('Male', 'Female', 'Other'),     -- Only these values allowed
  City VARCHAR(50) DEFAULT 'Peshawar'         -- Auto-filled if not provided
);
INSERT INTO student_2 (Name, Email, Age, Gender)
VALUES ('Ali Khan', 'ali@gmail.com', 18, 'Male');

INSERT INTO student_2 (Name, Email, Age, Gender, City)
VALUES ('Sara Ahmed', 'sara@gmail.com', 20, 'Female', 'Islamabad');

-- This will fail (CHECK constraint)
 --  INSERT INTO student_2(Name, Email, Age, Gender)
--  VALUES ('Baby', 'baby@example.com', 3, 'Female');

select * from student_2;

