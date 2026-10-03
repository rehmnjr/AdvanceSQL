-- +------------------+         +----------------+         +--------------------+
-- |    CUSTOMERS     |         |     ORDERS     |         |    ORDER_ITEMS     |
-- +------------------+         +----------------+         +--------------------+
-- | PK: customer_id  |<---|    | PK: order_id   |<---|    | PK: item_id        |
-- | ...              |    |---| FK: customer_id|    |---| FK: order_id       |
-- +------------------+         +----------------+         +--------------------+

-- DROP DATABASE Ecommerce;

CREATE DATABASE Ecommerce;
USE Ecommerce;

-- Step 1: Create Tables with Constraints
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE,
    customer_tier VARCHAR(20),
    lifetime_spend DECIMAL(10, 2),
    is_active BOOLEAN
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- Foreign Key referencing customers(customer_id)
    order_date DATE NOT NULL,
    shipping_city VARCHAR(50),
    shipping_country VARCHAR(50),
    payment_method VARCHAR(30),
    order_status VARCHAR(20),
    discount_amount DECIMAL(8, 2),
    tax_amount DECIMAL(8, 2),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT, -- Foreign Key referencing orders(order_id)
    product_sku VARCHAR(30) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(8, 2) NOT NULL,
    quantity INT NOT NULL,
    item_discount DECIMAL(6, 2),
    return_status VARCHAR(20),
    supplier_code VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
SELECT * From customers;
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, signup_date, customer_tier, lifetime_spend, is_active) VALUES
(1, 'Alice', 'Smith', 'alice.smith@example.com', 'New York', 'USA', '2022-01-15', 'Gold', 3450.50, TRUE),
(2, 'Bob', 'Jones', 'bob.jones@example.com', 'London', 'UK', '2021-06-20', 'Platinum', 7890.00, TRUE),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', 'Toronto', 'Canada', '2023-03-11', 'Bronze', 450.25, TRUE),
(4, 'Diana', 'Prince', 'diana.p@example.com', 'Berlin', 'Germany', '2020-11-05', 'Silver', 1200.00, FALSE),
(5, 'Evan', 'Wright', 'evan.w@example.com', 'Sydney', 'Australia', '2022-08-19', 'Bronze', 300.00, TRUE),
(6, 'Fiona', 'Gallagher', 'fiona.g@example.com', 'Chicago', 'USA', '2021-04-12', 'Gold', 2100.75, TRUE),
(7, 'George', 'Clark', 'george.c@example.com', 'Dublin', 'Ireland', '2023-01-01', 'Bronze', 150.00, TRUE),
(8, 'Hannah', 'Abbott', 'hannah.a@example.com', 'Manchester', 'UK', '2022-09-30', 'Silver', 980.50, TRUE),
(9, 'Ian', 'Malcolm', 'ian.m@example.com', 'Austin', 'USA', '2019-12-14', 'Platinum', 12500.00, TRUE),
(10, 'Julia', 'Roberts', 'julia.r@example.com', 'Los Angeles', 'USA', '2021-02-28', 'Gold', 4100.00, FALSE),
(11, 'Kevin', 'Bacon', 'kevin.b@example.com', 'Philadelphia', 'USA', '2022-05-04', 'Silver', 850.00, TRUE),
(12, 'Laura', 'Palmer', 'laura.p@example.com', 'Seattle', 'USA', '2020-07-18', 'Bronze', 220.00, FALSE),
(13, 'Michael', 'Scott', 'michael.s@example.com', 'Scranton', 'USA', '2021-10-10', 'Gold', 3100.20, TRUE),
(14, 'Nina', 'Nina', 'nina.n@example.com', 'Madrid', 'Spain', '2023-02-14', 'Bronze', 95.00, TRUE),
(15, 'Oscar', 'Martinez', 'oscar.m@example.com', 'Scranton', 'USA', '2022-03-22', 'Silver', 1400.80, TRUE),
(16, 'Pam', 'Beesly', 'pam.b@example.com', 'Scranton', 'USA', '2021-11-11', 'Silver', 1150.00, TRUE),
(17, 'Quentin', 'Tarantino', 'quentin.t@example.com', 'Knoxville', 'USA', '2018-05-09', 'Platinum', 15400.00, TRUE),
(18, 'Rachel', 'Green', 'rachel.g@example.com', 'New York', 'USA', '2022-12-01', 'Gold', 2800.00, TRUE),
(19, 'Steve', 'Rogers', 'steve.r@example.com', 'Brooklyn', 'USA', '2020-01-01', 'Platinum', 9200.00, TRUE),
(20, 'Tony', 'Stark', 'tony.s@example.com', 'Malibu', 'USA', '2019-04-26', 'Platinum', 99999.99, TRUE),
(21, 'Ursula', 'Buffay', 'ursula.b@example.com', 'New York', 'USA', '2023-04-01', 'Bronze', 50.00, FALSE),
(22, 'Victor', 'Von', 'victor.v@example.com', 'Zurich', 'Switzerland', '2021-08-30', 'Gold', 5200.00, TRUE),
(23, 'Wanda', 'Maximoff', 'wanda.m@example.com', 'Westview', 'USA', '2022-06-15', 'Silver', 1800.00, TRUE),
(24, 'Xavier', 'Charles', 'xavier.c@example.com', 'Westchester', 'USA', '2020-09-09', 'Platinum', 8400.00, TRUE),
(25, 'Yennefer', 'Vengerberg', 'yennefer.v@example.com', 'Warsaw', 'Poland', '2021-12-24', 'Gold', 4900.00, TRUE),
(26, 'Zack', 'Snyder', 'zack.s@example.com', 'Greenwich', 'USA', '2022-07-07', 'Silver', 1300.00, TRUE),
(27, 'Arthur', 'Dent', 'arthur.d@example.com', 'London', 'UK', '2023-03-03', 'Bronze', 42.00, TRUE),
(28, 'Bruce', 'Wayne', 'bruce.w@example.com', 'Gotham', 'USA', '2018-11-11', 'Platinum', 88000.00, TRUE),
(29, 'Clark', 'Kent', 'clark.k@example.com', 'Metropolis', 'USA', '2021-05-05', 'Bronze', 310.00, TRUE),
(30, 'David', 'Rose', 'david.r@example.com', 'Schitt Creek', 'Canada', '2022-10-10', 'Gold', 6700.00, TRUE),
(31, 'Eleanor', 'Shellstrop', 'eleanor.s@example.com', 'Phoenix', 'USA', '2021-01-20', 'Bronze', 210.00, FALSE),
(32, 'Frank', 'Castle', 'frank.c@example.com', 'New York', 'USA', '2020-03-15', 'Silver', 1900.00, TRUE),
(33, 'Gideon', 'Navarre', 'gideon.n@example.com', 'Auckland', 'New Zealand', '2023-05-01', 'Bronze', 120.00, TRUE),
(34, 'Holly', 'Golightly', 'holly.g@example.com', 'New York', 'USA', '2019-08-12', 'Gold', 5100.00, TRUE),
(35, 'Iris', 'West', 'iris.w@example.com', 'Central City', 'USA', '2022-04-18', 'Silver', 920.00, TRUE),
(36, 'Jack', 'Sparrow', 'jack.s@example.com', 'Port Royal', 'Jamaica', '2021-07-04', 'Bronze', 650.00, TRUE),
(37, 'Katniss', 'Everdeen', 'katniss.e@example.com', 'District 12', 'Panem', '2022-02-22', 'Silver', 1100.00, TRUE),
(38, 'Logan', 'Howlett', 'logan.h@example.com', 'Calgary', 'Canada', '2019-01-01', 'Gold', 3900.00, TRUE),
(39, 'Marty', 'McFly', 'marty.m@example.com', 'Hill Valley', 'USA', '2021-10-21', 'Silver', 880.00, TRUE),
(40, 'Nomi', 'Sun', 'nomi.s@example.com', 'San Francisco', 'USA', '2023-02-02', 'Bronze', 180.00, TRUE),
(41, 'Oswald', 'Cobblepot', 'oswald.c@example.com', 'Gotham', 'USA', '2020-06-06', 'Gold', 7200.00, FALSE),
(42, 'Peter', 'Parker', 'peter.p@example.com', 'Queens', 'USA', '2022-08-15', 'Bronze', 150.00, TRUE),
(43, 'Quinn', 'Harley', 'quinn.h@example.com', 'Gotham', 'USA', '2021-09-09', 'Silver', 1600.00, TRUE),
(44, 'Roy', 'Mustang', 'roy.m@example.com', 'Amestris', 'Japan', '2020-12-12', 'Gold', 4300.00, TRUE),
(45, 'Sam', 'Winchester', 'sam.w@example.com', 'Lawrence', 'USA', '2022-03-30', 'Silver', 990.00, TRUE),
(46, 'Ted', 'Lasso', 'ted.l@example.com', 'Richmond', 'UK', '2021-08-08', 'Gold', 2900.00, TRUE),
(47, 'Ulysses', 'Gazz', 'ulysses.g@example.com', 'Rome', 'Italy', '2023-01-25', 'Bronze', 75.00, FALSE),
(48, 'Vito', 'Corleone', 'vito.c@example.com', 'New York', 'USA', '2018-07-07', 'Platinum', 45000.00, TRUE),
(49, 'Wade', 'Wilson', 'wade.w@example.com', 'Vancouver', 'Canada', '2022-11-20', 'Silver', 1350.00, TRUE),
(50, 'Zelda', 'Hyrule', 'zelda.h@example.com', 'Tokyo', 'Japan', '2020-03-03', 'Platinum', 11200.00, TRUE);

-- SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO orders (order_id, customer_id, order_date, shipping_city, shipping_country, payment_method, order_status, discount_amount, tax_amount, total_amount) VALUES
(101, 1, '2023-06-01', 'New York', 'USA', 'Credit Card', 'Completed', 10.00, 5.00, 105.00),
(102, 2, '2023-06-02', 'London', 'UK', 'PayPal', 'Completed', 0.00, 12.00, 212.00),
(103, 1, '2023-06-03', 'New York', 'USA', 'Credit Card', 'Completed', 5.00, 8.00, 153.00),
(104, 3, '2023-06-05', 'Toronto', 'Canada', 'Debit Card', 'Shipped', 0.00, 4.00, 44.00),
(105, NULL, '2023-06-06', 'Paris', 'France', 'Credit Card', 'Completed', 15.00, 10.00, 185.00), -- Guest checkout (NULL customer)
(106, 6, '2023-06-07', 'Chicago', 'USA', 'PayPal', 'Processing', 20.00, 15.00, 315.00),
(107, 9, '2023-06-08', 'Austin', 'USA', 'Apple Pay', 'Completed', 50.00, 40.00, 890.00),
(108, 13, '2023-06-09', 'Scranton', 'USA', 'Credit Card', 'Cancelled', 0.00, 2.00, 27.00),
(109, 99, '2023-06-10', 'Unknown', 'USA', 'Credit Card', 'Pending', 0.00, 5.00, 65.00), -- Invalid/Deleted customer_id
(110, 18, '2023-06-11', 'New York', 'USA', 'PayPal', 'Completed', 10.00, 14.00, 224.00),
(111, 19, '2023-06-12', 'Brooklyn', 'USA', 'Credit Card', 'Completed', 0.00, 30.00, 430.00),
(112, 20, '2023-06-12', 'Malibu', 'USA', 'Crypto', 'Completed', 100.00, 200.00, 3100.00),
(113, 20, '2023-06-13', 'Malibu', 'USA', 'Crypto', 'Completed', 0.00, 150.00, 2150.00),
(114, 22, '2023-06-14', 'Zurich', 'Switzerland', 'Credit Card', 'Shipped', 25.00, 18.00, 293.00),
(115, 25, '2023-06-15', 'Warsaw', 'Poland', 'PayPal', 'Completed', 5.00, 9.00, 124.00),
(116, 28, '2023-06-16', 'Gotham', 'USA', 'Credit Card', 'Completed', 0.00, 500.00, 7500.00),
(117, NULL, '2023-06-17', 'London', 'UK', 'Debit Card', 'Completed', 0.00, 6.00, 86.00), -- Guest checkout
(118, 30, '2023-06-18', 'Schitt Creek', 'Canada', 'Credit Card', 'Completed', 30.00, 20.00, 340.00),
(119, 32, '2023-06-19', 'New York', 'USA', 'Cash', 'Completed', 0.00, 11.00, 161.00),
(120, 34, '2023-06-20', 'New York', 'USA', 'Credit Card', 'Shipped', 15.00, 22.00, 327.00),
(121, 38, '2023-06-21', 'Calgary', 'Canada', 'PayPal', 'Completed', 0.00, 13.00, 193.00),
(122, 41, '2023-06-22', 'Gotham', 'USA', 'Credit Card', 'Processing', 40.00, 35.00, 545.00),
(123, 44, '2023-06-23', 'Amestris', 'Japan', 'Credit Card', 'Completed', 10.00, 16.00, 246.00),
(124, 48, '2023-06-24', 'New York', 'USA', 'Cash', 'Completed', 200.00, 300.00, 4600.00),
(125, 50, '2023-06-25', 'Tokyo', 'Japan', 'Apple Pay', 'Completed', 50.00, 80.00, 1230.00),
(126, 1, '2023-06-26', 'New York', 'USA', 'Credit Card', 'Completed', 0.00, 7.00, 97.00),
(127, 2, '2023-06-27', 'London', 'UK', 'PayPal', 'Shipped', 10.00, 15.00, 235.00),
(128, 6, '2023-06-28', 'Chicago', 'USA', 'Credit Card', 'Completed', 5.00, 12.00, 177.00),
(129, 9, '2023-06-29', 'Austin', 'USA', 'Apple Pay', 'Completed', 0.00, 25.00, 375.00),
(130, 13, '2023-06-30', 'Scranton', 'USA', 'Debit Card', 'Completed', 0.00, 3.00, 43.00),
(131, 18, '2023-07-01', 'New York', 'USA', 'Credit Card', 'Completed', 20.00, 18.00, 268.00),
(132, 20, '2023-07-02', 'Malibu', 'USA', 'Crypto', 'Processing', 0.00, 400.00, 5400.00),
(133, 23, '2023-07-03', 'Westview', 'USA', 'PayPal', 'Completed', 10.00, 8.00, 128.00),
(134, 24, '2023-07-04', 'Westchester', 'USA', 'Credit Card', 'Shipped', 0.00, 45.00, 695.00),
(135, 28, '2023-07-05', 'Gotham', 'USA', 'Credit Card', 'Completed', 100.00, 250.00, 3650.00),
(136, 30, '2023-07-06', 'Schitt Creek', 'Canada', 'Credit Card', 'Completed', 0.00, 14.00, 204.00),
(137, 36, '2023-07-07', 'Port Royal', 'Jamaica', 'Cash', 'Cancelled', 0.00, 5.00, 75.00),
(138, 38, '2023-07-08', 'Calgary', 'Canada', 'PayPal', 'Completed', 15.00, 10.00, 155.00),
(139, 42, '2023-07-09', 'Queens', 'USA', 'Debit Card', 'Completed', 0.00, 2.00, 32.00),
(140, 45, '2023-07-10', 'Lawrence', 'USA', 'Credit Card', 'Completed', 5.00, 11.00, 156.00),
(141, 46, '2023-07-11', 'Richmond', 'UK', 'PayPal', 'Shipped', 0.00, 21.00, 311.00),
(142, 48, '2023-07-12', 'New York', 'USA', 'Cash', 'Completed', 0.00, 150.00, 2150.00),
(143, 50, '2023-07-13', 'Tokyo', 'Japan', 'Apple Pay', 'Completed', 20.00, 30.00, 460.00),
(144, 98, '2023-07-14', 'Unknown', 'Canada', 'Credit Card', 'Pending', 0.00, 8.00, 108.00), -- Invalid customer_id
(145, 11, '2023-07-15', 'Philadelphia', 'USA', 'Credit Card', 'Completed', 10.00, 9.00, 139.00),
(146, 15, '2023-07-16', 'Scranton', 'USA', 'PayPal', 'Completed', 0.00, 17.00, 257.00),
(147, 16, '2023-07-17', 'Scranton', 'USA', 'Debit Card', 'Shipped', 5.00, 6.00, 91.00),
(148, 17, '2023-07-18', 'Knoxville', 'USA', 'Credit Card', 'Completed', 50.00, 60.00, 910.00),
(149, 26, '2023-07-19', 'Greenwich', 'USA', 'PayPal', 'Completed', 0.00, 12.00, 172.00),
(150, 37, '2023-07-20', 'District 12', 'Panem', 'Debit Card', 'Completed', 0.00, 4.00, 54.00);


INSERT INTO order_items (item_id, order_id, product_sku, product_name, category, unit_price, quantity, item_discount, return_status, supplier_code) VALUES
(1001, 101, 'ELEC-001', 'Wireless Mouse', 'Electronics', 25.00, 2, 0.00, 'None', 'SUP-A'),
(1002, 101, 'ELEC-002', 'Mechanical Keyboard', 'Electronics', 60.00, 1, 5.00, 'None', 'SUP-A'),
(1003, 102, 'CLOT-001', 'Leather Jacket', 'Apparel', 200.00, 1, 0.00, 'None', 'SUP-B'),
(1004, 103, 'HOME-001', 'Coffee Maker', 'Home Appliances', 150.00, 1, 5.00, 'None', 'SUP-C'),
(1005, 104, 'BOOK-001', 'SQL Guidebook', 'Books', 40.00, 1, 0.00, 'None', 'SUP-D'),
(1006, 105, 'ELEC-003', 'Noise-Canceling Headphones', 'Electronics', 190.00, 1, 15.00, 'Returned', 'SUP-A'),
(1007, 106, 'SPORT-001', 'Running Shoes', 'Sports', 120.00, 2, 10.00, 'None', 'SUP-E'),
(1008, 106, 'SPORT-002', 'Fitness Tracker', 'Sports', 80.00, 1, 0.00, 'None', 'SUP-E'),
(1009, 107, 'ELEC-004', '4K Monitor', 'Electronics', 400.00, 2, 50.00, 'None', 'SUP-A'),
(1010, 107, 'ELEC-005', 'USB-C Dock', 'Electronics', 100.00, 1, 0.00, 'None', 'SUP-A'),
(1011, 108, 'OFF-001', 'Ergonomic Desk Chair', 'Office', 25.00, 1, 0.00, 'None', 'SUP-F'),
(1012, 109, 'HOME-002', 'Desk Lamp', 'Home Appliances', 60.00, 1, 0.00, 'None', 'SUP-C'),
(1013, 110, 'CLOT-002', 'Designer Sunglasses', 'Apparel', 220.00, 1, 10.00, 'None', 'SUP-B'),
(1014, 111, 'ELEC-006', 'Smartphone', 'Electronics', 400.00, 1, 0.00, 'None', 'SUP-A'),
(1015, 112, 'ELEC-007', 'High-End Laptop', 'Electronics', 3000.00, 1, 100.00, 'None', 'SUP-A'),
(1016, 113, 'ELEC-008', 'Tablet Pro', 'Electronics', 2000.00, 1, 0.00, 'Requested', 'SUP-A'),
(1017, 114, 'CLOT-003', 'Winter Coat', 'Apparel', 300.00, 1, 25.00, 'None', 'SUP-B'),
(1018, 115, 'BOOK-002', 'Data Science Primer', 'Books', 120.00, 1, 5.00, 'None', 'SUP-D'),
(1019, 116, 'AUTO-001', 'Batmobile Armor Polish', 'Automotive', 7000.00, 1, 0.00, 'None', 'SUP-G'),
(1020, 117, 'HOME-003', 'Air Purifier', 'Home Appliances', 80.00, 1, 0.00, 'None', 'SUP-C'),
(1021, 118, 'CLOT-004', 'Silk Scarf', 'Apparel', 350.00, 1, 30.00, 'None', 'SUP-B'),
(1022, 119, 'SPORT-003', 'Punching Bag', 'Sports', 150.00, 1, 0.00, 'None', 'SUP-E'),
(1023, 120, 'JEWEL-001', 'Diamond Earring', 'Jewelry', 320.00, 1, 15.00, 'None', 'SUP-H'),
(1024, 121, 'OUT-001', 'Camping Tent', 'Outdoor', 180.00, 1, 0.00, 'None', 'SUP-I'),
(1025, 122, 'CLOT-005', 'Tailored Suit', 'Apparel', 550.00, 1, 40.00, 'None', 'SUP-B'),
(1026, 123, 'OFF-002', 'Fountain Pen Set', 'Office', 240.00, 1, 10.00, 'None', 'SUP-F'),
(1027, 124, 'LUX-001', 'Vintage Wine Set', 'Luxury', 4500.00, 1, 200.00, 'None', 'SUP-J'),
(1028, 125, 'ELEC-009', 'Gaming Console', 'Electronics', 500.00, 2, 50.00, 'None', 'SUP-A'),
(1029, 126, 'ELEC-010', 'Bluetooth Speaker', 'Electronics', 90.00, 1, 0.00, 'None', 'SUP-A'),
(1030, 127, 'CLOT-006', 'Denim Jeans', 'Apparel', 110.00, 2, 10.00, 'None', 'SUP-B'),
(1031, 128, 'HOME-004', 'Blender', 'Home Appliances', 170.00, 1, 5.00, 'None', 'SUP-C'),
(1032, 129, 'ELEC-011', 'Smart Watch', 'Electronics', 350.00, 1, 0.00, 'None', 'SUP-A'),
(1033, 130, 'OFF-003', 'Paper Shredder', 'Office', 40.00, 1, 0.00, 'None', 'SUP-F'),
(1034, 131, 'CLOT-007', 'Leather Boots', 'Apparel', 270.00, 1, 20.00, 'None', 'SUP-B'),
(1035, 132, 'ELEC-012', 'OLED TV 65-inch', 'Electronics', 5000.00, 1, 0.00, 'None', 'SUP-A'),
(1036, 133, 'TOY-001', 'Board Game Set', 'Toys', 130.00, 1, 10.00, 'None', 'SUP-K'),
(1037, 134, 'ELEC-013', 'Drone Camera', 'Electronics', 650.00, 1, 0.00, 'None', 'SUP-A'),
(1038, 135, 'LUX-002', 'Gold Cufflinks', 'Luxury', 3500.00, 1, 100.00, 'None', 'SUP-J'),
(1039, 136, 'HOME-005', 'Standing Fan', 'Home Appliances', 190.00, 1, 0.00, 'None', 'SUP-C'),
(1040, 137, 'FOOD-001', 'Exotic Spice Rack', 'Food', 70.00, 1, 0.00, 'Returned', 'SUP-L'),
(1041, 138, 'SPORT-004', 'Hiking Boots', 'Sports', 150.00, 1, 15.00, 'None', 'SUP-E'),
(1042, 139, 'BOOK-003', 'Comic Book Rare', 'Books', 30.00, 1, 0.00, 'None', 'SUP-D'),
(1043, 140, 'OUT-002', 'Sleeping Bag', 'Outdoor', 150.00, 1, 5.00, 'None', 'SUP-I'),
(1044, 141, 'SPORT-005', 'Football Gear', 'Sports', 290.00, 1, 0.00, 'None', 'SUP-E'),
(1045, 142, 'LUX-003', 'Antique Clock', 'Luxury', 2000.00, 1, 0.00, 'None', 'SUP-J'),
(1046, 143, 'ELEC-014', 'VR Headset', 'Electronics', 430.00, 1, 20.00, 'None', 'SUP-A'),
(1047, 145, 'OFF-004', 'Monitor Stand', 'Office', 130.00, 1, 10.00, 'None', 'SUP-F'),
(1048, 146, 'HOME-006', 'Microwave Oven', 'Home Appliances', 240.00, 1, 0.00, 'None', 'SUP-C'),
(1049, 147, 'ART-001', 'Oil Canvas Set', 'Art', 90.00, 1, 5.00, 'None', 'SUP-M'),
(1050, 148, 'MEDIA-001', 'Film Reel Projector', 'Media', 850.00, 1, 50.00, 'None', 'SUP-N');

-- SET FOREIGN_KEY_CHECKS = 1;


-- Retrieve all order IDs with the corresponding customer's first name.

SELECT o.order_id, m.first_name, o.payment_method from  orders as o
Inner JOIN(select first_name,customer_id From Customers)as m
on o.customer_id =  m.customer_id;

-- List all product names alongside their respective order dates.
SELECT  e.product_name, m.order_date From order_items as e
INNER JOIN(
    SELECT order_id, order_date From orders
)as m
on m.order_id = e.order_Id;


-- Find the total order amount for the customer named 'Alice'

SELECT sum(m.total_amount) from customers as e
INNER JOIN orders as m 
    ON e.customer_id  = m.customer_id
where first_name = 'Alice';

-- counted total done by Alice
SELECT count(*) from customers as e
INNER JOIN orders as m 
    ON e.customer_id  = m.customer_id
where first_name = 'Alice';


-- Fetch all orders placed by 'Gold' tier customers.
SELECT n.*, e.customer_tier, e.first_name from Customers as e 
INNER JOIN orders as m
    on e.customer_id = m.customer_id
INNER JOIN order_items as n
    on m.order_id = n.order_id
where customer_tier = 'Gold';

-- Get the email addresses of customers who have 'Completed' orders.
SELECT m.email from orders as e 
INNER JOIN customers as m 
on e.customer_id = m.customer_id
where order_status = "Completed";

-- Show order IDs and product categories for all items priced above $50.

SELECT e.item_id, e.category from order_items as e 
INNER JOIN orders as m
ON m.order_id = e.order_id
where unit_price > 50;

select category, count(*) from (SELECT e.item_id, e.category from order_items as e 
INNER JOIN orders as m
ON m.order_id = e.order_id
where unit_price > 50) as x
GROUP BY category;

-- List all cities where 'Processing' orders are currently being shipped.
SELECT c.city from orders as o
INNER JOIN customers as c
on o.customer_id = c.customer_id
where order_status = 'Processing';

-- Find the total quantity of 'Electronics' purchased by 'Platinum' customers.
SELECT SUM(oi.quantity) from customers AS c 
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
ON oi.order_id = o.order_id
AND oi.category  = "Electronics"
Where  customer_tier = 'Platinum';

SELECT SUM(oi.quantity) AS total_quantity
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON oi.order_id = o.order_id
WHERE c.customer_tier = 'Platinum'
  AND oi.category = 'Electronics';

-- Display the full names of customers who bought a 'Wireless Mouse'

SELECT c.first_name From order_items AS oi
INNER JOIN orders AS o
ON oi.order_id = o.order_id
INNER JOIN customers AS c
ON o.customer_id = c.customer_id
where product_name = 'Wireless Mouse';

-- Retrieve order dates and tax amounts for orders placed in 'New York'
SELECT order_date, tax_amount FROM orders
where shipping_city = 'New York'; 

-- List item IDs and corresponding customer emails for all returned items.

SELECT c.email  From order_items as oi
INNER JOIN orders as o
on oi.order_id = o.order_id
LEFT JOIN customers as c
on o.customer_id = c.customer_id
where return_status = 'Returned';


-- Find the sum of total amounts for orders associated with active customers.

SELECT count(*) from customers
where is_active = TRUE ;

SELECT sum(o.total_amount) from customers as c
INNER Join orders as o
on o.customer_id = c.customer_id
AND o.customer_id is not Null
where is_active = TRUE;

-- Get the product SKU and customer tier for orders with discounts > $20.
SELECT oi.product_sku, c.customer_tier from orders as e
INNER JOIN customers as c 
ON e.customer_id = c.customer_id 
INNER JOIN order_items as oi
ON e.order_id = oi.order_id
where discount_amount >20;

-- Show customer names who purchased items from 'SUP-A' supplier.
SELECT DISTINCT c.first_name from order_items as oi
INNER JOIN orders as o
ON oi.order_id = o.order_id
INNER JOIN customers as c 
ON o.customer_id = c.customer_id
where supplier_code = 'SUP-A';

-- Find all order IDs containing products categorized as 'Apparel'

SELECT order_id from order_items
WHERE category = 'Apparel' ;


-- Retrieve the first names of customers who used 'PayPal'

SELECT c.first_name from orders as o
INNER JOIN customers as c
ON o.customer_id = c.customer_id
where payment_method = 'Paypal';

-- List order statuses for purchases made by customers in 'UK'
SELECT o.order_status from customers as c
INNER JOIN orders as o
on  c.customer_id = o.customer_id
where country = 'UK';

-- Display the total unit price of items in order ID 105.
SELECT sum(unit_price*quantity) from order_items
WHERE order_id = 105;

-- Find customers who ordered 'Books' and paid with a'Credit Card'.
SELECT * from customers;
SELECT * from orders;
SELECT * from order_items;

-- Show the payment methods used for buying 'Luxury' category items.
-- Get order IDs and shipping countries for 'Bronze' tier customers.
-- List the names of customers whose orders had zero tax.
-- Find the total lifetime spend of customers who bought a 'Monitor'.
-- Retrieve product names for orders shipped to 'USA'.
-- Show customer emails for orders placed exactly on '2023-06-15'.
-- Find the categories of items bought by 'Inactive' customers.
-- List order dates and item quantities for 'Sports' products.
-- Display customer cities for orders with a total amount > $1000.
-- Find the item IDs for products purchased by 'Tony Stark'.
-- Retrieve order total amounts mapped to the 'Home Appliances' category.


