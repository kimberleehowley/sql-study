/* kjohnson_assignment7.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore; 

/* Query 1 */
SELECT c.category_name, p.product_name, p.list_price
FROM category c JOIN product p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name; 

/* Query 2 */
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code 
FROM customer c JOIN address a ON c.customer_id = a.customer_id 
WHERE c.email_address = 'heatheresway@mac.com'; 

/* Query 3 */
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code 
FROM customer c JOIN address a ON c.customer_id = a.customer_id 
WHERE a.address_id = c.shipping_address_id; 

/* Query 4 */
SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.quantity 
FROM orders o 
JOIN customer c ON o.customer_id = c.customer_id 
JOIN orderitems oi ON o.order_id = oi.order_id 
JOIN product p ON p.product_id = oi.product_id
ORDER BY last_name, order_date; 

/* Query 5 */
SELECT DISTINCT p.product_name, p.list_price 
FROM product p JOIN product p2
ON p.product_id = p2.product_id 
WHERE p.list_price = p2.list_price 
ORDER BY product_name; 

/* Query 6 */
SELECT p.product_id, p.product_name, p.list_price, v.company_name, c.category_name 
FROM product p 
JOIN category c ON p.category_id = c.category_id 
JOIN vendor v on p.vendor_id = v.VENDOR_id;

/* Query 7 */
SELECT p.product_id, p.product_name, p.list_price 
FROM product p JOIN category c 
WHERE c.category_name = 'Computer'
ORDER BY product_id; 

/* Query 8 */
SELECT oi.order_id AS order_id, o.order_date AS order_date, p.product_name AS product_name, oi.quantity AS quantity, (oi.quantity * (oi.item_price - oi.discount_amount)) AS amount
FROM orderitems oi JOIN orders o ON oi.order_id = o.order_id
JOIN product p ON oi.product_id = p.product_id; 

/* Query 9 */
SELECT c.first_name, c.last_name, o.order_id, o.order_date, o.ship_date
FROM customer c JOIN orders o ON o.customer_id = c.customer_id 
WHERE ship_date IS NULL
ORDER BY o.order_date; 

/* Query 10 */
SELECT c.last_name, c.first_name
FROM customer c JOIN orders o on c.customer_id = o.customer_id 
JOIN orderitems oi ON o.order_id = oi.order_id 
WHERE oi.item_price > 1300; 

/* Query 11 */
SELECT p.product_name
FROM customer c JOIN orders o on c.customer_id = o.customer_id 
JOIN orderitems oi ON o.order_id = oi.order_id 
JOIN product p on oi.product_id = p.product_id 
WHERE c.first_name = 'Christine' AND c.last_name = 'Brown'; 

/* Query 12 */
SELECT c.last_name, c.first_name, c.customer_id 
FROM customer c JOIN orders o on c.customer_id = o.customer_id 
JOIN orderitems oi ON o.order_id = oi.order_id 
JOIN product p on oi.product_id = p.product_id 
WHERE p.product_id = 2234; 