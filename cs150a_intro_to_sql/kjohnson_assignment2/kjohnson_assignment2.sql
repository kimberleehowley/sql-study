/* Assignment2.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */ 
USE bookstore; 

/* Query 1 */ 
SELECT product_name, description 
FROM product 
WHERE category_id < 41; 

/* Query 2 */ 
SELECT last_name, first_name, customer_id 
FROM customer 
WHERE customer_id != 77779;

/* Query 3 */ 
SELECT last_name, first_name, customer_id, email_address
FROM customer 
WHERE customer_id = 88889; 

/* Query 4 */ 
SELECT item_id, item_price, discount_amount, quantity, 
item_price * quantity AS price_total, 
discount_amount * quantity AS discount_total, 
 (item_price - discount_amount) * quantity AS item_total
FROM orderitems
WHERE (item_price - discount_amount) * quantity > 500
ORDER BY item_total; 

/* Query 5 */ 
SELECT item_id, order_id, item_price
FROM orderitems
WHERE item_price < 1000
ORDER BY item_price DESC; 

/* Query 6 */
SELECT customer_id, email_address
FROM customer;

/* Query 7 */
SELECT DISTINCT customer_id 
FROM orders; 

/* Query 8 */
SELECT product_name, list_price, discount_percent, 
list_price * (discount_percent/100) AS discount_amount, 
list_price - (list_price * (discount_percent/100)) AS discount_price 
FROM product
ORDER BY discount_price
LIMIT 5; 

/* Query 9 */
SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM employee; 

/* Query 10 */
SELECT customer_id, line1, line2, CONCAT(city, ', ', state) AS city_and_state, zip_code
FROM address; 

/* Query 11 */
/* I'm deliberately deciding NOT to use DISTINCT here, even though there is a name that seems to have been stored twice, because the instructions specify each name, not each unique name. */
SELECT category_id, product_name
FROM product; 

/* Query 12 */
SELECT product_name, list_price, ROUND(list_price * 1.08, 2) AS new_list_price
FROM product;