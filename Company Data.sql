CREATE DATABASE GigGenie;

USE GigGenie;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO employee (name, age, department, job_title, salary, hire_date, city)
VALUES
('Ali Khan', 34, 'IT', 'Software Engineer', 85000.00, '2020-03-15', 'Lahore'),
('Sara Ahmed', 28, 'HR', 'HR Manager', 65000.00, '2021-07-10', 'Karachi'),
('Ahmed Raza', 41, 'Finance', 'Accountant', 72000.00, '2018-11-23', 'Islamabad'),
('Fatima Noor', 25, 'Marketing', 'Social Media Executive', 50000.00, '2022-02-18', 'Faisalabad'),
('Zohaib Abbas', 30, 'IT', 'Full Stack Developer', 95000.00, '2019-06-01', 'Multan'),
('Hassan Ali', 38, 'Sales', 'Sales Executive', 60000.00, '2017-12-03', 'Karachi'),
('Zainab Tariq', 26, 'Customer Support', 'Support Specialist', 48000.00, '2023-04-11', 'Lahore'),
('Usman Malik', 32, 'Finance', 'Senior Accountant', 88000.00, '2020-08-25', 'Islamabad'),
('Ayesha Khan', 29, 'Marketing', 'Content Strategist', 70000.00, '2021-03-30', 'Lahore'),
('Bilal Iqbal', 45, 'IT', 'Project Manager', 110000.00, '2016-01-05', 'Karachi');

SELECT * from employee;
