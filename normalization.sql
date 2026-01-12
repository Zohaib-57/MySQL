CREATE DATABASE OrderManagement;
USE OrderManagement;

CREATE TABLE Orders_UNF (
    OrderID INT,
    CustomerName VARCHAR(100),
    CustomerPhone VARCHAR(20),
    Products VARCHAR(255),        
    ProductPrices VARCHAR(255), 
    OrderDate DATE
);

INSERT INTO Orders_UNF VALUES
(1, 'Ali', '03001234567', 'Laptop,Mouse,Keyboard', '800,20,50', '2026-01-10'),
(2, 'Sara', '03007654321', 'Phone,Charger', '500,30', '2026-01-11'),
(3, 'John', '03009876543', 'Tablet,Case', '300,20', '2026-01-12');

SELECT * FROM Orders_UNF;

-- The above DATABASE and TABLE creation script sets up an unnormalized form (UNF) of an Orders database. The Orders_UNF table contains multiple products and their prices stored as comma-separated values in single fields, which is not ideal for relational database design.

-- Next steps would involve normalizing this data into multiple related tables to eliminate redundancy and improve data integrity.

CREATE TABLE Orders_1NF(
    OrderID INT,
    CustomerName VARCHAR(100),
    CustomerPhone VARCHAR(20),
    Product VARCHAR(100),
    ProductPrice DECIMAL(10, 2),
    OrderDate DATE
);

INSERT INTO Orders_1NF VALUES
(1, 'Ali', '03001234567', 'Laptop', 800, '2026-01-10'),
(1, 'Ali', '03001234567', 'Mouse', 20, '2026-01-10'),
(1, 'Ali', '03001234567', 'Keyboard', 50, '2026-01-10'),
(2, 'Sara', '03007654321', 'Phone', 500, '2026-01-11'),
(2, 'Sara', '03007654321', 'Charger', 30, '2026-01-11'),
(3, 'John', '03009876543', 'Tablet', 300, '2026-01-12'),
(3, 'John', '03009876543', 'Case', 20, '2026-01-12');

SELECT * FROM Orders_1NF;

SELECT OrderID, SUM(ProductPrice) AS TotalAmount
FROM Orders_1NF
GROUP BY OrderID;

SELECT OrderID, COUNT(Product) AS NumProducts
FROM Orders_1NF
GROUP BY OrderID;

-- The above script creates a first normal form (1NF) version of the Orders database. In this version, each product and its price are stored in separate rows, eliminating the use of comma-separated values and ensuring that each field contains atomic values.

-- Further normalization steps would involve creating separate tables for Customers and Products to achieve second normal form (2NF) and third normal form (3NF).

USE OrderManagement;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerPhone VARCHAR(20)
);

INSERT INTO Customers VALUES
(1,"Ali","03001234567"),
(2,"Sara","03007654321"),
(3,"John","03009876543");

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES 
(1,1,'2026-01-10'),
(2,2,'2026-01-11'),
(3,3,'2026-01-12');

CREATE TABLE OrderItems(
    OrderID INT,
    ProductName VARCHAR(50),
    ProductPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID,ProductName),
    Foreign Key (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems VALUES
(1,'Laptop',800),
(1,'Mouse',20),
(1,'Keyboard',50),
(2,'Phone',500),
(2,'Charger',30),
(3,'Tablet',300),
(3,'Case',20);

SELECT o.OrderID, c.CustomerName, oi.ProductName, oi.ProductPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID;

-- The above script creates a third normal form (3NF) version of the Orders database. It separates the data into three related tables: Customers, Orders, and OrderItems. This structure eliminates redundancy and ensures that each piece of information is stored in only one place, improving data integrity and consistency.

USE OrderManagement;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Laptop', 800),
(2, 'Mouse', 20),
(3, 'Keyboard', 50),
(4, 'Phone', 500),
(5, 'Charger', 30),
(6, 'Tablet', 300),
(7, 'Case', 20);

CREATE TABLE OrderItems_3NF (
    OrderID INT,
    ProductID INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderItems_3NF VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(2, 5, 1),
(3, 6, 1),
(3, 7, 1);

SELECT o.OrderID, c.CustomerName, p.ProductName, oi.Quantity, p.Price,
       (oi.Quantity * p.Price) AS TotalPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems_3NF oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;
