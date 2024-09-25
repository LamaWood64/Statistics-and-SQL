CREATE DATABASE Enterprise;
USE Enterprise;

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(18,2)
);

CREATE TABLE Departments (
	DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Projects (
	ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE EmployeeProjects (
	EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    PRIMARY KEY (EmployeeID, ProjectID)
);

CREATE TABLE City (
	ID INT PRIMARY KEY,
    CityName VARCHAR(50),
    CountryCode VARCHAR(50),
    District VARCHAR(50),
    Population INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary)
VALUES
	(1, 'Bob', 'Rossmann', '2020-05-17', 5400.32),
    (2, 'Slava', 'Marllow', '2021-11-03', 5700.00),
    (3, 'Jerry', 'Todd', '2020-07-21', 4200.87),
    (4, 'Tom', 'Jerro', '2022-01-01', 3954.51),
    (5, 'Roman', 'Miller', '2024-02-17', 6403.00),
    (6, 'Jack', 'Dooglas', '2019-05-02', 4958.44),
    (7, 'Alex', 'Fisher', '2021-09-15', 6435.18),
    (8, 'Alice', 'Smitt', '2023-08-25', 5943.00),
    (9, 'Anna', 'Asti', '2024-03-03', 3954.00),
    (10, 'Roy', 'Brown', '2023-10-15', 3800.21);
    
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
	(1, 'IT'),
    (2, 'Sales'),
    (3, 'Finance'),
    (4, 'HR');
    
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID)
VALUES
	(1, 'App Development', 1),  
    (2, 'Project Rome', 2),
    (3, 'Project May20', 3),
    (4, 'Employee onboarding', 4);
    

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES
	(1, 2, 110),
    (2, 4, 78),
    (2, 1, 166),
    (3, 3, 168),
    (4, 2, 147),
    (5, 1, 174),
    (6, 3, 178),
    (7, 4, 139),
    (7, 3, 41),
    (7, 2, 12),
    (8, 1, 178),
    (9, 1, 156),
    (10, 1, 162);


INSERT INTO City (ID, CityName, CountryCode, District, Population)
VALUES
	(1, 'Berlin', 'GER, +49', 'Berlin', 3677472),
    (2, 'Tokyo', 'JPN, +81', 'Tokyo Metropolis', 37400068),
    (3, 'New York City', 'USA, +1', 'New York County ', 8804190),
    (4, 'Mumbai', 'IND, +91', 'Mumbai Suburban Distric', 20411274),
    (5, 'Frankfurt am Main', 'GER, +49', 'Hessen', 759224),
    (6, 'Mexico City', 'MEX, +52', 'Ciudad de México', 9209944),
    (7, 'London', 'GBR, +44', ' Greater London', 8961989),
    (8, 'São Paulo', 'BRA, +55', 'São Paulo Municipality', 12325232),
    (9, 'Shanghai', 'CHN, +86', 'Shanghai Municipality',  24281400),
    (10, 'Essen', 'GER, +49', 'Nordrhein-Westfalen', 579432);



														-- __TASK 1__ --

SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM EmployeeProjects;
SELECT * FROM City;

											-- 1.2 first and last names of employees from 'Sales' department
SELECT e.FirstName, e.LastName FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales';

											-- 1.3 total number of employees in each department
SELECT d.DepartmentName, COUNT(DISTINCT e.EmployeeID) AS NumberOfEmployee FROM Departments d
JOIN Projects p ON d.DepartmentID = p.DepartmentID
JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
GROUP BY d.DepartmentName;

											-- 1.4 employee with the highest salary
SELECT FirstName, LastName, Salary FROM Employees
ORDER BY Salary DESC LIMIT 1;

														-- __TASK 2__ --

											-- 2.1 average salary of employees in each department
SELECT d.DepartmentName, AVG(e.Salary) AS AverageSalary FROM Departments d
JOIN Projects p ON d.DepartmentID = p.DepartmentID
JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
GROUP BY d.DepartmentName;

											-- 2.1 employees who were hired in the year 2020

SELECT FirstName, LastName FROM Employees
WHERE YEAR(HireDate) = 2020;

											-- 2.1 employees without projects

SELECT e.FirstName, e.LastName FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;







														-- __TASK 3__ --

											-- 3.1 projects with employees from IT department
SELECT DISTINCT p.ProjectName FROM Projects p
JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';


											-- 3.2 emploees who participate in more than 2 projects
SELECT e.FirstName, e.LastName FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(ep.ProjectID) > 2;

											-- 3.3 employees earn more than averaeg
WITH AvgSalaryByDept AS (
    SELECT d.DepartmentID, AVG(e.Salary) AS AverageSalary
    FROM Employees e
    JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
    JOIN Projects p ON ep.ProjectID = p.ProjectID
    JOIN Departments d ON p.DepartmentID = d.DepartmentID
    GROUP BY d.DepartmentID
)
SELECT e.FirstName, e.LastName, e.Salary
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
JOIN AvgSalaryByDept a ON p.DepartmentID = a.DepartmentID
WHERE e.Salary > AverageSalary;


														-- __TASK 4__ --
											-- 4.1 names of employees and total hours worked on projects thats name starts with 'A'

SELECT e.FirstName, e.LastName, SUM(ep.HoursWorked) AS TotalHours FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE p.ProjectName LIKE 'A%'
GROUP BY e.FirstName, e.LastName;

											-- 4.2 names of employees who work on projects within their department
SELECT DISTINCT e.FirstName, e.LastName FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IN (
    SELECT dep.DepartmentID FROM Departments dep
    JOIN Projects proj ON dep.DepartmentID = proj.DepartmentID
    JOIN EmployeeProjects empr ON proj.ProjectID = empr.ProjectID
    WHERE empr.EmployeeID = e.EmployeeID
);



											-- 4.2 max, min, average salary within the company
SELECT 
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary,
    AVG(Salary) AS AverageSalary 
FROM Employees;

														-- __TASK 5__ --
											-- 5.1 cities with ountry code GER
SELECT * FROM City
WHERE CountryCode LIKE 'GER%';
                                                        