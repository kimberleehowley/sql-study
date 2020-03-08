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