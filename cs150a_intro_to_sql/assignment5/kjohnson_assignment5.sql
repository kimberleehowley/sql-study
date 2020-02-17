/* kjohnson_assignment5.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE library; 

/* Query 1 */
DROP TABLE IF EXISTS branch_staff; 
DROP TABLE IF EXISTS computer_staff; 
DROP TABLE IF EXISTS staff; 
DROP TABLE IF EXISTS computer; 

/* Create staff table */
CREATE TABLE staff 
(
    staff_id INT PRIMARY KEY AUTO_INCREMENT, 
    fname VARCHAR(50),  
    lname VARCHAR(50), 
    phone VARCHAR(15), 
    email VARCHAR(50)

); 

/* Create computer_staff table */
CREATE TABLE computer_staff 
(
    -- serial_number is a foreign key, references computer 
    serial_number VARCHAR(50) REFERENCES computer(serial_number),
    -- staff_id is a foreign key, references staff
    staff_id INT REFERENCES staff(staff_id),
    date_assigned DATE
); 

/* Create computer table */
CREATE TABLE computer 
(
    /* Despite the sample data, I googled and learned serial numbers can contain letters and be up to 50 characters */
    -- So I'm setting serial_number as VARCHAR
    serial_number VARCHAR(50) PRIMARY KEY ON DELETE CASCADE, 
    make VARCHAR(10), 
    model VARCHAR(50), 
    processor_type VARCHAR(50), 
    speed DECIMAL(9,2), 
    main_memory VARCHAR(50), 
    disk_size VARCHAR(50), 
    staff_id INT REFERENCES staff(staff_id)
); 

/* Create branch_staff table */
CREATE TABLE branch_staff 
(
    -- branch_id is a foreign key, references branch 
    branch_id INT REFERENCES branch(branch_id), 
    -- staff_id is a foreign key, references staff 
    staff_id INT REFERENCES staff(staff_id), 
    contact VARCHAR(50)
);

