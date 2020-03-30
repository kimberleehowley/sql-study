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