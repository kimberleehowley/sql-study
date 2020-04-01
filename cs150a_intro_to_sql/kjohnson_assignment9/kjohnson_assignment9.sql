/* kjohnson_assignment9.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore; 

/* Query 1 */
SELECT DISTINCT category_name 
FROM category c 
WHERE c.category_id IN 
   (SELECT DISTINCT category_id 
    FROM product)
ORDER BY category_name; 

/* Query 2 */
SELECT product_name, list_price
FROM product 
WHERE list_price > ALL 
   (SELECT 
    AVG(list_price) 
    FROM product)
ORDER BY list_price DESC;

/* Query 3 */
 SELECT category_name
 FROM category c
 WHERE EXISTS 
	(SELECT *
     FROM product 
     WHERE category_id = c.category_id); 

/* Query 4 */
SELECT email_address, order_id, order_date
FROM customer 
INNER JOIN orders on customer.customer_id = orders.customer_id
WHERE order_date = 
(SELECT MIN(order_date) 
FROM orders 
WHERE customer_id = customer.customer_id);

/* Query 5 */
SELECT product_id, product_name, list_price
FROM product 
WHERE product_id IN 
(SELECT product_id
FROM orderitems
GROUP BY product_id
HAVING count(*) > 1); 

/* Query 6 */ 
SELECT DISTINCT last_name, first_name 
FROM customer c
INNER JOIN orders o on o.customer_id = c.customer_id  
WHERE order_id IN 
(
SELECT order_id
FROM orderitems 
WHERE item_price > 300); 

/* Query 7 */ 
SELECT last_name, first_name, email_address 
FROM customer 
WHERE customer_id IN 
(
SELECT customer_id
FROM orders 
WHERE order_id IN (1, 2, 3)
); 

/* Query 8 */ 
SELECT last_name, first_name, email_address 
FROM customer 
WHERE customer_id IN 
(
SELECT customer_id 
FROM orders
WHERE order_id IN (
SELECT order_id
FROM orderitems
WHERE product_id IN (
SELECT product_id 
FROM product 
WHERE vendor_id IN 
(
SELECT vendor_id
FROM vendor 
WHERE company_name LIKE 'H%'
)
)
)
); 

/* Query 9 */ 
SELECT product_id, product_name, list_price
FROM product 
WHERE product_id = ANY
(SELECT product_id
FROM orderitems
GROUP BY product_id
HAVING count(*) > 2); 