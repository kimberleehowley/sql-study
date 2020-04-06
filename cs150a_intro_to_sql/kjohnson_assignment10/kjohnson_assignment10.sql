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

/* Query 4 */
CREATE OR REPLACE VIEW cheap_products AS 
SELECT *
FROM product 
WHERE list_price < 50
ORDER BY list_price DESC
WITH CHECK OPTION;

SELECT * FROM cheap_products; 

/* Query 5 */
INSERT INTO cheap_products (product_id, category_id, product_code, 
product_name, list_price, description, discount_percent, date_added, vendor_id)
VALUES(17888, 41, 'book db', 'Fundamental of Database Systems', 45.99, 
'Fundamental of Database Systems Elmasri', 20.00, '2015-06-01 11:12:59', 2);

-- Query to check work 
-- SELECT * 
-- FROM cheap_products 
-- WHERE product_id = 17888; 

/* Query 6 */
CREATE OR REPLACE VIEW contact AS 
SELECT contact_fname, phone
FROM vendor;

-- Added DISTINCT in select clause to prevent updates 
CREATE OR REPLACE VIEW contact AS 
SELECT DISTINCT contact_fname, phone
FROM vendor;

-- Return all columns 
SELECT * FROM contact; 

/* Query 7 */
CREATE OR REPLACE VIEW order_items AS 
SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date, 
	oi.item_price, oi.discount_amount, oi.item_price - oi.discount_amount AS final_price, oi.quantity, (oi.item_price - oi.discount_amount) * oi.quantity AS item_total, 
    p.product_name
FROM orders o 
INNER JOIN orderitems oi ON o.order_id = oi.order_id
INNER JOIN product p ON oi.product_id = p.product_id;

-- Returning all columns 
SELECT * FROM order_items; 

/* Query 8 */
CREATE OR REPLACE VIEW reorder_info AS 
SELECT p.product_id, p.product_name, v.contact_fname, v.phone
FROM product p 
INNER JOIN vendor v ON p.vendor_id = v.vendor_id; 

-- Return all rows 
SELECT * FROM reorder_info; 