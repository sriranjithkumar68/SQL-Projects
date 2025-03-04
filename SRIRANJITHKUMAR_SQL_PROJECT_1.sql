use modelcarsdb;
select * from customers;


-- TASK 1 CUSTOMER DATA ANALYSIS:

-- TASK 1 (1):
select customerNumber, customerName, creditLimit from customers order by creditLimit desc limit 10;
-- Interpretation:
-- In this task we just took customers table and we took credit limit column and we got the output in descending order because we need top 10.

-- TASK 1 (2):
select * from customers;
select avg(creditLimit), country from customers group by country;
-- Interpretation:
-- in this task we took customers table and have calculated average using average function and grouped them based on the country.

-- TASK 1 (3):
select * from  customers;
select count(customerName),state from customers group by state;
-- Interpretation:
-- In this task we need to calculate the number of customers so we used count funtion and we grouped them based on state.

-- TASK 1 (4):
select  * from orders;
select  * from customers;
select customerNumber, customerName from customers 
where customerNumber not in (select customerNumber from orders);
-- Interpretation:
-- In this task we took customers and orders table and we want to get customer number and name who are not in orders table so we used subquery.

-- TASK 1 (5):
select  * from orders;
select  * from customers;
select  * from orderdetails;
select c.customerNumber, c.customerName, sum(od.quantityOrdered * od.priceEach) from customers as c 
inner join orders as o on c.customerNumber=o.customerNumber
inner join orderdetails as od on o.orderNumber=od.orderNumber group by c.customerNumber, c.customerName;
-- Interpretation:
-- In this task we took orders, customers and order details and we calculated total price by quantity ordered and price each and used inner join to join the tables.

-- TASK 1 (6):
select  * from employees;
select  * from customers;
select c.customerName, c.customerNumber, c.contactLastName, c.contactFirstName from customers as c 
inner join employees as e on c.salesRepEmployeeNumber = e.employeeNumber 
order by customerNumber asc;
-- Interpretation:
-- In this task we took employees and customers table and then we displayed customer name, number, firstname and lastname and then we joined using inner join with common columns in both table.

-- TASK 1 (7):
select * from customers;
select * from payments;
select customers.customerNumber, customers.customerName, payments.amount, max(paymentDate) as payments_details
from customers inner join payments on customers.customerNumber = payments.customerNumber
group by customers.customerNumber, customers.customerName, payments.amount;
-- Interpretation:
-- In this task we used customers and payments table and retrieved the customer information based on latest payments. 

-- TASK 1 (8):
select * from customers;
select cus.customerNumber, cus.customerName from customers as cus where creditLimit = 0;
-- Interpretation:
-- In this task we used customers table and we got the customer details who's credit limit is exceeded.


-- TASK 1 (9):
select * from customers;
select * from orderdetails;
select * from orders;
select * from products;
select * from productlines;
select cus.customerNumber, cus.customerName, pro.productName, pro.productLine from customers as cus 
inner join orders as o inner join orderdetails as od inner join products as pro on cus.customerNumber = o.customerNumber
and o.orderNumber = od.orderNumber and od.productCode = pro.productCode
where pro.productLine = 'Classic Cars' 
group by cus.customerNumber, cus.customerName, pro.productName;
-- Interpretation:
-- In this task we took customers, orders, orderdetails and products table and we used "Classic cars" as input and we got the customer details we used inner join to join the tables.

-- TASK 1 (10):
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;
select cus.customerNumber, cus.customerName, max(od.priceEach), pro.productName, pro.productLine from customers as cus 
inner join orders as o inner join orderdetails as od inner join products as pro 
on cus.customerNumber =  o.customerNumber
and o.orderNumber = od.orderNumber
and od.productCode = pro.productCode
group by cus.customerNumber, cus.customerName, pro.productName, pro.productLine
order by max(od.priceEach) desc;
-- Interpretation:
-- In this task we customers, order, orderdetails and products table amd we calculated the expensive product using max function and joined the tables using inner join and we got the cutomer details.


-- TASK 2 (1):
select * from customers;
select * from employees;
select count(em.employeeNumber), em.officecode, em.firstName, em.lastName from employees as em
group by em.officecode, firstName, lastName;
-- Interpretation:
-- In this task we took employees table and and then counted the number of employees using count funtion on got the output.


-- TASK 2 (2):
select * from employees;
select * from offices;
select offi.officeCode, offi.city, offi.country, count(emp.employeeNumber) as number_of_employees
from offices offi
left join employees emp on offi.officeCode = emp.officeCode
group by offi.officeCode, offi.city, offi.country
having count(emp.employeeNumber) < 6;
-- Interpretation:
-- In this task we took employees and offices table and this query gets the office codes and names of employees from offices that have fewer than 6 employees, showing each employee's first and last name.



-- TASK 2 (3):
select * from offices;
select officecode, territory, city, country from offices;
-- Interpretation:
-- In this task we took offices table and we just printed the office code based on their locations.


-- TASK 2 (4):
select * from employees;
select officeCode, concat(firstName,' ', lastName) as no_emp from employees where officeCode is null;
-- Interpretation:
-- In this task we took employees table and got the office code who's value is null.


-- TASK 2 (5);
select * from offices;
select * from orders;
select * from customers;
select * from employees;
select * from orderdetails;
select * from products;
select sum(od.quantityOrdered * od.priceEach), offi.officeCode as most_profit from offices as offi 
inner join employees as em 
inner join customers as cus
inner join orders as o
inner join orderdetails as od 
on em.officeCode = offi.officeCode and 
cus.salesRepEmployeeNumber = em.employeeNumber and 
o.orderNumber = od.orderNumber
group by offi.officeCode
order by sum(od.quantityOrdered * od.priceEach) desc limit 10;
-- Interpretation:
-- In this task we took offices, employees, customers, orders and order details table and we calculated the total sales by multiplying quantity ordered and price each and we got the most profitable offices based on total sales we used inner join to join the tables.


-- TASK 2 (6):
select * from employees;
select officeCode, count(employeeNumber) from employees as emp group by officeCode order by count(employeeNumber) desc limit 5;
-- Interpretation:
-- This task we shows the top 5 office codes with the highest number of employees.



-- TASK 2 (7):
select * from customers;
select * from offices;
select * from employees;
select offi.officeCode, avg(cus.creditLimit) from customers as cus
inner join employees as emp
inner join offices as offi
on cus.salesRepEmployeeNumber = emp.employeeNumber and
emp.officeCode = offi.officeCode 
group by offi.officeCode;
-- Interpretation:
-- This query calculates the average credit limit of customers for each office by linking customers to their sales representatives and the offices they belong to.



-- TASK 2 (8):
select * from offices;
select count(officeCode) as no_of_offi, country from offices group by country;
-- Interpretation:
-- In this task we took offices table and we calculated the number of offices in each country using count function and we grouped them based on country.

-- TASK 3 (1):
select * from products;
select count(productCode) as no_of_products, productLine from products 
group by productLine;
-- Interpretation:
-- This query counts how many products there are in each product line and shows the total for each line.



-- TASK 3 (2):
select * from products;
select * from productLines;
select * from orderdetails;
select avg(od.priceEach) as averagr_price, pro.productLine from products as pro 
inner join orderdetails as od
on pro.productCode = od.productCode
group by pro.productLine 
order by avg(od.priceEach) desc;
-- Interpretation:
-- This query calculates the average price of products in each product line and lists them from highest to lowest average price because we used descending order.


-- TASK 3 (3):
select * from products;
select productLine, MSRP from products 
where MSRP>=50 and MSRP<=100
order by MSRP desc;
-- Interpretation:
-- This query retrieves product lines and their prices for products that cost between 50 and 100, sorted from highest to lowest price.

-- TASK 3 (4):
select * from products;
select * from orderdetails;
select sum(od.quantityOrdered * od.priceEach), pro.productLine from products pro
 inner join orderdetails od
 on pro.productCode = od.productCode 
 group by productLine
 order by sum(od.quantityOrdered * od.priceEach) desc;
 -- Interpretation:
 -- This query calculates the total sales amount for each product line by multiplying the quantity ordered by the price for each product, and it sorts the results from highest to lowest total sales.
 
 
 -- TASK 3 (5):
 select * from products;
 select productName, productCode,quantityInStock from products
 where quantityInStock <=10;
 -- Interpretation:
 -- In this task we took products table and lists the names, codes, and stock quantities of products that have 10 or fewer items in stock.
 
 
-- TASK 3 (6): 
select * from products;
select productName, productCode, productLine, MSRP from products 
order by MSRP desc limit 5;
-- Interpretation:
-- In this task we took products table and retrieves the names, codes, lines, and prices of the top 5 most expensive products, sorted from highest to lowest price.


-- TASK 3 (7):
select * from products;
select * from orderdetails;
select sum(od.quantityOrdered * priceEach) as total_sales,productline from products as pro
inner join orderdetails as od 
on pro.productCode = od.productCode 
group by productLine 
order by sum(od.quantityOrdered * priceEach) desc;
-- Interpretation:
-- For this task we tool products and order details table and calculated the total sales for each product line by multiplying the quantity ordered by the price and sorts the results from highest to lowest total sales.


-- TASK 3 (8):
DELIMITER //
create procedure get_total_selling (in i_total_selling_por int)
BEGIN 
select pro.productName, pro.productCode, sum(od.quantityOrdered) as quantity_ordered
from products as pro
inner join orderdetails as od 
on pro.productCode = od.productCode
group by pro.productName, pro.productCode;
END; //

call  get_total_selling(2);
-- Interpretation:
-- This code creates a procedure that retrieves the total quantity ordered for each product and then calls that procedure, but the input parameter is not used in the query.

-- TASK 3 (9):
select * from products;
select productCode, productName, productLine from products 
where (quantityInStock <=10) and productline in ('classic cars', 'motorcycles');
-- Interpretation:
-- This query retrieves the codes, names, and lines of products that are in the 'classic cars' or 'motorcycles' categories and have 10 or fewer items in stock.


--TASK 3 (10):
select * from products;
select * from orderdetails
select * from orders;
select * from customers;
select count(cus.CustomerNumber), pro.productLine, pro.productCode, pro.productName
from products as pro
inner join orderdetails as od
inner join orders as o
inner join customers as cus
on pro.productCode = od.productCode
and od.orderNumber = o.orderNumber 
and o.customerNumber = cus.customerNumber
group by pro.productLine, pro.productCode, pro.productName
having count(cus.customerNumber)>10;
-- Interpretation:
-- This query counts how many customers ordered each product and lists the product lines, codes, and names for products that have been ordered by more than 10 customers.



--TASK 3 (11)
select * from productlines;
select * from products;
select * from orderdetails;
select * from orders;
select  pro.productName, pro.productLine, od.quantityOrdered from products as pro 
inner join orderdetails as od 
on od.productCode = pro.productCode
where od.quantityOrdered > (select avg(quantityOrdered) from orderdetails )
group by pro.productName, pro.productLine, od.quantityOrdered;
 -- Interpretation:
 -- In this task we took productline, products, order details and orders and lists the names and lines of products that have been ordered more than the average quantity, along with the quantity ordered for each.