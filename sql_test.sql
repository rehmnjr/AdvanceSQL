-- 1. Create an employees table with emp_id as PRIMARY KEY, name as NOT NULL, and email as
-- UNIQUE.
-- 2. Add a FOREIGN KEY on employees.dept_id that references departments.dept_id.
-- 3. Create a table where salary must be greater than 0 (CHECK) and status defaults to 'Active'
-- (DEFAULT).
-- 4. What happens if you insert a duplicate value into a PRIMARY KEY column? Write a query to
-- demonstrate it.

Drop DATABASE sql_test;
create DATABASE sql_test;
use sql_test;


CREATE TABLE Employes(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    emp_mail VARCHAR(100) UNIQUE,
    dept_id int,
    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);


CREATE TABLE Salary(
    emp_id INT,
    emp_salary DECIMAL(10, 2) CHECK (emp_salary > 0),
    department VARCHAR(100) UNIQUE,
    status VARCHAR(20) DEFAULT 'Active'
);

INSERT into Employes(emp_id,emp_name,emp_mail,dept_id)
VALUES
    (1,"Fahim","fahim@gmail.com",2),
    (2,"Aman","fahim@gmail.com",1),
    (3,"Kamal","fahim@gmail.com",1),
    (1,"Pawan","fahim@gmail.com",3);




-- 2 start

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    email VARCHAR(150)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'Engineering', 'Noida'),
(2, 'Human Resources', 'Delhi'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Bangalore'),
(5, 'Sales', 'Pune'),
(6, 'IT Support', 'Hyderabad'),
(7, 'Operations', 'Gurgaon'),
(8, 'Research', 'Chennai'),
(9, 'Legal', 'Delhi'),
(10, 'Product', 'Bangalore'),
(11, 'Customer Support', 'Noida'),
(12, 'Administration', 'Mumbai'),
(13, 'Security', 'Hyderabad'),
(14, 'Data Analytics', 'Pune'),
(15, 'Quality Assurance', 'Chennai');



SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO employees 
(emp_id, name, dept_id, salary, hire_date, manager_id) VALUES
(1, 'Rahul Sharma', 1, 95000, '2021-03-15', NULL),
(2, 'Priya Singh', 2, 75000, '2022-06-10', NULL),
(3, 'Amit Verma', 3, 85000, '2020-08-20', NULL),
(4, 'Neha Gupta', 4, 78000, '2021-11-05', NULL),
(5, 'Rohit Mehta', 5, 82000, '2019-04-18', NULL),

(6, 'Ankit Kumar', 1, 65000, '2023-01-12', 1),
(7, 'Sneha Kapoor', 2, 55000, '2023-03-22', 2),
(8, 'Vikas Yadav', 3, 60000, '2022-09-14', 3),
(9, 'Pooja Malhotra', 4, 58000, '2023-07-19', 4),
(10, 'Karan Joshi', 5, 62000, '2022-12-01', 5),

(11, 'Arjun Patel', 6, 52000, '2024-01-15', 1),
(12, 'Simran Kaur', 7, 57000, '2023-10-10', 5),
(13, 'Manish Agarwal', 8, 68000, '2021-05-25', 1),
(14, 'Riya Sinha', 14, 72000, '2022-02-17', 3),
(15, 'Deepak Mishra', 15, 59000, '2024-04-08', 4);


INSERT INTO customers 
(customer_id, name, city, email) VALUES

(1, 'Aarav Sharma', 'Delhi', 'aarav@gmail.com'),
(2, 'Ishita Verma', 'Noida', 'ishita@gmail.com'),
(3, 'Aditya Singh', 'Mumbai', 'aditya@gmail.com'),
(4, 'Ananya Gupta', 'Pune', 'ananya@gmail.com'),
(5, 'Rohan Kapoor', 'Bangalore', 'rohan@gmail.com'),
(6, 'Meera Joshi', 'Chennai', 'meera@gmail.com'),
(7, 'Kabir Malhotra', 'Hyderabad', 'kabir@gmail.com'),
(8, 'Diya Patel', 'Ahmedabad', 'diya@gmail.com'),
(9, 'Arnav Kumar', 'Gurgaon', 'arnav@gmail.com'),
(10, 'Tanya Agarwal', 'Kolkata', 'tanya@gmail.com'),
(11, 'Yash Mehta', 'Jaipur', 'yash@gmail.com'),
(12, 'Sara Khan', 'Lucknow', 'sara@gmail.com'),
(13, 'Dev Mishra', 'Noida', 'dev@gmail.com'),
(14, 'Nisha Roy', 'Mumbai', 'nisha@gmail.com'),
(15, 'Varun Shah', 'Pune', 'varun@gmail.com');


INSERT INTO orders 
(order_id, customer_id, order_date, amount, status) VALUES

(101, 1, '2026-01-05', 2500.00, 'Delivered'),
(102, 2, '2026-01-08', 4500.00, 'Delivered'),
(103, 3, '2026-01-12', 1800.00, 'Pending'),
(104, 4, '2026-01-15', 7200.00, 'Shipped'),
(105, 5, '2026-01-20', 3200.00, 'Delivered'),

(106, 6, '2026-02-02', 5600.00, 'Cancelled'),
(107, 7, '2026-02-07', 2100.00, 'Delivered'),
(108, 8, '2026-02-11', 8900.00, 'Shipped'),
(109, 9, '2026-02-18', 1500.00, 'Pending'),
(110, 10, '2026-02-25', 4300.00, 'Delivered'),

(111, 11, '2026-03-03', 6700.00, 'Shipped'),
(112, 12, '2026-03-09', 2900.00, 'Delivered'),
(113, 13, '2026-03-15', 5100.00, 'Pending'),
(114, 14, '2026-03-22', 7600.00, 'Delivered'),
(115, 15, '2026-03-28', 3400.00, 'Cancelled');


-- 5. Find the total number of employees.
-- 6. Find the highest, lowest, and average salary in the company.
-- 7. Calculate the total sales amount from the orders table.
-- 8. Count the number of orders placed by each customer (GROUP BY).
-- 9. Show departments whose average salary is greater than 50,000 (HAVING).


SELECT count(*) total_Emp from Employees;

SELECT max(Salary) as highest_salary, min(Salary) as Lowest_salary, AVG(Salary) as average_salary from Employees;

SELECT sum(amount) as total_sales_amount from Orders;


SELECT o.customer_id,count(*) from Orders as o
INNER JOIN customers as c
ON o.customer_id = c.customer_id
group by o.customer_id;

select dept_name, avg(e.salary) as avg_salary From departments as d 
INNER JOIN Employees as e
ON d.dept_id = e.dept_id
GROUP By dept_name
HAVING avg_salary > 50000;




-- 10. Display each employee's name along with their department name (INNER JOIN).
-- 11. List all customers and their orders, including customers who have never placed an order (LEFT
-- JOIN).
-- 12. Show all departments and the employees in them, including departments with no employees
-- (RIGHT JOIN).
-- SQL Basics Test | Page 1
-- 13. Find customers who have never placed an order (LEFT JOIN + IS NULL).
-- 14. Display each employee's name along with their manager's name (self join).

SELECT e.name, d.dept_name from Employees as e
INNER JOIN Departments as d 
ON e.dept_id = d.dept_id;


SELECT * from Customers as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id;

select e.name, d.dept_name from Employees as e
RIGHT JOIN Departments as d
ON e.dept_id = d.dept_id;


SELECT * from customers as c
LEFT JOIN orders as o
on c.customer_id = o.customer_id
where o.status = 'Cancelled';


SELECT e.name, m.name
FROM Employees AS e
JOIN (
    SELECT name, emp_id, manager_id
    FROM Employees
    WHERE manager_id IS NOT NULL
) AS m
ON e.emp_id = m.manager_id;


-- 15. Fetch employees with salary between 30,000 and 60,000 who work in dept_id 2 (WHERE, AND,
-- BETWEEN).
SELECT * from Employees
where salary BETWEEN 30000 AND 60000;

-- 16. List customers from 'Mumbai' or 'Delhi' whose name starts with 'A' (OR, LIKE, IN).
SELECT * from customers
WHERE (city = 'Delhi' or city = 'Mumbai') and name LIKE 'A%' ;

-- 17. Show the top 5 highest-paid employees, sorted by salary descending (ORDER BY, LIMIT).

SELECT * from Employees
ORDER BY salary DESC
LIMIT 5;


-- 18. E-commerce: Find the monthly revenue for 2025, showing only months with revenue above
-- 1,00,000 (GROUP BY, HAVING, date functions).
SELECT MONTH(order_date), sum(amount) as revenue from orders
GROUP by MONTH(order_date)
HAVING revenue > 20000;

-- 19. HR: List employees hired in the last 6 months along with their department names (JOIN + date
-- filter).

SELECT e.name,e.hire_date, d.dept_name from Employees as e
LEFT JOIN Departments as d 
ON d.dept_id = e.dept_id
Where  hire_date <= (CURDATE() - INTERVAL 6 MONTH);

-- 20. Customer analytics: Find the top 3 customers by total spending, showing their name, city, and
-- total amount (JOIN, SUM, GROUP BY, ORDER BY, LIMIT).

SELECT c.name, c.city, SUM(o.amount) as total_spend FROM customers as c
INNER JOIN orders as o
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spend DESC
LIMIT 3;

