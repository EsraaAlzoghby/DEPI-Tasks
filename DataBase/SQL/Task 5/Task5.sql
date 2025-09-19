--============================================ Part 01 ============================================
--****Restore ITI Database and then:****
--1.Create a multi-statements table-valued function that takes 2 integers and returns the values between them.
GO
CREATE FUNCTION GetValuesBetweenNumbers(@num1 INT, @num2 INT)
RETURNS @t TABLE (val INT)
AS
BEGIN
    DECLARE @i INT = @num1;
    WHILE @i <= @num2
    BEGIN
        INSERT INTO @t VALUES(@i);
        SET @i += 1;
    END
    RETURN;
END
GO
SELECT * FROM dbo.GetValuesBetweenNumbers(1,10);
--2.Create a table-valued function that takes Student No and returns Department Name with Student full name.
GO
CREATE FUNCTION GetDepartmentAndStudentNameByStudentNumber(@Std_no INT)
RETURNS TABLE
AS
RETURN
(
	SELECT d.Dept_Name, CONCAT_WS(' ', s.St_Fname, s.St_Lname) AS [Student Full Name]
	FROM Student s
	JOIN Department d ON d.Dept_Id = s.Dept_Id
	WHERE s.St_Id = @Std_no
);
GO
SELECT * FROM dbo.GetDepartmentAndStudentNameByStudentNumber(1);
--3.Create a function that takes an integer which represents the format of the Manager hiring date and displays department name, Manager Name and hiring date with this format.   
GO
CREATE FUNCTION DisplayManager(@format INT)
RETURNS TABLE 
AS
RETURN
(
	SELECT d.Dept_Name, i.Ins_Name AS [Manager Name],
	       CONVERT(VARCHAR(50), d.Manager_hiredate, @format) AS [Manager hiredate]
	FROM Instructor i
	JOIN Department d ON i.Ins_Id = d.Dept_Manager
);
GO
SELECT * FROM dbo.DisplayManager(103);
--4.Create multi-statement table-valued function that takes a string
--a.If string='first name' returns student first name
--b.If string='last name' returns student last name 
--c.If string='full name' returns Full Name from student table  
--**Note: Use “ISNULL” function**
GO
CREATE OR ALTER FUNCTION GetStudentNameByFormat(@format VARCHAR(50))
RETURNS @data TABLE (Name VARCHAR(100))
AS
BEGIN
	IF @format = 'first'
		INSERT INTO @data
		SELECT ISNULL(St_Fname, ' ') FROM Student;
	ELSE IF @format = 'last'
		INSERT INTO @data
		SELECT ISNULL(St_Lname, ' ') FROM Student;
	ELSE IF @format = 'full'
		INSERT INTO @data
		SELECT ISNULL(CONCAT_WS(' ', St_Fname, St_Lname), ' ') FROM Student;
	RETURN;
END
GO
SELECT * FROM dbo.GetStudentNameByFormat('first');
SELECT * FROM dbo.GetStudentNameByFormat('last');
SELECT * FROM dbo.GetStudentNameByFormat('full');
--5.Create function that takes project number and display all employees in this project (Use MyCompany DB)
GO
CREATE FUNCTION GetEmployeesByProjectNumber(@proj_num INT)
RETURNS TABLE
AS
RETURN
(
	SELECT e.SSN, e.Fname, e.Lname, e.Sex, e.Salary
	FROM Employee e
	JOIN Works_for wf ON e.SSN = wf.ESSn
	WHERE wf.Pno = @proj_num
);
GO
SELECT * FROM dbo.GetEmployeesByProjectNumber(100);
--6.Create a scalar function that takes a date and returns the Month name of that date.
GO
CREATE FUNCTION GetDateMonth(@date DATE)
RETURNS VARCHAR(20)
AS
BEGIN 
	RETURN DATENAME(MONTH, @date);
END
GO
SELECT dbo.GetDateMonth(GETDATE());
--7.Create a function that takes Student Id and returns his age.
GO
CREATE FUNCTION GetStudentAge(@Std_Id INT)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SELECT @Age = DATEDIFF(YEAR, St_BirthDate, GETDATE())
    FROM Student
    WHERE St_Id = @Std_Id;
    RETURN @Age;
END
GO
SELECT dbo.GetStudentAge(1);
--8.Create a function that takes Instructor Id and returns Department Name.
GO
CREATE FUNCTION GetInstructorDeptName(@Ins_Id INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @DeptName VARCHAR(50);
    SELECT @DeptName = D.Dept_Name
    FROM Instructor I
    JOIN Department D ON I.Dept_Id = D.Dept_Id
    WHERE I.Ins_Id = @Ins_Id;
    RETURN @DeptName;
END
GO
SELECT dbo.GetInstructorDeptName(2);
--9.Create a scalar function that takes Student ID and returns a message to user 
--a.If first name and Last name are null then display 'First name & last name are null'
--b.If First name is null then display 'first name is null'
--c.If Last name is null then display 'last name is null'
--d.Else display 'First name & last name are not null'
GO
CREATE FUNCTION ReturnMessageToUser(@St_id INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @fname VARCHAR(20)
    DECLARE @lname VARCHAR(20)
    SELECT @fname=St_Fname, @lname=St_Lname 
    FROM Student
    WHERE St_Id = @St_id

    IF @fname IS NULL AND @lname IS NULL
        RETURN 'First name & last name are null'
    ELSE IF @fname IS NULL 
        RETURN 'first name is null'
    ELSE IF @lname IS NULL 
        RETURN 'last name is null'
    ELSE 
        RETURN 'First name & last name are not null'
END
GO
SELECT dbo.ReturnMessageToUser(10);
--10.Create a function that takes Department Id and returns count of students in it.   
GO
CREATE FUNCTION GetDeptStudentCount(@Dept_Id INT)
RETURNS INT
AS
BEGIN
    DECLARE @Cnt INT;
    SELECT @Cnt = COUNT(*)
    FROM Student
    WHERE Dept_Id = @Dept_Id;
    RETURN @Cnt;
END
GO
SELECT dbo.GetDeptStudentCount(10);
--11.Create function that takes 2 dates and returns difference in days.
GO
CREATE FUNCTION GetDaysDiff(@d1 DATE, @d2 DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, @d1, @d2);
END
GO
SELECT dbo.GetDaysDiff('2023-01-01', GETDATE());
--12.Create function that returns the most popular course (with highest number of students).
GO
CREATE FUNCTION GetMostPopularCourse()
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @CrsName VARCHAR(50);
    SELECT TOP 1 @CrsName = C.Crs_Name
    FROM Stud_Course SC
    JOIN Course C ON SC.Crs_Id = C.Crs_Id
    GROUP BY C.Crs_Name
    ORDER BY COUNT(SC.St_Id) DESC;
    RETURN @CrsName;
END
GO
SELECT dbo.GetMostPopularCourse();
