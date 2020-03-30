/* kjohnson_assignment9.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore; 

/* Query 1 */
SELECT DISTINCT category_name 
FROM category c 
WHERE c.category_id IN (SELECT DISTINCT category_id FROM product)
ORDER BY category_name; 

/* Query 1 */
SELECT product_name, list_price 
FROM product 
WHERE list_price > ALL (SELECT AVG(list_price) FROM product)
ORDER BY list_price DESC;