-- 1. Create a database and tables

CREATE DATABASE school_management;

USE school_management;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),  
    date_of_birth DATE
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    course_description TEXT,
    credits INT
);

-- 2. Modify Table Structure

ALTER TABLE students
ADD COLUMN grade VARCHAR(2);

ALTER TABLE students
MODIFY COLUMN phone_number VARCHAR(15);

-- 3. Insert Data into Tables

INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, grade)
VALUES 
(1, 'Shreyansh', 'P', 'shreyansh.d@mail.com', '9876543210', '2000-01-15', 'A'),
(2, 'Tanya', 'DSouza', 'tanya.dsouza@mail.com', '9867452310', '1999-07-30', 'B'),
(3, 'Tisha', 'Oberoi', 'tisha.oberoi@mail.com', '8967452301', '2001-03-22', 'A');

INSERT INTO courses (course_name, course_description, credits)
VALUES 
('Law', 'Introduction to Law and Legal Procedures', 3),
('Economics', 'Introduction to Indian Economy by Nirmala Tai', 3),
('History', 'World History', 4),
('Political Science', 'Basics of Political Science', 3),
('Art', 'Introduction to Art', 2);

-- 4. Query Data

SELECT first_name, last_name, email FROM students;

-- 6. Drop Objects

DROP TABLE students;

DROP DATABASE school_management;
