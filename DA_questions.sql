Use Mygrastech;
CREATE TABLE Employeemaster (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT,
    Sales DECIMAL(12,2),
    Joining_Date DATE
);
INSERT INTO Employeemaster
VALUES
(101, 'Rahul', 'IT', 'Delhi', 55000, 2, 120000, '2023-04-10'),
(102, 'Priya', 'HR', 'Noida', 48000, 3, 90000, '2022-07-15'),
(103, 'Amit', 'IT', 'Noida', 65000, 5, 180000, '2020-03-20'),
(104, 'Neha', 'Sales', 'Delhi', 45000, 2, 150000, '2023-01-12'),
(105, 'Rohit', 'Sales', 'Gurgaon', 52000, 4, 210000, '2021-09-05'),
(106, 'Sneha', 'HR', 'Delhi', 50000, 4, 110000, '2021-06-18'),
(107, 'Vikas', 'IT', 'Gurgaon', 72000, 7, 250000, '2018-11-25'),
(108, 'Anjali', 'Sales', 'Noida', 47000, 1, 130000, '2024-02-10'),
(109, 'Karan', 'IT', 'Delhi', 60000, 3, 160000, '2022-05-14'),
(110, 'Pooja', 'HR', 'Gurgaon', 55000, 6, 125000, '2019-08-30');

-- write a query to select employee name, salary, city, experiences, and use where condition where salary is greater than 60K;

SELECT Emp_Name, Salary, City, Experience
from Employeemaster
where salary > 60000 and Experience >2 ;


Select * From Employeemaster
where (Department = "IT" or Department = "Sales") and Salary>60000;


SELECT  DISTINCT city
from Employeemaster;


Select * From Employeemaster
order by Salary ASC;

Select * From Employeemaster
order by Salary DESC;

Select * From Employeemaster
order by Department ASC,Salary DESC;

Select Emp_Name, Salary From Employeemaster
ORDER BY Salary DESC;


SELECT Emp_Name, Salary 
FROM Employeemaster
ORDER BY salary DESC
LIMIT 1 OFFSET 4;

-- Find the unique combinations of Department and City.
select distinct Department, city From Employeemaster;

--  Display all unique salary values.
select distinct Salary From Employeemaster;

-- count total no. of Sales Department
select count(CASE WHEN Department = "Sales" Then 1 END) as total_SALES_Deparmtent From Employeemaster;
-- or 
SELECT count(*) from Employeemaster
where Department = "IT";

-- Display all unique experience values.
SELECT DISTINCT Experience from Employeemaster;

SELECT DISTINCT Experience from Employeemaster order by  Experience desc LIMIT 1 OFFSET 0 ;


-- 4. ORDER BY---------------------------------------------------------------------------------------------------------------------------------------------x
-- Q1. Display all employees ordered by salary from lowest to highest.

SELECT * from Employeemaster
order by salary asc;

-- Q2. Display all employees ordered by salary from highest to lowest.

SELECT * from Employeemaster
order by salary DESC;

-- Q3. Display Emp_Name and Sales ordered by Sales from highest to lowest.

select Emp_Name, Sales from Employeemaster
order by sales desc;

-- Q4. Display employees ordered by Department ascending and Salary descending within each department.
select * from Employeemaster
ORDER BY Department ASC, Salary desc;

SELECT department
FROM Employeemaster
GROUP BY department;


-- Q5. Display Emp_Name, Experience, and Salary ordered by Experience descending.

SELECT Emp_Name, Experience, Salary
FROM Employeemaster
ORDER BY Experience desc;


-- TOP
-- Q1. Display the top 5 employees from the table.
SELECT * from Employeemaster
LIMIT 5;

-- Q2. Find the top 3 highest-paid employees.

SELECT * from Employeemaster
ORDER BY Salary desc
LIMIT 3;

-- Q3. Find the top 5 employees based on Sales.
SELECT * from Employeemaster
ORDER BY Sales desc
LIMIT 5;

-- Q4. Find the top 3 employees with the highest experience.
SELECT * from Employeemaster
ORDER BY Experience desc
LIMIT 3;


-- Q5. Find the top 2 highest-paid employees from the IT department.

SELECT * from Employeemaster
WHERE Department = "IT"
ORDER BY Experience desc
LIMIT 2;


-- 6. GROUP BY----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q1. Count the number of employees in each department.

SELECT Department, Count(*) as No_of_Emp
from Employeemaster
GROUP BY Department;


-- Q2. Find the average salary for each department.

SELECT Department, AVG(Salary) as avg_salary
from Employeemaster
GROUP BY Department;


-- Q3. Find the total salary paid by each department.
SELECT Department, SUM(Salary) as total_Salary
from Employeemaster
GROUP BY Department;

-- Q4. Find the maximum salary in each department.
SELECT Department, Max(Salary) as Max_Salary
from Employeemaster
GROUP BY Department;
-- or   
SELECT e.* from Employeemaster  e 
join(
 SELECT Department, Max(Salary) as Max_Salary
from Employeemaster
GROUP BY Department 
) m
on e.Department = m.Department
AND e.Salary = m.Max_Salary;


-- Q5. Find the minimum salary in each city.
SELECT city, min(Salary) as Min_Salary from Employeemaster
group by city;
-- or
SELECT e.* from Employeemaster as e
join(SELECT city, min(Salary) as Min_Salary from Employeemaster
group by city) as temp
on e.city = temp.city
and e.Salary = temp.Min_Salary;


-- 7. HAVING
-- Q1. Find departments whose average salary is greater than 50,000.
Select Department, AVG(Salary) as avg_salary
From Employeemaster
GROUP by Department
HAVING avg_salary > 50000;

-- Q2. Find departments having more than 2 employees.
Select Department, count(*) as emp_count
From Employeemaster
GROUP by Department
Having emp_count > 2;


-- Q3. Find departments whose total salary is greater than 150,000.
Select Department, SUM(Salary) as total_Salary
From Employeemaster
GROUP BY Department
HAVING total_Salary > 150000;

Select Department
From Employeemaster
GROUP BY Department
HAVING SUM(Salary) > 150000;

-- Q4. Find cities having more than 2 employees.
Select City, count(*) as city_emp
From Employeemaster
GROUP BY City
HAVING city_emp > 2;

Select City
From Employeemaster
GROUP BY City
HAVING count(*) > 2;

-- Q5. Find departments whose maximum salary is greater than 60,000.

Select Department, max(Salary) as max_salary
From Employeemaster
GROUP BY Department
HAVING max_salary > 60000;


-- 8. Aggregate Functions
-- Q1. Find the total salary of all employees using SUM().
select sum(salary) from Employeemaster;

-- Q2. Find the average salary of all employees using AVG().
select AVG(salary) from Employeemaster;

-- Q3. Find the highest salary using MAX().
select MAX(salary) from Employeemaster;

-- Q4. Find the lowest salary using MIN().
select MIN(salary) from Employeemaster;

-- Q5. Count the total number of employees using COUNT().
select Count(*) from Employeemaster;




-- 9. Combined Real-World Queries
-- Q1. As an HR analyst, find the top 3 highest-paid employees in the company.
select Emp_Name from Employeemaster 
ORDER BY Salary DESC
LIMIT 3;

-- Q2. Find the average salary department-wise and show only departments where the average exceeds
-- 50,000.
select department
from Employeemaster
GROUP by Department
Having AVG(Salary) > 50000;

-- Q3. Find the total sales generated by each department and display departments with total sales above
-- 300,000.
SELECT Department, sum(Sales) as total_sale
from Employeemaster
group by Department
Having total_sale > 300000;

-- Q4. Find the number of employees in each city and show only cities having at least 3 employees.
select City
From Employeemaster
group by City
having count(*)>= 3;

-- Q5. Find the highest-paid employee from each department using GROUP BY with an appropriate aggregate
-- query.
select e.Emp_Name, e.Department, e.Salary from Employeemaster as e
join(select Department, MAX(Salary) as max_salary
From Employeemaster
Group By Department) as m 
on e.Department = m.Department
and e.Salary = m.max_salary
ORDER BY m.max_salary desc;

-- Q6. Find the department with the highest total sales.
SELECT Department, sum(Sales) as high_sale
from Employeemaster
GROUP by Department
ORDER BY high_sale desc LIMIT 1;

-- or

SELECT e.Department, e.high_sale
FROM (select Department, sum(Sales) as high_sale from Employeemaster group by Department) as e
where e.high_sale >= All(select sum(Sales) from Employeemaster GROUP by Department );

-- or

SELECT Department
FROM Employeemaster
GROUP BY Department
HAVING SUM(Sales) >= ALL (
    SELECT SUM(Sales)
    FROM Employeemaster
    GROUP BY Department
);



-- Q7. Find the average experience of employees in each department, sorted from highest to lowest average
-- experience.
    SELECT Department, avg(Experience) as Avg_Exp
    From Employeemaster
    group by Department
    ORDER BY Avg_Exp desc;



-- Q8. Find the top 2 employees by Sales from the Sales department.
SELECT *  From Employeemaster
where Department = "Sales"
ORDER BY Sales DESC
LIMIT 2;
  

-- Q9. Find the total salary and average salary for each department in one query.
SELECT Department, sum(Salary), avg(Salary) 
from Employeemaster
GROUP BY Department;


-- Q10. Find departments where the employee count is greater than 2 and average salary is above 50,000.

SELECT Department, count(*) as total_Emp, avg(Salary) as avg_Salary
from Employeemaster
GROUP BY Department
Having total_Emp > 2 and avg_Salary > 50000;

