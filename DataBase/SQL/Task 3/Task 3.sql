--============================================ Part 01 ============================================
--****Restore ITI Database and then:****

--1.Retrieve a number of students who have a value in their age. 
--2.Display number of courses for each topic name 
--3.Select Student first name and the data of his supervisor 
--4.Display student with the following Format (use isNull function)
--Student ID Student Full Name Department name.
--5.Select instructor name and his salary but if there is no salary display value ‘0000’ . “use one of Null Function” 
--6.Select Supervisor first name and the count of students who supervises on them.
--7.Display max and min salary for instructors.
--8.Select Average Salary for instructors .
--9.Display instructors who have salaries less than the average salary of all instructors.
--10.Display the Department name that contains the instructor who receives the minimum salary.

--============================================ Part 02 ============================================
--****Restore MyCompany DB Database and then:****
--**DQL:**

--1.For each project, list the project name and the total hours per week (for all employees) spent on that project.
--2.For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
--3.Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.
--4.Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30% 

--**DML:**

--1.In the department table insert a new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'.
--2.Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), and they give you(your SSN =102672) her position (Dept. 20 manager) 
--a.First try to update her record in the department table
--b.Update your record to be department 20 manager.
--c.Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
--3.Unfortunately the company ended the contract with  Mr.Kamel Mohamed (SSN=223344) so try to delete him from your database in case you know that you will be temporarily in his position.
--Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handles these cases).

--============================================ Part 03 ============================================
--****Using MyCompany Database and try to  create the following Queries:****

--1.Retrieve the names of all employees in department 10 who work more than or equal 10 hours per week on the "AL Rabwah" project.
--2.Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name
--3.For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
--4.Display the data of the department which has the smallest employee ID over all employees' ID.
--5.List the last name of all managers who have no dependents
--6.For each department-- if its average salary is less than the average salary of all employees display its number, name and number of its employees.
--7.Try to get the max 2 salaries using subquery