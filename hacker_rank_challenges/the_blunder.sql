SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) 
FROM EMPLOYEES;

-- Learning: 
-- CAST can convert int to VAR but not VARCHAR in MYSQL
-- REPLACE() can also work with integers in MYSQL
-- CEIL() grabs the nearest integer that is greater than or equal to the expression