--============================================ Part 01 ============================================
--****Restore ITI Database and then:****

--1)From The Previous Assignment insert at least 2 rows per table. 
select * from Instructor
insert into Instructor values (16 , 'esraa' , 'master' , 88.8888 , 10 )
insert into Instructor values (17, 'ahmed' , null , 99.9999 , 70 )

select * from Course
insert into Course values (1800, 'c++' ,60 , 5 ) , (2000, 'java' ,100 , 4 )

select * from Department
insert into Department values (80 , null , 'network','giza', null , '2025-06-16' ) ,
(90 , null , 'it','alex', null , '2020-07-17' )

select * from Topic
insert into Topic values (6, 'ui/ux') , (7, 'testing')
select * from Ins_Course

insert into Ins_Course values (16 , 1800 , 'good') , (17 ,2000,'vgood')

select * from Student
insert into Student values (80 , 'esraa' , null,'giza', 24 , 20, 16 ) ,
(90 , 'amal' , 'ahmed','alex', 20,60,3)

select * from Stud_Course
insert into Stud_Course values (1800 , 80 , 70) , (2000,90 ,100)

--2)Data Manipulation Language:

--A.Insert your personal data to the student table as a new Student in department number 30.
insert into Student values (100 , 'esraa' ,'mohammed','giza', 24 , 30, null )

--B.Insert Instructor with personal data of your friend as new Instructor in department number 30, Salary= 4000, but don’t enter any value for bonus.
insert into Instructor values (20 , 'amgad' ,'PHD',4000, 30)

--C.Upgrade Instructor salary by 20 % of its last value.
update Instructor set Salary =Salary +(Salary*0.20)
where [Ins_Id] =20

--============================================ Part 02 ============================================
--****Restore MyCompany Database and then:****
--****Try to create the following Queries:****

--1.Display all the employees Data.
select*from Employee

--2.Display the employee First name, last name, Salary and Department number.
select Fname, Lname , Salary , Dno from Employee

--3.Display all the projects names, locations and the department which is responsible for it.
select Pname, Plocation,Dnum from Project

--4.If you know that the company policy is to pay an annual commission for each employee with specific percent equals 10% of his/her annual salary .Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
select Fname + ' ' + Lname as fullName , (Salary*12)*0.10 as 'ANNUAL COMM' from Employee

--5.Display the employees Id, name who earns more than 1000 LE monthly.
select SSN ,Fname + ' ' + Lname as fullName from Employee
where Salary > 1000

--6.Display the employees Id, name who earns more than 10000 LE annually.
select SSN ,Fname + ' ' + Lname as fullName from Employee
where Salary *12 > 10000

--7.Display the names and salaries of the female employees 
select Fname + ' ' + Lname as fullName , Salary from Employee
where [Sex] = 'f'

--8.Display each department id, name which is managed by a manager with id equals 968574.
select Dnum , Dname  from Departments 
where [MGRSSN] = 968574

--9.Display the ids, names and locations of  the projects which are controlled with department 10.
select *from Project
select Pnumber, Pname , Plocation from Project
where [Dnum] = 10
--============================================ Part 03 ============================================
--****Restore ITI Database and then:****
--1.Get all instructors Names without repetition
use ITI
select distinct Ins_Name from Instructor

--2.Display instructor Name and Department Name 
   --Note: display all the instructors if they are attached to a department or not
SELECT Ins_Name, Dept_Name 
FROM Instructor
LEFT JOIN Department ON Instructor.Dept_Id = Department.Dept_Id;

-- 3. Display student full name and the name of the course he is taking For only courses which have a grade  
SELECT St_Fname + ' ' + St_Lname 'Full Name', Crs_Name 'Course Name'
FROM Student
JOIN Stud_Course ON Student.St_Id = Stud_Course.St_Id
JOIN Course ON Course.Crs_Id = Stud_Course.Crs_Id;
-- ======================= Bouns =======================
/* @@AnyExpression?
1. @@AnyExpression is not a real SQL command.
2. Any system function or variable in SQL Server that starts with @@.
3. @@ is a global system function or variable
*/
SELECT @@VERSION;
SELECT @@SERVERNAME;
--============================================ Part 04 ============================================
--****Using MyCompany Database and try to  create the following Queries:****

--1.Display the Department id, name and id and the name of its manager.
SELECT Dept.Dnum, Dept.Dname, MGRSSN, Emp.Fname + ' ' + Emp.Lname 'Manager Name' 
FROM Departments As Dept
JOIN Employee AS Emp ON Dept.MGRSSN = Emp.SSN;

--2.Display the name of the departments and the name of the projects under its control.
SELECT D.Dname 'Departement', P.Pname 'Project'
FROM Departments AS D
Join Project AS P ON D.Dnum = P.Dnum;

--3.Display the full data about all the dependence associated with the name of the employee they depend on .
SELECT E.Fname + ' ' + E.Lname 'Employee Name', D.Dependent_name, D.Sex, D.Bdate
FROM Employee E
JOIN Dependent D ON E.SSN = D.ESSN;

--4.Display the Id, name and location of the projects in Cairo or Alex city.
SELECT Pnumber, Pname, Plocation
FROM Project
WHERE City ='Cairo' or City ='Alex';

--5.Display the Projects full data of the projects with a name starting with "a" letter.
SELECT * FROM Project
WHERE Pname LIKE 'a%';
--6.display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
SELECT * FROM Employee
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000; 

--7.Retrieve the names of all employees in department 10 who work more than or equal 10 hours per week on the "AL Rabwah" project.
SELECT E.Fname, E.Lname
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.Ssn = W.Essn
JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE E.Dno = 10
  AND P.Pname = 'AL Rabwah'
  AND W.Hours >= 10;

--8.Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
SELECT E.Fname, E.Lname, P.Pname
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.Ssn = W.Essn
JOIN PROJECT P ON W.Pno = P.Pnumber
ORDER BY P.Pname;

--9.For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate
SELECT 
    P.Pnumber,
    D.Dname AS Department_Name,
    M.Lname AS Manager_LastName,
    M.Address,
    M.Bdate
FROM PROJECT P
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
JOIN EMPLOYEE M ON D.Mgr_ssn = M.Ssn
WHERE P.Plocation = 'Cairo City';
