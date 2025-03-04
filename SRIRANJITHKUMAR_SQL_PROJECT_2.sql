use modelcarsdb;


-- TASK 1-1:
select * from employees;
select count(*) as total_employees from employees;
-- Interpretation: 
-- This query counts how many employees are listed in the employee table. The result tells you the total number of employees.


-- TASK 1-2:
select * from employees;
select employeeNumber, firstName, lastName from employees;
-- Interpretation: 
-- This query shows a list of all employees, including their employee numbers, first names, and last names. It's like a basic employee directory.


-- TASK 1-3:
select * from employees;
select jobTitle, count(*) as number_of_employees from employees 
group by jobTitle;
-- Interpretation: 
-- This query tells you how many employees have each different job title. It groups employees by their jobs and counts how many people are in each group.


-- TASK 1-4:
select * from employees;
select employeeNumber, firstName, lastName from employees
where reportsTo is null;
-- Interpretation:
-- This query finds the employees who are the bosses of everyone else. They are the highest-ranking people in the company.


-- TASK 1-5:
select * from orderdetails;
select * from orders;
select * from customers;
select * from employees;
select sum(quantityOrdered*priceEach) as total_sales, em.employeeNumber, em.firstName, em.lastName from orderdetails as or_de 
join orders as od 
join customers as cus 
join employees as em
on or_de.orderNumber = od.orderNumber and od.customerNumber = cus.customerNumber 
and cus.salesRepEmployeeNumber = em.employeeNumber 
group by  em.employeeNumber;
-- Interpretation:
-- This query finds out how much each salesperson has sold. It adds up the total cost of each item they sold and shows their name and sales total.


-- TASK 1-6:
select * from orders;
select * from customers;
select * from employees; 
select sum(quantityOrdered*priceEach) as total_sales, emp.employeeNumber from orderdetails as od
inner join orders as o 
inner join customers as cus 
inner join employees as emp
on od.orderNumber = o.orderNumber and o.customerNumber = cus.customerNumber and cus.salesRepEmployeeNumber = emp.employeeNumber
group by  emp.employeeNumber;
-- Interpretation:
-- This query is like TASK 1.5, but it only shows the employee's number and the total sales they made, without showing their full name.


-- TASK 1-7:
select * from orderdetails;
select * from orders;
select * from customers;
select * from employees;
select concat(emp.firstName, " ",emp.lastName) as name, sum(od.quantityOrdered*od.priceEach) as sold, 
avg(od.quantityOrdered*od.priceEach) as avg_sales ,emp.employeeNumber 
from orderdetails as od
inner join orders as o
inner join customers as cus 
inner join employees as emp
on od.orderNumber = o.orderNumber and o.customerNumber = cus.customerNumber and cus.salesRepEmployeeNumber = emp.employeeNumber
group by name, emp.employeeNumber 
having sold > avg_sales;
-- Interpretation:
-- This query finds employees who sold more than their usual amount and shows only those who did better than average.
 
 
-- TASK 2-1:
select * from orders;
select * from orderdetails;
select avg(od.quantityOrdered*od.priceEach) as avg_order_amount, o.customerNumber from orderdetails as od
inner join orders as o 
on od.orderNumber = o.orderNumber 
group by customerNumber;
-- Interpretation:
-- This query calculates the average order value for each customer by grouping results based on customerNumber.


-- TASK 2-2:
select * from orders;
select count(orderNumber) as number_of_orders , month(orderDate) from orders as o 
group by month(orderDate);
-- Interpretation: 
-- This query tells you how many orders were placed each month. It groups the orders by month and shows the total number of orders for each month.
 
 
-- TASK 2-3:
select * from orders;
select orderNumber from orders 
where status = 'Pending';
-- Interpretation:
-- This query retrieves the orderNumber of all orders that have a status of 'Pending'.


-- TASK 2-4:
select * from customers;
select * from orders;
select o.orderNumber, cus.customerNumber, concat(cus.contactFirstName, " ", cus.contactLastName) as names from orders as o
inner join customers as cus 
on o.customerNumber = cus.customerNumber;
-- Intrepretation:
-- This query shows which customer placed each order. It joins two tables to get the order number, customer number, and the customer's full name.


-- TASK 2-5:
select * from orders;
select * from orders order by orderDate desc limit 3;
-- Interpretation:		
-- This query finds the last three orders from the orders table by sorting them by date from newest to oldest and showing only the top three.


-- TASK 2-6:
select * from orders;
select sum(quantityOrdered*priceEach) as total_sales , o.orderNumber from orders as o 
inner join orderdetails as od 
on o.orderNumber = od.orderNumber 
group by o.orderNumber;
-- Interpretation:
-- This query calculates total sales per order by multiplying quantityOrdered by priceEach from orderdetails, then summing the result and grouping by orderNumber.


-- TASK 2-7:
select * from orderdetails;
select * from orders;
select o.orderNumber, sum(quantityOrdered*priceEach) as total_sales from orders as o
inner join orderdetails as od 
on o.orderNumber = od.orderNumber
group by o.orderNumber 
order by total_sales desc limit 1;
-- Interpretation:
-- This query finds the highest-selling order by calculating total sales per order, grouping by orderNumber, ordering in descending order, and limiting to the top result.


-- TASK 2-8:
select * from orders;
select * from orderdetails;
select o.orderNumber, o.orderDate, od.productCode, od.quantityOrdered, od.priceEach from orders as o
inner join orderdetails as od 
on o.orderNumber = od.orderNumber;
-- Interpretation:
-- This query joins orders and orderdetails to retrieve comprehensive order details, including order number, order date, product code, quantity ordered, and price.


-- TASK 2-9:
select * from products;
select productLine, count(productName) from products 
group by productLine 
order by count(productName) desc;
-- Interpretation:
-- This query counts products per product line, orders the results in descending order, and shows product lines with the most products.



-- TASK 2-10:
select * from orders;
select * from orderdetails;
select o.orderNumber, sum(quantityOrdered*priceEach) as total_revenue from orders as o
inner join orderdetails as od 
on o.orderNumber = od.orderNumber 
group by o.orderNumber;
-- Interpretation:
-- This query calculates total revenue per order by multiplying quantityOrdered by priceEach from orderdetails, then summing the result and grouping by orderNumber.


-- TASK 2-11:
select * from orders;
select * from orderdetails;
select  o.orderNumber, sum(quantityOrdered*priceEach) as total_revenue from orders as o
inner join orderdetails as od 
on o.orderNumber = od.orderNumber 
group by o.orderNumber
order by total_revenue desc limit 5;
-- Interpretation:
-- This query finds the top 5 orders with the highest total revenue by calculating total revenue per order, ordering in descending order, and limiting to 5 results.



-- TASK 2-12:
select * from orderdetails;
select * from orders;
select o.orderNumber, o.orderDate, pro.productName, pro.productDescription, od.quantityOrdered, od.priceEach from orders as o
inner join orderdetails as od 
on o.orderNumber = od.orderNumber
inner join products as pro 
on od.productCode = pro.productCode;
-- Interpretation: 
-- This query combines information from orders, order details, and products to show information like order number, date, product name, description, quantity, and price.


-- TASK 2-13:
select * from orders;
select orderNumber from orders 
where shippedDate > requiredDate;
-- Interpretation:
-- This query finds orders that were shipped late by comparing the shipped date to the required date.


-- TASK 2-14:
select * from orderdetails;
select od1.productcode as p1, od2.productcode as p2
from orderdetails as od1
inner join orderdetails as od2 on od1.orderNumber = od2.orderNumber 
where od1.productCode < od2.productCode;
-- Interpretation:
-- Displayed product combinations within orders.



-- TASK 2-15:
select * from products;
select * from orderdetails;
select od.ordernumber, (od.quantityordered*od.priceeach) as total_revenue from products as p
inner join orderdetails as od 
on p.productCode=od.productCode
group by od.ordernumber, od.quantityordered, od.priceeach
order by total_revenue desc limit 10; 
-- Interpretation:
-- This query finds the 10 orders that made the most money by adding up the price of each item ordered for each order, then sorting them from highest to lowest.



-- TASK 2-16:
select * from customers;
select * from orders;
select * from orderdetails;
DELIMITER $$
create trigger upcustomer
after insert on orders for each row
BEGIN
insert into  orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
values (10001, '2023-10-01', '2023-10-07', '2023-10-05', 'Shipped', 'Test order', 103);
update customers set creditlimit=creditlimit - sum(new.quantityOrdered*new.priceEach)
where customernumber=new.customernumber;
END $$

insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
values (10001, 'S18_1749', 5, 19.99, 1);
select customernumber,creditlimit from customers;
-- Interpretation:
-- SQL code creates a trigger to update customer credit limit when a new order is placed. Trigger upcustomer inserts a sample order and updates credit limit. Order detail is also inserted.


-- TASK 2-17:
select * from orders;
select * from orderdetails where productcode='s10_4962';
select * from products;
DELIMITER $$
create trigger log_product
after insert on orderdetails 
for each row
BEGIN 
update products set quantityinstock = quantityinstock-new.quantityordered 
where productcode = new.productcode;
END $$

insert into orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
values (10, '2024-09-29', '2024-10-08','2024-10-06', 'inprogress', 'Test order1', 103);
insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
values (10, 'S10_4962', 91, 20.00, 1);
-- Interpretation:
-- SQL code creates a trigger to update product stock when a new order is placed. Trigger log_product subtracts ordered quantity from product stock. INSERT statements create a new order and order detail, activating the trigger.