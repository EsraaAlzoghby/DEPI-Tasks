--============================================ Part 01 ============================================
--****Restore ITI Database and then:****

--1. Select max two salaries in the instructor table. 
SELECT TOP 2 Salary
FROM Instructor
WHERE Salary IS NOT NULL
ORDER BY Salary DESC;

--2. Write a query to select the highest two salaries in Each Department for instructors who have salaries. “using one of Ranking Functions”
SELECT *
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY Dept_Id ORDER BY Salary DESC) AS rnk
    FROM Instructor
    WHERE Salary IS NOT NULL
) AS ranked
WHERE rnk <= 2;


--3. Write a query to select a random  student from each department.  “using one of Ranking Functions”
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY Dept_ID ORDER BY NEWID()) AS rn
    FROM Student
) AS s
WHERE rn = 1;

--============================================ Part 02 ============================================
--****Restore adventureworks2012 Database and then:****

--1. Display the SalesOrderID, ShipDate of the SalesOrderHearder table (Sales schema) to designate SalesOrders that occurred within the period ‘7/28/2002’ and ‘7/29/2014’
SELECT SalesOrderID, ShipDate
FROM Sales.SalesOrderHeader
WHERE ShipDate BETWEEN '2002-07-28' AND '2014-07-29'

--2. Display only Products(Production schema) with a StandardCost below $110.00 (show ProductID, Name only)
SELECT ProductID, Name
FROM Production.Product
WHERE StandardCost < 110

--3. Display ProductID, Name if its weight is unknown
SELECT ProductID, Name
FROM Production.Product
WHERE Weight IS NULL

--4. Display all Products with a Silver, Black, or Red Color
SELECT *
FROM Production.Product
WHERE Color IN ('Silver', 'Black', 'Red')


--5. Display any Product with a Name starting with the letter B
SELECT *
FROM Production.Product
WHERE Name LIKE 'B%'

--6. Run the following Query
--Then write a query that displays any Product description with underscore value in its description.

UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3
SELECT *
FROM Production.ProductDescription
WHERE Description LIKE '%[_]%';


--7. Display the Employees HireDate (note no repeated values are allowed)
SELECT DISTINCT HireDate
FROM HumanResources.Employee;

--8. Display the Product Name and its ListPrice within the values of 100 and 120 the list should have the following format "The [product name] is only! [List price]" (the list will be sorted according to its ListPrice value)
SELECT CONCAT('The ', Name, ' is only! ', ListPrice, '.')
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 120
ORDER BY ListPrice;