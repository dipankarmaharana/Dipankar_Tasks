CREATE DATABASE school;

USE school;

CREATE TABLE students (
    s_id INT PRIMARY KEY,
    s_name VARCHAR(100),
    s_age INT
);

INSERT INTO students (s_id, s_name, s_age) VALUES (1, 'Ram', 21);
INSERT INTO students (s_id, s_name, s_age) VALUES (2, 'Shamam', 21);

SELECT * FROM students;
