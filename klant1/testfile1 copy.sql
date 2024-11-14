-- Dummy SQL Script
-- Purpose: Creates a sample database with a few tables and inserts dummy data

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Salaries table
CREATE TABLE Salaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'HR');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'Engineering');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Sales');

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate)
VALUES 
(101, 'John', 'Doe', 1, '2022-01-15'),
(102, 'Jane', 'Smith', 2, '2023-03-22'),
(103, 'Mike', 'Johnson', 2, '2021-06-30'),
(104, 'Emily', 'Davis', 3, '2020-09-14');

-- Insert data into Salaries
INSERT INTO Salaries (EmployeeID, Salary, EffectiveDate)
VALUES 
(101, 50000.00, '2023-01-01'),
(102, 70000.00, '2023-01-01'),
(103, 65000.00, '2023-01-01'),
(104, 55000.00, '2023-01-01');

-- Sample Query 1: Display all employees with their department names
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Sample Query 2: Display all salaries greater than 60,000
SELECT e.FirstName, e.LastName, s.Salary
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.Salary > 60000;

-- Sample Query 3: Calculate average salary per department
SELECT d.DepartmentName, AVG(s.Salary) AS AverageSalary
FROM Departments d
JOIN Employees e ON d.DepartmentID = e.DepartmentID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY d.DepartmentName;

-- Sample Query 4: Find employees hired after a specific date
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > '2022-01-01';

-- End of Dummy SQL Script
