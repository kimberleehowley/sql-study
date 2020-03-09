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