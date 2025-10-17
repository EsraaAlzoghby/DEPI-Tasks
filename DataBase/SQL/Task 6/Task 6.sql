--============================================ Part 01 (Views) ============================================
--****Restore ITI Database and then:****
--****Note : # means number and for example d2 means department which has id or number 2****
--1.Create a view that displays the student's full name, course name if the student has a grade more than 50. 
CREATE OR ALTER VIEW vStudentPassedCourses AS
SELECT St_Fname + ' ' + St_Lname AS FullName, c.Crs_Name AS CourseName
FROM Student st
JOIN Stud_Course sc ON st.St_Id = sc.St_Id
JOIN Course c ON c.Crs_Id = sc.Crs_Id
WHERE sc.Grade > 50;

SELECT * FROM vStudentPassedCourses


--2.Create an Encrypted view that displays manager names and the topics they teach. 
CREATE OR ALTER VIEW vManagerTopics
WITH ENCRYPTION AS
SELECT DISTINCT Mgr.Ins_Name, t.Top_Name
FROM Department d
JOIN Instructor Mgr ON Mgr.Ins_Id = d.Dept_Manager
JOIN Ins_Course ic ON Mgr.Ins_Id = ic.Ins_Id
JOIN Course crs ON crs.Crs_Id = ic.Crs_Id
JOIN Topic t ON t.Top_Id = crs.Top_Id;

SELECT * FROM vManagerTopics;


--3.Create a view that will display Instructor Name, Department Name for the ‘SD’ or ‘Java’ Department “use Schema binding” and describe what is the meaning of Schema Binding
CREATE OR ALTER VIEW vInstructorFromSDorJavaDept
WITH SCHEMABINDING AS
SELECT i.Ins_Name, d.Dept_Name
FROM dbo.Instructor i
JOIN dbo.Department d ON d.Dept_Id = i.Dept_Id
WHERE d.Dept_Name IN ('SD','Java');

SELECT * FROM vInstructorFromSDorJavaDept


--4.Create a view “V1” that displays student data for students who live in Alex or Cairo. 
CREATE OR ALTER VIEW V1
WITH SCHEMABINDING AS
SELECT St_Id, St_Fname, St_Lname, St_Address, St_Age
FROM dbo.Student
WHERE St_Address IN ('Alex', 'Cairo')

SELECT * FROM V1;


/*Note: Prevent the users to run the following query 
Update V1 set st_address=’tanta’
Where st_address=’alex’;
0.	Create a view that will display the project name and the number of employees working on it. (Use Company DB)
*/
CREATE OR ALTER VIEW vProjectEmployeesNumber AS
SELECT p.Pname, COUNT(w.Essn) AS NumEmployees
FROM Project p
JOIN Works_for w ON p.Pnumber = w.Pno
GROUP BY p.Pname;

SELECT * FROM vProjectEmployeesNumber


--****use IKEA_Company_DB:****

--1.Create a view named “v_clerk” that will display employee Number, project Number, the date of hiring of all the jobs of the type 'Clerk'.
CREATE OR ALTER VIEW v_clerk AS
SELECT e.EmpNo, w.ProjectNo, w.Enter_Date
FROM HR.Employee e
JOIN Works_on w ON e.EmpNo = w.EmpNo
WHERE e.Job = 'Clerk';

SELECT * FROM v_clerk


--2. Create view named  “v_without_budget” that will display all the projects data without budget
CREATE OR ALTER VIEW v_without_budget AS
SELECT *
FROM HR.Project
WHERE Budget IS NULL;

SELECT * FROM v_without_budget;

--3.Create view named  “v_count “ that will display the project name and the Number of jobs in it
CREATE OR ALTER VIEW v_count AS
SELECT p.ProjectName, COUNT(w.Job) AS NumJobs
FROM HR.Project p
LEFT JOIN Works_on w ON p.ProjectNo = w.ProjectNo
GROUP BY p.ProjectName;

SELECT * FROM v_count

--4.Create a view named” v_project_p2” that will display the emp# s for the project# ‘p2’. (use the previously created view  “v_clerk”)
CREATE OR ALTER VIEW v_project_p2 AS
SELECT * 
FROM v_clerk
WHERE ProjectNo = 2

SELECT * FROM v_project_p2

--5.modify the view named “v_without_budget” to display all DATA in project p1 and p2.
ALTER VIEW v_without_budget AS
SELECT *
FROM HR.Project
WHERE Budget IS NULL AND ProjectNo IN (1,2)

SELECT * FROM v_without_budget;

--6.Delete the views  “v_ clerk” and “v_count”
DROP VIEW v_clerk;
DROP VIEW v_count;

--7.Create view that will display the emp# and emp last name who works on deptNumber is ‘d2’
CREATE OR ALTER VIEW v_employee_from_d2 AS
SELECT EmpNo, EmpLname
FROM HR.Employee
WHERE DeptNo = 2;

SELECT * FROM v_employee_from_d2;

--8.Display the employee  lastname that contains letter “J” (Use the previous view created in Q#7)
SELECT EmpLname
FROM v_employee_from_d2
WHERE EmpLname LIKE '%J%'

--9.Create view named “v_dept” that will display the department# and department name
CREATE OR ALTER VIEW v_dept AS
SELECT DeptNo, DeptName
FROM Company.Department

SELECT * FROM v_dept

--10.using the previous view try enter new department data where dept# is ’d4’ and dept name is ‘Development’
INSERT INTO v_dept VALUES (4,'Development')


--11.Create view name “v_2006_check” that will display employee Number, the project Number where he works and the date of joining the project which must be from the first of January and the last of December 2006.this view will be used to insert data so make sure that the coming new data must match the condition
CREATE OR ALTER VIEW v_2006_check AS
SELECT EmpNo, ProjectNo, Enter_Date
FROM Works_on
WHERE Enter_Date BETWEEN '2006-01-01' AND '2006-12-31'
WITH CHECK OPTION;

-- Test
INSERT INTO v_2006_check VALUES (22222,1,'2005-01-01'); -- fails

--============================================ Part 02 ============================================

--1.Create a stored procedure to show the number of students per department.[use ITI DB] 
CREATE OR ALTER PROCEDURE SpNumOfStudentsPerDepartment @Dept INT AS
SELECT COUNT(*) AS NumStudents
FROM Student
WHERE Dept_Id = @Dept

EXEC SpNumOfStudentsPerDepartment 40;

--2.Create a stored procedure that will check for the Number of employees in the project 100 if they are more than 3 print message to the user “'The number of employees in the project 100 is 3 or more'” if they are less display a message to the user “'The following employees work for the project 100'” in addition to the first name and last name of each one. [MyCompany DB] 
CREATE OR ALTER PROCEDURE SpCheckEmployeesInProject100 AS
BEGIN
    IF (SELECT COUNT(*) 
        FROM Employee e JOIN Works_for w ON e.SSN = w.ESSn
        WHERE w.Pno = 100) >= 3
        PRINT 'The number of employees in project 100 is 3 or more'
    ELSE
    BEGIN
        PRINT 'The following employees work for project 100:'
        SELECT e.Fname, e.Lname
        FROM Employee e JOIN Works_for w ON e.SSN = w.ESSn
        WHERE w.Pno = 100;
    END
END;

EXEC SpCheckEmployeesInProject100



--3.Create a stored procedure that will be used in case an old employee has left the project and a new one becomes his replacement. The procedure should take 3 parameters (old Emp. number, new Emp. number and the project number) and it will be used to update works_on table. [MyCompany DB]

CREATE OR ALTER PROCEDURE SpReplaceEmployeeInProject
    @oldEmp INT, @newEmp INT, @proj INT AS
BEGIN
    DELETE FROM Works_for
    WHERE Essn = @oldEmp AND Pno = @proj

    INSERT INTO Works_for VALUES (@newEmp, @proj)
END;

EXEC SpReplaceEmployeeInProject 521634, 968574, 500


--============================================ Part 03============================================

--1. Create a stored procedure that calculates the sum of a given range of numbers
CREATE OR ALTER PROCEDURE SpRangeOfNumbersSum @Start INT, @End INT AS
BEGIN
    DECLARE @Sum INT = 0, @i INT = @Start
    WHILE @i <= @End
    BEGIN
        SET @Sum += @i
        SET @i += 1
    END
    PRINT @Sum;
END;

EXEC SpRangeOfNumbersSum 1, 10



--2. Create a stored procedure that calculates the area of a circle given its radius
CREATE OR ALTER PROCEDURE SpCalcCircleArea @r FLOAT AS
PRINT (3.14 * @r * @r);

EXEC SpCalcCircleArea 2


--3. Create a stored procedure that calculates the age category based on a person's age ( Note: IF Age < 18 then Category is Child and if  Age >= 18 AND Age < 60 then Category is Adult otherwise  Category is Senior)
CREATE OR ALTER PROCEDURE SpPersonCategory @age INT AS
BEGIN
    IF @age < 18 PRINT 'Child';
    ELSE IF @age < 60 PRINT 'Adult';
    ELSE PRINT 'Senior'
END;

EXEC SpPersonCategory 59

--4. Create a stored procedure that determines the maximum, minimum, and average of a given set of numbers ( Note : set of numbers as Numbers = '5, 10, 15, 20, 25')
CREATE OR ALTER PROCEDURE SpCalcMaxMinAvg @numbers VARCHAR(MAX) AS
BEGIN
    ;WITH CTE AS (
        SELECT CAST(value AS INT) AS num
        FROM STRING_SPLIT(@numbers, ',')
    )
    SELECT MAX(num) AS MaxVal, MIN(num) AS MinVal, AVG(num*1.0) AS AvgVal
    FROM CTE
END

EXEC SpCalcMaxMinAvg '5,10,15,20,25'