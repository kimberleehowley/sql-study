/* Assignment1.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */ 
select user(), current_date(); 

/* Query 1 */ 
DROP DATABASE zoo; 
CREATE DATABASE IF NOT EXISTS zoo;
USE zoo; 

/* Query 2 */ 
DROP TABLE IF EXISTS animal; 
CREATE TABLE animal (
    animal_id INTEGER NOT NULL, 
    animal_name VARCHAR(25) NULL, 
    animal_type VARCHAR(25) NOT NULL, 
    animal_cost DECIMAL(7, 2) UNSIGNED NOT NULL, 
    animal_dob DATETIME NOT NULL, 
    animal_acquired DATE NOT NULL 
);

/* Query 3 */ 
INSERT INTO animal VALUES 
    (26, 'Grace', 'Panther', 1000.00, '2019-07-04 11:00:00', '2019-07-04');
INSERT INTO animal VALUES 
    (29, 'Frankie', 'Flamingo', 5000.00, '2019-10-12 11:00:00', '2019-10-12');
INSERT INTO animal VALUES 
    (42, 'Bianca', 'Leopard', 3000.00, '2018-10-12 11:00:00', '2018-10-12');
INSERT INTO animal VALUES 
    (57, 'Magoo', 'Lion', 1000.00, '2017-03-04 11:00:00', '2017-03-04');
INSERT INTO animal VALUES 
    (31, 'Tofu', 'Tiger', 7000.00, '2016-05-04 11:00:00', '2016-05-04');
INSERT INTO animal VALUES 
    (31, 'Chloe', 'Kangaroo', 8000.00, '2015-01-01 11:00:00', '2015-01-01');

/* Query 4 */ 
SHOW TABLES;

/* Query 5 */ 
DESC animal;

/* Query 6 */ 
SELECT *
FROM animal;

/* Query 7 */ 
SELECT animal_name, animal_type FROM animal;

/* Query 8 */ 
SELECT animal_name, animal_id, animal_cost, animal_dob, animal_acquired FROM animal;