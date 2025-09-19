--============================================ Part 01 (Views) ============================================
--****Restore ITI Database and then:****
--****Note : # means number and for example d2 means department which has id or number 2****
--1.Create a view that displays the student's full name, course name if the student has a grade more than 50. 
--2.Create an Encrypted view that displays manager names and the topics they teach. 
--3.Create a view that will display Instructor Name, Department Name for the ‘SD’ or ‘Java’ Department “use Schema binding” and describe what is the meaning of Schema Binding
--4.Create a view “V1” that displays student data for students who live in Alex or Cairo. 

/*Note: Prevent the users to run the following query 
Update V1 set st_address=’tanta’
Where st_address=’alex’;
0.	Create a view that will display the project name and the number of employees working on it. (Use Company DB)
*/
--****use IKEA_Company_DB:****

--1.Create a view named “v_clerk” that will display employee Number, project Number, the date of hiring of all the jobs of the type 'Clerk'.
--2. Create view named  “v_without_budget” that will display all the projects data without budget
--3.Create view named  “v_count “ that will display the project name and the Number of jobs in it
--4.Create a view named” v_project_p2” that will display the emp# s for the project# ‘p2’. (use the previously created view  “v_clerk”)
--5.modify the view named “v_without_budget” to display all DATA in project p1 and p2.
--6.Delete the views  “v_ clerk” and “v_count”
--7.Create view that will display the emp# and emp last name who works on deptNumber is ‘d2’
--8.Display the employee  lastname that contains letter “J” (Use the previous view created in Q#7)
--9.Create view named “v_dept” that will display the department# and department name
--10.using the previous view try enter new department data where dept# is ’d4’ and dept name is ‘Development’
--11.Create view name “v_2006_check” that will display employee Number, the project Number where he works and the date of joining the project which must be from the first of January and the last of December 2006.this view will be used to insert data so make sure that the coming new data must match the condition

--============================================ Part 02 ============================================

--1.Create a stored procedure to show the number of students per department.[use ITI DB] 

--2.Create a stored procedure that will check for the Number of employees in the project 100 if they are more than 3 print message to the user “'The number of employees in the project 100 is 3 or more'” if they are less display a message to the user “'The following employees work for the project 100'” in addition to the first name and last name of each one. [MyCompany DB] 


--3.Create a stored procedure that will be used in case an old employee has left the project and a new one becomes his replacement. The procedure should take 3 parameters (old Emp. number, new Emp. number and the project number) and it will be used to update works_on table. [MyCompany DB]


--============================================ Part 03============================================

--1. Create a stored procedure that calculates the sum of a given range of numbers

--2. Create a stored procedure that calculates the area of a circle given its radius

--3. Create a stored procedure that calculates the age category based on a person's age ( Note: IF Age < 18 then Category is Child and if  Age >= 18 AND Age < 60 then Category is Adult otherwise  Category is Senior)

--4. Create a stored procedure that determines the maximum, minimum, and average of a given set of numbers ( Note : set of numbers as Numbers = '5, 10, 15, 20, 25')