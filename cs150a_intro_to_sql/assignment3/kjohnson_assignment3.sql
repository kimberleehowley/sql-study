/* Assignment3.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */ 
USE bookstore; 

/* Query 1 */ 
SELECT *
FROM customer 
WHERE customer_id BETWEEN 44449 AND 88889; 

/* Query 2 */ 
SELECT first_name, last_name, salary 
FROM employee
WHERE salary != 3400 
AND salary != 6000 
AND last_name LIKE 'V%'; 

/* Query 3 */ 
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL; 

/* Query 4 */ 
SELECT last_name, first_name
FROM customer
WHERE first_name LIKE '%an%'
ORDER BY last_name DESC; 

/* Query 5 */ 
SELECT product_id, product_name, list_price
FROM product
WHERE list_price BETWEEN 150 AND 750;  

/* Query 6a, range operator */ 
SELECT order_id, order_date
FROM orders
WHERE order_date BETWEEN '2015-04-01' AND '2015-04-30'
ORDER BY order_date DESC;  

/* Query 6b, logical operators */ 
SELECT order_id, order_date
FROM orders
WHERE order_date >= '2015-04-01' 
AND order_date <= '2015-04-30'
ORDER BY order_date DESC; 

/* Query 6c, search pattern */ 
SELECT order_id, order_date
FROM orders
WHERE order_date LIKE '2015-04-%'; 

/* Query 7 */ 
SELECT order_id, ship_date
FROM orders
WHERE ship_date > '2015-03-10'; 

/* Query 8 */ 
SELECT order_id, order_date
FROM orders
WHERE order_date <= '2015-04-15'; 

/* Query 9 */ 
SELECT product_id, product_code, product_name 
FROM product
WHERE product_name LIKE 'D__L%'
ORDER BY product_code DESC; 

/* Query 10 */ 
SELECT product_id, category_id, vendor_id, list_price 
FROM product
WHERE category_id IN (21, 31)
AND vendor_id IN (5, 9)
AND list_price >= 1100; 

/* Query 11 */ 
SELECT *
FROM orders
WHERE DATEDIFF(ship_date, order_date) >= 2;

/* Query 12 */ 
SELECT order_id, customer_id, order_date
FROM orders
WHERE ship_date IS NOT NULL; 

/* Query 13 */ 
SELECT DISTINCT order_id, quantity 
FROM orderitems; 

/* Query 14 */ 
SELECT order_id, order_date 
FROM orders
WHERE order_date > '2011-10-24'; 
