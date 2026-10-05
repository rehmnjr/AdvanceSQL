CREATE DATABASE Grastech2;
use Grastech2;
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    grade VARCHAR(5),
    marks DECIMAL(5,2)
);

-- Employees Table (References: name, id, salary, department, age)
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    age INT
);

-- Products Table (References: price, stock, category)
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- Customers Table (References: name, country)
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

-- Orders Table (References: order_date, total_amount)
CREATE TABLE orders (
    id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Users Table (References: username, email)
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

-- Books Table (References: publish_year)
CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(200),
    publish_year INT
);

-- Movies Table (References: rating)
CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(200),
    rating DECIMAL(3,1)
);

-- Cities Table (References: city_name)
CREATE TABLE cities (
    id INT PRIMARY KEY,
    city_name VARCHAR(100)
);

-- Jobs Table (References: job_title)
CREATE TABLE jobs (
    id INT PRIMARY KEY,
    job_title VARCHAR(100)
);



-- 1. Insert values into students
INSERT INTO students (id, name, age, grade, marks) VALUES
(1, 'Alice Johnson', 16, 'A', 88.50),
(2, 'Bob Smith', 19, 'B', 74.00),
(3, 'Charlie Brown', 17, 'A', 92.00),
(4, 'David Lee', 15, 'C', 65.50),
(5, 'Emma Watson', 20, 'B', 81.00);

-- 2. Insert values into employees
INSERT INTO employees (id, name, department, salary, age) VALUES
(1, 'John Doe', 'HR', 50000.00, 28),
(2, 'Jane Smith', 'IT', 75000.00, 32),
(3, 'Robert Brown', 'HR', 45000.00, 25),
(4, 'Emily Davis', 'Finance', 90000.00, 41),
(5, 'Michael Scott', 'Sales', 50000.00, 30),
(6, 'Sarah Wilson', 'IT', 110000.00, 35);

-- 3. Insert values into products
INSERT INTO products (id, name, category, price, stock) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.00, 150),
(2, 'Mechanical Keyboard', 'Electronics', 85.00, 45),
(3, 'Gaming Monitor', 'Electronics', 250.00, 0),
(4, 'Desk Lamp', 'Furniture', 45.00, 20),
(5, 'Office Chair', 'Furniture', 150.00, 0);

-- 4. Insert values into customers
INSERT INTO customers (id, name, country) VALUES
(1, 'Carlos Silva', 'Brazil'),
(2, 'Liam Miller', 'USA'),
(3, 'Aarav Patel', 'India'),
(4, 'Sophia Taylor', 'USA'),
(5, 'Priya Sharma', 'India');

-- 5. Insert values into orders
INSERT INTO orders (id, order_date, total_amount) VALUES
(1, '2023-01-15', 450.00),
(2, '2023-05-20', 1200.50),
(3, '2022-11-10', 80.00),
(4, '2023-09-05', 2500.00),
(5, '2024-02-14', 350.00);

-- 6. Insert values into users
INSERT INTO users (id, username, email) VALUES
(1, 'admin', 'admin@gmail.com'),
(2, 'john_doe', 'john.doe@yahoo.com'),
(3, 'sarah_k', 'sarah.k@gmail.com'),
(4, 'moderator', 'mod_team@outlook.com');

-- 7. Insert values into books
INSERT INTO books (id, title, publish_year) VALUES
(1, 'The Great Gatsby', 1925),
(2, 'Educated', 2018),
(3, 'Atomic Habits', 2018),
(4, '1984', 1949),
(5, 'Project Hail Mary', 2021);

-- 8. Insert values into movies
INSERT INTO movies (id, title, rating) VALUES
(1, 'Inception', 8.8),
(2, 'The Dark Knight', 9.0),
(3, 'Interstellar', 8.7),
(4, 'The Matrix Resurrections', 5.7),
(5, 'Pulp Fiction', 8.9);

-- 9. Insert values into cities
INSERT INTO cities (id, city_name) VALUES
(1, 'Tokyo'),
(2, 'Amsterdam'),
(3, 'New York'),
(4, 'Berlin'),
(5, 'Sydney');

-- 10. Insert values into jobs
INSERT INTO jobs (id, job_title) VALUES
(1, 'Software Engineer'),
(2, 'Data Analyst'),
(3, 'Product Manager'),
(4, 'HR Specialist'),
(5, 'Graphic Designer');


-- 1. Retrieve only the name column from the employees table.
SELECT name from Employees;
SELECT * from Employees;

-- 2. Display all records from products.
SELECT * from Products;

-- Select id and salary from employees.
SELECT id, salary From Employees;

-- Show all customers whose country is 'USA'.
SELECT Name
From customers
WHERE Country = 'USA';

-- Display students whose age is greater than 18.
SELECT * From Students
where age> 18;

-- Retrieve products with price less than 100.
select name from Products
where price < 100;

-- Display employees with department 'HR'.
SELECT * from Employees
where Department = 'HR';

-- Select all orders placed in the year 2023.
select * from orders
where YEAR(order_date) = 2023;

-- Show users whose username is 'admin'.
SELECT * from users
where username = 'admin';

-- Display employees whose salary is equal to 50000.
SELECT * from Employees
where salary = 50000;

-- Retrieve all products that are out of stock.
SELECT * from products
where stock<1;

-- Show all customers except those from 'India'.
SELECT * from Customers
where country = 'India';

-- Display students whose grade is 'A'.
SELECT * from Students
where grade= 'A';

-- Retrieve employees whose age is less than or equal to 30.
SELECT * From Employees
where age <=30;

-- Show orders with total amount greater than 1000.
SELECT * From Orders
where total_amount > 1000;

-- Display books published in year 2015.
SELECT * From BOOKS
where publish_year =  2015;

-- Select movies with raOng above 8.
SELECT * from movies
where rating > 8;

-- Retrieve users whose email contains '@gmail.com'.
SELECT * from Users
where email like '%@gmail.com';

-- Display all ciOes sorted alphabeOcally.
SELECT * from Cities
ORDER BY city_name asc;

-- Retrieve employees sorted by salary ascending.
SELECT * from Employees
ORDER BY salary asc;

-- Display products sorted by price descending.
SELECT * from products
ORDER BY price desc;

-- Show students sorted by marks.
SELECT * from students
ORDER BY marks desc;

-- Display customers ordered by name.
SELECT name From Customers
ORDER BY name;

-- Select top 5 highest-paid employees.
SELECT * from Employees
ORDER BY salary DESC
LIMIT 5;

-- Retrieve first 10 rows from orders.
SELECT * from Orders
limit 10;

-- Display unique countries from customers.
SELECT DISTINCT country from Customers;

-- Show distinct departments from employees.
SELECT DISTINCT Department from Employees;

-- Retrieve unique job Otles from jobs.
SELECT DISTINCT job_title from Jobs;

-- 30. Display disOnct product categories.
SELECT DISTINCT category from Products;

-- Show employees with salary between 30000 and 60000.
SELECT * from Employees
where salary >=30000 and salary<=60000;
-- or
SELECT * from Employees
where Salary BETWEEN 30000 and 60000;

-- Display products with price between 50 and 200.
SELECT * from Products
where price BETWEEN 50 and 200;
-- or
SELECT * from Products
where price>=50 and price<=200;

-- Retrieve students with age between 15 and 18.
SELECT * from Students
where age>=15 and age<=18;
-- or
SELECT * from Students
where age BETWEEN 15 and 18;



-- Show orders placed between two dates.
show tables;
SELECT  * from Orders
where DAY(order_date) BETWEEN 5 and 15;

-- Display employees whose name starts with 'A'.
SELECT * From Employees
WHERE name like 'A%';

-- Retrieve customers whose name ends with 'son'.
SELECT * FROM Customers
WHERE name like '%son';

-- Show products whose name contains 'Pro'.
SELECT * From Products
where name like "%es%";

-- Display users whose username has exactly 5 characters.
Select * from Users
where LENGTH(username) = 5;

-- Retrieve employees with NULL salary.
SELECT * from Employees
where Salary is NULL;

-- Display students whose phone number is NOT NULL.
SELECT * from Students
where age is not null;

-- Show employees working in either 'IT' or 'Finance'.
SELECT * from Employees
where Department = 'IT' or Department = 'Finance';

-- Retrieve products in categories 'Electronics' or 'Furniture'.
SELECT * from Products
where category = 'Electronics' or category = 'Furniture';

-- Display customers from 'USA' or 'Canada'.
SELECT * from Customers
where Country = 'USA' or Country = 'CANADA';

-- Show students who are not in grade 'C'.
SELECT * From Students
WHERE grade <> 'C';
-- or
SELECT * From Students
WHERE grade != 'C';
-- or
SELECT * From Students
WHERE Not grade = 'C';

-- Retrieve employees whose salary is NOT 40000.
SELECT * From Employees
WHERE Salary <> 40000;
-- or
SELECT * From Employees
WHERE Salary != 40000;
-- or
SELECT * From Employees
WHERE Not Salary = 40000;

-- Display all rows except the first 5.
SELECT * from Employees
limit 100000000000 offset 5;
-- or

-- Retrieve employees whose manager_id is NULL.
SELECT * from Employees;

-- Show products that are not disconOnued.
SELECT * FROM Products;

-- Display users created before 2020.
SELECT * from books
where publish_year<2020;

-- Retrieve all records using SELECT *.
select * from Employees;


-- SECTION 2: BASIC SQL (51–100)
-- (Aggregate func=ons, GROUP BY, HAVING)
-- Count the total number of employees.
SELECT count(*) as total_Emp from Employees;

-- Find the average salary of employees.
SELECT AVG(Salary) as Average_Salary From Employees;

-- Calculate the maximum salary in the company.
SELECT MAX(Salary) as Max_Salary From Employees;

-- Find the minimum price of products.
SELECT MIN(price) as MIN_PRICE From Products;

-- Count the number of customers per country.
SELECT country, count(*) total_Customers from customers
GROUP by country;

-- Find total sales amount from orders.
SELECT sum(total_amount) From Orders;

-- Calculate average marks of students.
SELECT avg(marks) as avg_marks from students;

-- Count number of students in each grade.
SELECT grade, count(*) student_in_each_grade from students
GROUP by grade;

-- 9. Find highest order amount.
SELECT max(total_amount) as highest_amount From orders;

-- Calculate total salary paid to employees.
SELECT sum(Salary) as paid_salary From Employees;

-- 11. Display department-wise employee count.
SELECT department, count(*) from Employees
GROUP by Department;
-- or
SELECT name, department, count(*)
over(partition by department) a from Employees;

-- Find average salary per department.
SELECT department, avg(salary) from Employees
GROUP BY department;

-- Show total sales per customer.
SELECT name, price*stock From products;

-- Count number of orders per year.
SELECT year(order_date), count(*) from orders
GROUP by year(order_date);

-- 15. Find category-wise product count.
select category, count(*) from Products
GROUP BY category;

-- Display departments having more than 10 employees.
SELECT Department, count(*) as cnt From Employees
GROUP BY Department
HAVING cnt >=2;

-- Show grades having average marks above 75.
SELECT grade, avg(marks) as avg_marks From students
GROUP BY grade
HAVING avg_marks > 75;

-- Find customers who placed more than 5 orders.


-- Display products whose average price is above 500.
SELECT name, avg(price) as avg_price From Products
GROUP BY name
HAVING avg_price > 75;

-- Show countries with more than 100 customers.



