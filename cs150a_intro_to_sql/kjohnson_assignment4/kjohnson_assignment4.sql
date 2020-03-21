/* Assignment4.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */


/* Query 0 */
USE bookstore; 

/* Query 1 */
CREATE TABLE jobs (
job_id INT PRIMARY KEY AUTO_INCREMENT, 
job_title VARCHAR(50), 
min_salary INT, 
max_salary INT
); 

/* Query 2*/
INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
VALUES 
(1, 'President', 100000, 100000), 
(2, 'Marketing', 5000, 75000), 
(4, 'Sales Manager', 15000, 60000), 
(8, 'Sales Rep', 10000, 30000), 
(16, 'Programmer', 60000, 120000), 
(32, 'Code Debugger', 60000, NULL), 
(64, 'DBA', 60000, NULL), 
(128, 'RD', 60000, NULL);

/* Query 3*/
ALTER TABLE jobs 
	ADD date_added DATE; 

/* Query 4*/
SELECT * 
FROM jobs; 

/* Query 5*/
SHOW COLUMNS FROM jobs; 

/* Query 6*/
ALTER TABLE jobs 
	DROP date_added; 
    
/* Query 7*/
RENAME TABLE jobs to jobs_backup; 

/* Query 8*/
SHOW TABLES; 

/* Query 9*/
DROP TABLE IF EXISTS jobs_backup; 

/* Query 9.5*/
SHOW TABLES; 

/* Query 10*/
ALTER TABLE store 
	ADD phone_number varchar(15); 
    
/* Query 11*/
ALTER TABLE store
	DROP phone_number;  
