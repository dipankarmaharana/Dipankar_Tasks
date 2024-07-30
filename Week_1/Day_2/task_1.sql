CREATE DATABASE company;

USE company;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL
);

INSERT INTO Departments (DepartmentName) VALUES
('Marketing'),
('Sales'),
('IT'),
('Finance'),
('HR');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Salary INT NOT NULL CHECK (Salary > 0),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (FirstName, LastName, Email, Salary, DepartmentID) VALUES
('John', 'Doe', 'john.doe@company.com', 60000, 1),
('Jane', 'Smith', 'jane.smith@company.com', 75000, 2),
('Michael', 'Johnson', 'michael.johnson@company.com', 85000, 1),
('Emily', 'Williams', 'emily.williams@company.com', 72000, 3),
('David', 'Brown', 'david.brown@company.com', 65000, 2),
('Sarah', 'Davis', 'sarah.davis@company.com', 90000, 3),
('Robert', 'Miller', 'robert.miller@company.com', 70000, 4),
('Jessica', 'Wilson', 'jessica.wilson@company.com', 65000, 4),
('Daniel', 'Anderson', 'daniel.anderson@company.com', 72000, 3),
('Ashley', 'Taylor', 'ashley.taylor@company.com', 58000, 2),
('William', 'Brown', 'william.brown@company.com', 78000, 1),
('Sophia', 'Davis', 'sophia.davis@company.com', 62000, 5);


-- 1. Create a constraint to ensure that the salary of an employee is greater than 0
-- Already added during the table creation with CHECK constraint.

-- 2. Create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table
-- Already added during the table creation.

-- 3. Create a unique constraint on the Email column in the Employees table
-- Already added during the table creation.

-- 4. Create a primary key constraint on the DepartmentID column in the Departments table
-- Already added during the table creation.

-- 5. Create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 6. Insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation.
-- This will result in an error
INSERT INTO Employees (FirstName, LastName, Email, Salary, DepartmentID) VALUES
('Test', 'User', 'test.user@company.com', 50000, 999);  -- DepartmentID 999 does not exist

-- 7. Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.
-- This will result in an error
INSERT INTO Employees (FirstName, LastName, Email, Salary, DepartmentID) VALUES
('Duplicate', 'Email', 'john.doe@company.com', 50000, 1);  -- Duplicate email address

-- 8. Delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation.
-- This will result in an error
DELETE FROM Departments WHERE DepartmentID = 1;  -- DepartmentID 1 is referenced by Employees

-- 9. Update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation.
-- This will result in an error
UPDATE Employees SET DepartmentID = 999 WHERE EmployeeID = 1;  -- DepartmentID 999 does not exist
