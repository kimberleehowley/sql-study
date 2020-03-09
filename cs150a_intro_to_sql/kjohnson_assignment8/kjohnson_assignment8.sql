/* kjohnson_assignment8.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore; 

/* Query 1 */
SELECT COUNT(*) as number_of_orders, SUM(tax_amount) AS sum_of_tax_amount
FROM orders; 

/* Query 2 */
SELECT product_id, COUNT(DISTINCT order_id) as NumOrders
FROM orderitems
GROUP BY product_id 
ORDER BY  NumOrders DESC; 

/* Query 3 */
SELECT c.category_name, COUNT(p.category_id) AS product_count, MAX(p.list_price) AS most_expensive_product 
FROM category c 
INNER JOIN product p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC; 

/* Query 4 */
SELECT c.email_address, SUM(oi.item_price * oi.quantity) AS item_price_total, SUM(oi.discount_amount * oi.quantity) AS discount_amount_total
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY item_price_total DESC; 

/* Query 5 */
SELECT c.email_address, COUNT(DISTINCT o.order_id) AS order_count, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total 
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY order_total DESC;

/* Query 6 */
SELECT c.email_address, COUNT(DISTINCT o.order_id) AS order_count, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total 
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
WHERE oi.item_price > 400
GROUP BY c.email_address
ORDER BY order_total DESC;