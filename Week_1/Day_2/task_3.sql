CREATE DATABASE company;

USE company;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Salary INT NOT NULL CHECK (Salary > 0),
    DepartmentID INT,
);

INSERT INTO Employees (FirstName, LastName, Email, Salary, DepartmentID) VALUES
('John', 'Doe', 'john.doe@company.com', 60000, 1),
('Jane', 'Smith', 'jane.smith@company.com', 75000, 2),
('Michael', 'Johnson', 'michael.johnson@company.com', 85000, 1),
('Emily', 'Williams', 'emily.williams@company.com', 72000, 3),
('David', 'Brown', 'david.brown@company.com', 65000, 2),
('Sarah', 'Davis', 'sarah.davis@company.com', 90000, 3);

-- 1. Select the first name, last name, and salary of the top 3 employees with the highest salaries.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- 2. Select the first name, last name, and salary of the top 3 employees with the lowest salaries.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary ASC
LIMIT 3;

-- 3. Select the first name, last name, and salary of the employee with the 2nd highest salary.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

-- 4. Select the first name, last name, and salary of the employee with the 2nd lowest salary.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary ASC
LIMIT 1 OFFSET 1;

-- 5. Select the first name, last name, and salary of the employee with the 3rd highest salary.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 2;

-- 6. Select the first name, last name, and salary of the employee with the 3rd lowest salary.
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary ASC
LIMIT 1 OFFSET 2;

-- 7. Select the first name, last name, email, and salary of employees with a salary between 65000 and 80000,
-- ordered by their first name in descending order, and limit the result to 3 rows.
SELECT FirstName, LastName, Email, Salary
FROM Employees
WHERE Salary BETWEEN 65000 AND 80000
ORDER BY FirstName DESC
LIMIT 3;
