/* Data Analysis with SQL 

Dataset - https://coursera.w3schools.com/sql/trysql.asp?filename=trysql_select_all

*/

-- Tables to be used for the Analysis
-- SELECT * FROM Employees;
-- SELECT * FROM Orders;
-- SELECT * FROM OrderDetails;
-- SELECT * FROM Products;

-- Data Needed 
-- Employees ---> LastName and FirstName 
-- Orders ---> OrdersID
-- OrderDetails ---> ProductID and Quantity 
-- Products --> Price  

-- Join Orders, Products, OrderDetails, and Employees tables to gather employee and order detail data 

SELECT LastName, FirstName, Orders.OrderID, Products.ProductID, 
     Quantity, Price
FROM employees
    INNER JOIN orders
        ON employees.employeeID = orders.employeeid 
    INNER JOIN orderDetails
        ON orders.orderid = orderdetails.orderid
    INNER JOIN products
        ON orderdetails.productid = products.productid
ORDER BY lastname, firstname;



-- Calculating Sales Amount by multiplying Quantity and Price for each product in an order

SELECT LastName, FirstName, Orders.OrderID, Products.ProductID, 
     Quantity, Price, quantity * price AS SalesAmt 
FROM employees
    INNER JOIN orders
        ON employees.employeeID = orders.employeeid 
    INNER JOIN orderDetails
        ON orders.orderid = orderdetails.orderid
    INNER JOIN products
        ON orderdetails.productid = products.productid
ORDER BY lastname, firstname;


-- GROUP BY Orders to calculate the total Sales Amount for each order

SELECT LastName, FirstName, Orders.OrderID, Products.ProductID, 
     Quantity, Price, SUM(quantity * price) AS SalesAmt 
FROM employees
    INNER JOIN orders
        ON employees.employeeID = orders.employeeid 
    INNER JOIN orderDetails
        ON orders.orderid = orderdetails.orderid
    INNER JOIN products
        ON orderdetails.productid = products.productid
GROUP BY orders.orderid;


-- Retrieve the top 5 orders with the highest Sales Amount

SELECT LastName, FirstName, Orders.OrderID, Products.ProductID, 
     Quantity, Price, SUM(quantity * price) AS SalesAmt 
FROM employees
    INNER JOIN orders
        ON employees.employeeID = orders.employeeid 
    INNER JOIN orderDetails
        ON orders.orderid = orderdetails.orderid
    INNER JOIN products
        ON orderdetails.productid = products.productid
GROUP BY orders.orderid  
ORDER BY salesamt DESC
LIMIT 5;


-- Retrieve detailed information for the top 5 employees with the highest Sales Amount

SELECT LastName, FirstName, Orders.OrderID, Products.ProductID, 
     Quantity, Price, SUM(quantity * price) AS SalesAmt 
FROM employees
    INNER JOIN orders
        ON employees.employeeID = orders.employeeid 
    INNER JOIN orderDetails
        ON orders.orderid = orderdetails.orderid
    INNER JOIN products
        ON orderdetails.productid = products.productid
GROUP BY orders.orderid  
HAVING orders.orderid IN (10372, 10424, 10417, 10324, 10351)
ORDER BY salesamt DESC;
