-- =============================================================
-- CompanyDB_For_CompanyDB_For_Task.sql
-- =============================================================
-- =========================================
-- 1. -- Create database
-- =========================================
CREATE DATABASE CompanyDB_For_Task;
GO
USE CompanyDB_For_Task;
GO
-- =========================================
--  2. DATABASE DESIGN: Create tables (employees, departments, projects, employee_projects)
-- =========================================

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    Dname NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100) NOT NULL
);

CREATE TABLE Projects (
    Project_id INT PRIMARY KEY,
    Pname NVARCHAR(100) NOT NULL,
    Budget DECIMAL(18,2) CHECK (Budget >= 0),
    Start_date DATE NOT NULL,
    End_date DATE,
    dept_id INT FOREIGN KEY REFERENCES Departments(dept_id)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    Fname NVARCHAR(50) NOT NULL,
    Lname NVARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    BirthDate DATE NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    dept_id INT FOREIGN KEY REFERENCES Departments(dept_id),
    Age AS DATEDIFF(YEAR, BirthDate, GETDATE()) 
);

CREATE TABLE EmployeeProjects (
    emp_id INT FOREIGN KEY REFERENCES Employees(emp_id),
    Project_id INT FOREIGN KEY REFERENCES Projects(Project_id),
    number_of_hours INT CHECK (number_of_hours >= 0),
    PRIMARY KEY (emp_id, Project_id)
);

-- =========================================
-- 3. POPULATE THE TABLES: Insert sample data (3-4 rows each)
-- =========================================

INSERT INTO Departments VALUES
(1, 'IT', 'Cairo'),
(2, 'HR', 'Alexandria'),
(3, 'Finance', 'Giza');

INSERT INTO Projects VALUES
(101, 'Payroll System', 50000, '2023-01-01', '2024-06-01', 1),
(102, 'Recruitment Platform', 20000, '2024-03-01', '2024-12-31', 2),
(103, 'Budget Planning', 30000, '2024-05-15', NULL, 3);

INSERT INTO Employees (emp_id, Fname, Lname, Gender, BirthDate, HireDate, Salary, dept_id) VALUES
(1, 'Ali', 'Hassan', 'M', '1990-05-10', '2015-06-01', 15000, 1),
(2, 'Sara', 'Ibrahim', 'F', '1988-03-20', '2012-09-15', 17000, 2),
(3, 'esraa', 'Yousef', 'F', '2000-12-01', '2018-01-20', 14000, 1),
(4, 'Omar', 'ahmed', 'M', '1985-08-12', '2010-04-30', 20000, 3);

INSERT INTO EmployeeProjects VALUES
(1, 101, 120),
(2, 102, 90),
(3, 101, 80),
(4, 103, 100),
(1, 103, 40);

-- =========================================
--  4. Advanced SQL Queries
-- =========================================

-- 1. Display all employees along with their computed ages.
SELECT emp_id, Fname, Lname, BirthDate, Age FROM Employees;

-- 2. Display employees along with their department names and locations.
SELECT E.emp_id, Fname, Lname, D.Dname, D.Location
FROM Employees E
INNER JOIN Departments D ON E.dept_id = D.dept_id;

-- 3. Display each department along with the number of employees in it.
SELECT D.Dname, COUNT(E.emp_id) AS NumberOfEmployees
FROM Departments D
LEFT JOIN Employees E ON D.dept_id = E.dept_id
GROUP BY D.Dname;

-- 4. List employees who are working on projects managed by their own departments.
SELECT DISTINCT E.emp_id, Fname, Lname
FROM Employees E
JOIN EmployeeProjects EP ON E.emp_id = EP.emp_id
JOIN Projects P ON EP.Project_id = P.Project_id
WHERE E.dept_id = P.dept_id;

-- 5. Display projects that end in the year 2024 only.
SELECT * FROM Projects
WHERE YEAR(End_date) = 2024;

-- 6. Find employees who have their birthday today.
SELECT * FROM Employees
WHERE DAY(BirthDate) = DAY(GETDATE()) AND MONTH(BirthDate) = MONTH(GETDATE());

-- 7. Calculate average salary grouped by gender.
SELECT Gender, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Gender;

-- 8. List departments that do not have any projects assigned to them.
SELECT D.*
FROM Departments D
LEFT JOIN Projects P ON D.dept_id = P.dept_id
WHERE P.Project_id IS NULL;

-- 9. Display salary statistics (min, max, avg) for each department.
SELECT D.Dname, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary, AVG(Salary) AS AvgSalary
FROM Employees E
JOIN Departments D ON E.dept_id = D.dept_id
GROUP BY D.Dname;

-- 10. List employees who have worked on more than one project.
SELECT emp_id, COUNT(Project_id) AS ProjectsCount
FROM EmployeeProjects
GROUP BY emp_id
HAVING COUNT(Project_id) > 1;

-- 11. Rank employees by salary within each department.
SELECT emp_id, Fname, Lname, dept_id, Salary,
       RANK() OVER (PARTITION BY dept_id ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

-- 12. Display IT department projects that exceed the department's average project budget.
SELECT * FROM Projects
WHERE dept_id = 1 AND Budget > (
    SELECT AVG(Budget) FROM Projects WHERE dept_id = 1
);

-- 13. Calculate the total company payroll (monthly and annually).
SELECT
    SUM(Salary) AS MonthlyPayroll,
    SUM(Salary) * 12 AS AnnualPayroll
FROM Employees;

-- =========================================
-- 5. Stored Procedures and Functions
-- =========================================

-- 1. Scalar function to calculate employee bonus based on gender
CREATE FUNCTION dbo.fn_CalculateBonus (@Gender CHAR(1), @Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN CASE
        WHEN @Gender = 'F' THEN @Salary * 0.10
        WHEN @Gender = 'M' THEN @Salary * 0.05
        ELSE 0
    END
END;

-- 2. Procedure to apply bonuses to salaries
CREATE PROCEDURE ApplyBonuses
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + dbo.fn_CalculateBonus(Gender, Salary);
END;

-- 3. Procedure to insert new employee after validating department
CREATE PROCEDURE InsertEmployee
    @emp_id INT,
    @Fname NVARCHAR(50),
    @Lname NVARCHAR(50),
    @Gender CHAR(1),
    @BirthDate DATE,
    @HireDate DATE,
    @Salary DECIMAL(10,2),
    @dept_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Departments WHERE dept_id = @dept_id)
    BEGIN
        INSERT INTO Employees (emp_id, Fname, Lname, Gender, BirthDate, HireDate, Salary, dept_id)
        VALUES (@emp_id, @Fname, @Lname, @Gender, @BirthDate, @HireDate, @Salary, @dept_id);
    END
    ELSE
    BEGIN
        PRINT 'Department does not exist.';
    END
END;

-- 4. Procedure to generate department-level employee summary
CREATE PROCEDURE DepartmentEmployeeSummary
AS
BEGIN
    SELECT D.Dname, COUNT(E.emp_id) AS NumberOfEmployees, AVG(E.Salary) AS AvgSalary
    FROM Departments D
    LEFT JOIN Employees E ON D.dept_id = E.dept_id
    GROUP BY D.Dname;
END;

-- 5. Scalar function to calculate tenure (years of service)
CREATE FUNCTION dbo.fn_CalculateTenure(@StartDate DATE, @EndDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @StartDate, ISNULL(@EndDate, GETDATE()));
END;

-- =========================================
--  6. Triggers and Audit Table
-- =========================================

-- 1. Create audit table for salary changes
CREATE TABLE salary_changes (
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date DATETIME DEFAULT GETDATE(),
    changed_by NVARCHAR(100)
);

-- 2. Trigger to log salary update
CREATE TRIGGER trg_LogSalaryChange
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO salary_changes (emp_id, old_salary, new_salary, changed_by)
    SELECT D.emp_id, D.Salary, I.Salary, SYSTEM_USER
    FROM inserted I
    JOIN deleted D ON I.emp_id = D.emp_id
    WHERE I.Salary <> D.Salary;
END;

-- 3. Trigger to alert on new employee
CREATE TRIGGER trg_NewEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    DECLARE @Name NVARCHAR(100), @DeptID INT;
    SELECT @Name = Fname + ' ' + Lname, @DeptID = dept_id FROM inserted;
    PRINT 'New employee added: ' + @Name + ', Department ID: ' + CAST(@DeptID AS NVARCHAR);
END;

-- =========================================
--  7. Views
-- =========================================

-- 1. View: Employee Summary
CREATE VIEW EmployeeSummary AS
SELECT
    E.emp_id,
    E.Fname + ' ' + E.Lname AS FullName,
    E.Gender,
    E.Salary,
    E.Age,
    D.Dname,
    D.Location
FROM Employees E
JOIN Departments D ON E.dept_id = D.dept_id;

-- =========================================
-- 8. Indexes
-- =========================================

-- 1. Non-clustered index on salary
CREATE NONCLUSTERED INDEX idx_salary ON Employees(Salary);

-- 2. Composite index on Projects(Pname, End_date)
CREATE NONCLUSTERED INDEX idx_project_name_enddate ON Projects(Pname, End_date);

-- 3. Index on dept_id to optimize joins
CREATE NONCLUSTERED INDEX idx_employees_dept ON Employees(dept_id);

-- =========================================
-- =========================================
