-- We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

-- Grab the salary * months and count all employees 
SELECT salary*months AS 'Earnings', count(*)
FROM Employee
-- But, make sure you're aggregating salary*month counts, so counting the number of employees in each salary bracket 
-- I could've also said "GROUP BY 1" here, to mean first column 
GROUP BY salary*months
-- Order starting from the highest earnings
ORDER BY Earnings DESC
-- Only show me the highest 
LIMIT 1; 

-- Learnings 
-- Remember: Instead of using MAX, which you couldn't do a calculation in, you can just do an ORDER BY plus a limit to get 1 value