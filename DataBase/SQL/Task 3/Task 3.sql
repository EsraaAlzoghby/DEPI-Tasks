--============================================ Part 01 ============================================
--****Restore ITI Database and then:****

-- 1.Retrieve a number of students who have a value in their age. 
SELECT COUNT(*) FROM Student WHERE St_Age IS NOT NULL

-- 2.Display number of courses for each topic name 
SELECT t.Top_Name, COUNT(*) AS 'Number of courses'
FROM Topic t, Course c
WHERE t.Top_Id = c.Top_Id
GROUP BY t.Top_Name

-- 3.Select Student first name and the data of his supervisor 
SELECT st.St_Fname, sv.*
FROM Student st
JOIN Student sv ON sv.St_Id = st.St_super

-- 4.Display student with the following Format (use isNull function)
--Student ID Student Full Name Department name
SELECT 
s.St_Id AS 'Student ID',
ISNULL(CONCAT(s.St_Fname, ' ', s.St_Lname), 'Not Recorded!') AS 'Student Full Name',
ISNULL(d.Dept_Name, 'Not Recorded!') AS 'Department name'
FROM Student s
JOIN Department d ON d.Dept_Id = s.Dept_Id
	
-- 5.Select instructor name and his salary but if there is no salary display value ‘0000’ . “use one of Null Function” 
SELECT Ins_Name, ISNULL(Salary, 0000) FROM Instructor

-- 6.Select Supervisor first name and the count of students who supervises on them
SELECT st.St_super, COUNT(*) AS NumOfStudents
FROM Student st
WHERE st.St_super IS NOT NULL
GROUP BY st.St_super

-- 7.Display max and min salary for instructors
SELECT MAX(Salary), MIN(Salary) FROM Instructor

-- 8.Select Average Salary for instructors 
SELECT AVG(Salary) FROM Instructor

-- 9.Display instructors who have salaries less than the average salary of all instructors.
SELECT * 
FROM Instructor 
WHERE Salary < (SELECT AVG(Salary) FROM Instructor);
-- 10.Display the Department name that contains the instructor who receives the minimum salary
SELECT TOP 1 d.Dept_Name
FROM Instructor i
JOIN Department d ON d.Dept_Id = i.Dept_Id
ORDER BY Salary ASC

--============================================ Part 02 ============================================
--****Restore MyCompany DB Database and then:****
--**DQL:**

--1.For each project, list the project name and the total hours per week (for all employees) spent on that project.
SELECT p.Pname, SUM(w.Hours) AS TotalHours
FROM Project p
JOIN Works_for w ON p.Pnumber = w.Pno
GROUP BY p.Pname
--2.For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
SELECT Dname, MAX(Salary) [Maximum salary], MIN(Salary) [Minimum salary], AVG(Salary) [Average salary]
FROM Departments d
INNER JOIN Employee e ON d.Dnum = e.Dno
GROUP BY d.Dname
--3.Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.
SELECT e.Fname, e.Lname, p.Pname
FROM Employee e
JOIN Works_for w ON e.SSN = w.ESSn
JOIN Project p ON w.Pno = p.Pnumber
ORDER BY p.Pname, e.Lname, e.Fname;
--4.Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30% 
UPDATE e
SET Salary = Salary * 1.3
FROM Employee e
JOIN Works_for w ON e.SSN = w.ESSn
JOIN Project p ON w.Pno = p.Pnumber
WHERE p.Pname = 'Al Rabwah';

--**DML:**

--1.In the department table insert a new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'.
INSERT INTO Departments (Dname, Dnum, MGRSSN, MGRStartDate)
VALUES ('DEPT IT', 100, 112233, '2006-11-01')
--2.Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), and they give you(your SSN =102672) her position (Dept. 20 manager) 
--a.First try to update her record in the department table
UPDATE Departments
SET MGRSSN = 968574
WHERE Dnum = 100
--b.Update your record to be department 20 manager.
UPDATE Departments
SET MGRSSN = 102672
WHERE Dnum = 20
--c.Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
UPDATE Employee
SET Superssn = 102672
WHERE SSN = 102660
--3.Unfortunately the company ended the contract with  Mr.Kamel Mohamed (SSN=223344) so try to delete him from your database in case you know that you will be temporarily in his position.
--Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handles these cases).
--1.Reassign employees he supervises to be under you:
UPDATE Employee
SET Superssn = 102672
WHERE Superssn = 223344;
--2.Reassign projects he works on to you:
UPDATE Works_for
SET ESSn = 102672
WHERE ESSn = 223344;
--3.Reassign department management from him to you:
UPDATE Departments
SET MGRSSN = 102672
WHERE MGRSSN = 223344;
--4.Delete his record from the Employee table:
DELETE FROM Employee
WHERE SSN = 223344;
--============================================ Part 03 ============================================
--****Using MyCompany Database and try to  create the following Queries:****

--1. Retrieve the names of all employees in department 10 who work more than or equal 10 hours per week on the "AL Rabwah" project.
SELECT CONCAT_WS(' ', Fname, Lname) AS EmployeeName
FROM Employee e
JOIN Works_for w ON e.SSN = w.ESSn
JOIN Project p ON p.Pnumber = w.Pno
WHERE e.Dno = 10 
  AND w.Hours >= 10 
  AND p.Pname = 'AL Rabwah';

--2. Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name
SELECT CONCAT_WS(' ', Fname, Lname) AS EmployeeName, p.Pname
FROM Employee e
JOIN Works_for w ON e.SSN = w.ESSn
JOIN Project p ON p.Pnumber = w.Pno
ORDER BY p.Pname;

--3. For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
SELECT p.Pnumber, d.Dname, e.Lname, e.Address, e.Bdate
FROM Project p
JOIN Departments d ON d.Dnum = p.Dnum
JOIN Employee e ON e.SSN = d.MGRSSN
WHERE p.City = 'Cairo';

--4. Display the data of the department which has the smallest employee ID over all employees' ID.
SELECT TOP 1 d.*
FROM Departments d
JOIN Employee e ON d.Dnum = e.Dno
ORDER BY e.SSN ASC;

--5. List the last name of all managers who have no dependents
SELECT DISTINCT mgr.Lname
FROM Employee emp
JOIN Employee mgr ON mgr.SSN = emp.Superssn
LEFT JOIN Dependent d ON mgr.SSN = d.ESSN
WHERE d.ESSN IS NULL;

--6. For each department-- if its average salary is less than the average salary of all employees display its number, name and number of its employees.
SELECT d.Dnum, d.Dname, COUNT(e.SSN) AS EmployeeCount
FROM Departments d
LEFT JOIN Employee e ON d.Dnum = e.Dno
GROUP BY d.Dnum, d.Dname
HAVING AVG(e.Salary) < (SELECT AVG(Salary) FROM Employee);

--7. Try to get the max 2 salaries using subquery
SELECT DISTINCT TOP 2 Salary
FROM Employee
ORDER BY Salary DESC;