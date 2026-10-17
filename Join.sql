CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL
);


CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DepartmentID INT NULL, -- NULL = not assigned to a department
    ManagerID INT NULL,    -- NULL = top of the hierarchy

    CONSTRAINT FK_Emp_Dept
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID),

    CONSTRAINT FK_Emp_Manager
        FOREIGN KEY (ManagerID)
        REFERENCES Employees(EmployeeID)
);


INSERT INTO Departments (DepartmentName, Location) VALUES
('HR','Delhi'), ('IT','Bengaluru'), ('Finance','Mumbai'),
('Sales','Delhi'), ('Marketing','Pune'), ('Legal','Mumbai');

INSERT INTO Employees
(FirstName, LastName, Email, HireDate, Salary, DepartmentID, ManagerID) VALUES
('Amit','Verma','amit.verma@company.com','2015-01-10',250000,NULL,NULL),
('Priya','Singh','priya.singh@company.com','2016-03-15',120000,2,1),
('Rahul','Mehta','rahul.mehta@company.com','2018-07-01',85000,2,2),
('Sneha','Iyer','sneha.iyer@company.com','2020-02-20',78000,2,2),
('Vikram','Rao','vikram.rao@company.com','2016-09-05',95000,1,1),
('Anjali','Nair','anjali.nair@company.com','2021-06-12',52000,1,5),
('Karan','Malhotra','karan.malhotra@company.com','2017-04-18',110000,3,1),
('Pooja','Desai','pooja.desai@company.com','2019-11-25',70000,3,7),
('Rohan','Gupta','rohan.gupta@company.com','2022-01-10',68000,3,7),
('Deepika','Joshi','deepika.joshi@company.com','2017-08-30',105000,4,1),
('Arjun','Reddy','arjun.reddy@company.com','2019-05-14',60000,4,10),
('Meera','Pillai','meera.pillai@company.com','2021-09-09',58000,4,10),
('Sanjay','Kumar','sanjay.kumar@company.com','2023-03-01',55000,4,10),
('Kavita','Menon','kavita.menon@company.com','2018-12-03',90000,5,1),
('Neha','Kapoor','neha.kapoor@company.com','2024-07-15',45000,NULL,2);



-- Q1. Display the first name, last name and department name of all employees who belong to a department.

SELECT FirstName, LastName, DepartmentName from Employees as e 
INNER JOIN Departments as d
ON e.departmentID = d.departmentID;

-- Q2. Display employee full name (FirstName + LastName as one column), department name and
-- department location.

SELECT CONCAT(e.FirstName,' ',e.LastName) as full_name, d.departmentName, d.Location from Employees as e
INNER JOIN Departments as d
ON e.departmentID = d.departmentID;


-- Q3. List all employees working in the 'IT' department with their salary.
SELECT  CONCAT(e.FirstName,' ',e.LastName) as full_name, e.salary,d.departmentName from Employees as e 
INNER JOIN Departments as d
ON e.departmentID = d.departmentID
where d.departmentName = 'IT';


SELECT  concat(e.FirstName,' ',e.LastName) as full_name, e.salary,d.departmentName from Employees as e 
INNER JOIN Departments as d
ON e.departmentID = d.departmentID
where d.departmentName = 'IT';

-- Q4. List employees whose department is located in 'Mumbai'.

SELECT  * from Employees as e 
INNER JOIN Departments as d
ON e.departmentID = d.departmentID
where d.Location = 'Mumbai';

SELECT  * from Employees as e 
INNER JOIN Departments as d
ON e.departmentID = d.departmentID;

-- Q5. Display employees from the Sales department earning more than 56,000, sorted by salary (highest
-- first).

SELECT  * from Employees as e 
INNER JOIN Departments as d
ON e.departmentID = d.departmentID
where d.departmentName = 'Sales' and e.salary > 56000
ORDER BY e.salary DESC
LIMIT 1;


-- Q6. Display ALL employees along with their department name. Employees without a department should
-- show NULL.
SELECT  e.*, d.DepartmentName from Employees as e 
Left JOIN Departments as d
ON e.departmentID = d.departmentID;
-- where d.departmentName is Null;


-- Q7. Find the employees who are NOT assigned to any department.
SELECT * from Employees as e
LEFT JOIN Departments as d 
ON e.departmentID = d.departmentID
where e.departmentID is NULL;

-- Q8. Display all employees; show 'Unassigned' instead of NULL for department name.

SELECT e.firstName, COALESCE(d.DepartmentName, 'Unassigned') AS DepartmentName from Employees as e 
LEFT JOIN Departments as d 
ON e.departmentID = d.departmentID
WHERE d.departmentName is Null;


-- Q9. Display ALL departments with their employees' names. Departments without employees should still appear.
SELECT * From Employees as e
RIGHT JOIN Departments as d 
ON d.departmentId = e.departmentId;

-- Q10. Find the departments that have no employees.
SELECT m.departmentName from employees as e 
right JOIN Departments as m 
on e.departmentID = m.departmentID
where e.departmentID is NULL;

-- or 

SELECT m.departmentName
FROM Departments AS m
LEFT JOIN employees AS e
    ON m.departmentID = e.departmentID
WHERE e.departmentID IS NULL;

-- or

SELECT *
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.departmentId = d.departmentId
);


SELECT * from employees m 
where  EXISTS
(SELECT 1
   FROM employees e
   WHERE e.departmentId = m.managerID)



