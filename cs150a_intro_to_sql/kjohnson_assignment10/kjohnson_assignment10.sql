/* kjohnson_assignment10.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore; 

/* Query 1 */
CREATE OR REPLACE VIEW customer_address AS
SELECT c.customer_id, c.email_address, c.last_name, c.first_name,
	a.line1 AS ship_line1, a.line2 AS ship_line2, a.city AS ship_city, a.state AS ship_state, a.zip_code AS ship_zip
FROM customer c
INNER JOIN address a ON a.customer_id = c.customer_id; 
    
SELECT customer_id, last_name, first_name, ship_city, ship_state
FROM customer_address; 

/* Query 2 */
UPDATE customer_address
SET ship_line1 = '1990 Westwood Blvd.'
WHERE customer_id = 11119;

/* Query 3 */
CREATE OR REPLACE VIEW product_summary AS 
SELECT product_id, COUNT(*) AS order_count, SUM(item_price) AS order_total
FROM orderitems
GROUP BY product_id; 

SELECT * FROM product_summary; 

-- To show just the column names, without a SELECT 
SHOW COLUMNS FROM product_summary; 