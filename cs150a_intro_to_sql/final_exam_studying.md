# Final exam study guide 

## Review questions 

**What are the two required clauses for a SELECT statement?**
* SELECT and FROM. 

**How can you concatenate columns in a query?**
* Use the CONCAT function, e.g. `SELECT CONCAT(column1, '', column2) AS combined_columns FROM table`

**Distinguish between Char and VarChar data types.**
* _Char(n)_ creates fixed-length strings, where n is the number of characters
* _VarChar(n)_ creates variable-length strings, where the characters can be up to max n

**Explain two methods for defining a primary key using SQL.**
* _Column level_: e.g. `column_name data_type PRIMARY KEY column_attributes`
* _Table level_: e.g. `CONSTRAINT constraint_name PRIMARY KEY column_name`

**What is the optional keyword used to specify descending order for an ORDER BY clause?**
* DESC

**When must you define constraints at the table level rather than the column level?**
* If you need to define a constraint that refers to multiple columns in the table, you must write it at the table-level. A column-level constraint cannot refer to multiple columns at once. 

**What is the simplest way to determine whether a particular column can contain null values?**
* A _not null constraint_ prevents null values from being stored in a column. So, I would want to check if that particular column has a not null constraint on it, and I could do that with `SHOW COLUMNS FROM table_name`. 

**When should the VALUES clause be omitted from the INSERT INTO command?** 
* The VALUES clause can be omitted from INSERT INTO when the column values are specified in the same order as the table, and a value is coded for each column (no columns will be skipped). 

**Which clause of a SQL query is used to restrict the number of rows returned?**
* LIMIT 

**Which clause of a SQL query displays the results in a specific sequence?**
* ORDER BY  

**What is the difference between the PRIMARY KEY constraint and a UNIQUE constraint?** 
*  A _primary key_ does not allow null values even though all values must be unique, whereas a _unique_ constraint allows a null value to be one of the unique ones. 

**How many columns can be dropped in one ALTER TABLE command?** 
* In MySQL, we need a unique DROP statement for each column we're dropping. While there can be multiple DROP statements in one ALTER statement, soem columns are prevented from being dropped, e.g. you can't drop a column if it's a primary key column. 

**Can a column alias be referenced in an ORDER BY clause?** 
* Yes! If the alias is defined in the SELECT clause, it can be used in ORDER BY. 

**In what clause can an alias not be used?** 
* They can't be used in the WHERE clause. 

**What command displays the structure of a table?** 
* DESCRIBE

**A CHECK constraint can be added to an existing table using what command?**
* ALTER TABLE 

**When does a column alias require double quotation marks?**
* When the alias includes spaces or special characters 

**Is the BETWEEN condition inclusive or exclusive to its values?** 
* Inclusive 

**When should a percent sign (%) be used with the LIKE operator?**
* The `%` wildcard indicates that any character or characters can follow the letters before it, so it's useful when you're looking for a string that fits a pattern. For example, if you're looking for all cities that start with `San` in a cities database, you could run `SELECT * FROM Cities WHERE Name LIKE "San%"`. 

**When should an underscore symbol ( _ ) be used with the LIKE operator?**
* The `_` matches any single character. It should be used when looking for a string that contains a certain pattern with any letter in between. 

**What do you do to override the default order of the rules of precedence?**
* You can use parentheses to override. 

**List and describe the three logical operators.**
* _AND_: Combines two or more search conditions; both must be true in order for a result to be returned. 
* _OR_: Combines two or more search conditions, only one must be true to return results. 
* _NOT_: Negates a search condition. 

**What logical operator is calculated first?**
* NOT is evaluated first, followed by AND, then OR. 

**What three clauses are contained in most SQL retrieval statements?**
* SELECT, FROM, and WHERE 

**What command is used to change existing data in a table?** 
* UPDATE 

**What happens if the WHERE clause is omitted in a UPDATE or DELETE?** 
* All rows in the table will be updated or deleted -- gulp! 

**What is the purpose of a column qualifier? When are you required to use one?**
* If you are joining two tables that have a column with the same name, you need to use a column qualifier to distinguish between them. You do so by typing the table name, then a period, then the column you're looking for. 

**What is the difference between the UNION and UNION ALL set operators?**
* A _UNION_ statement combines the result sets of two or more SELECT statements into one result set. 
* By default, a _UNION_ eliminates duplicate rows, but a _UNION ALL_ will include duplicates. 

**What are the differences between using the JOIN...USING and JOIN...ON approaches for joining tables?** 
* _JOIN...ON_: Returns results where tables overlap, based on where tables have columns in commmon. 
* _JOIN...USING_: You can use USING when there is a column that exists in both tables. It simplifies the syntax for joining tables. The join must also be an equijoin, meaing the equals operator is used to compare the two columns. 

**Explain how to combine queries using the UNION clause.** 
* First, you write the first SELECT query. 
* Then, instead of ending with a semicolon, you use the UNION keyword. 
* Under the UNION keyword, you write the second SELECT query. 
* The result of each SELECT must have the same number of columns, and the data types must be compatible. 

**Compare and contrast subqueries and joins.**
* _Joins_: Find overlapping results between two tables based on a condition (column) the two tables have in common. 
* _Subqueries_: Don't have to just compare two tables. They can be used in the WHERE clause to limit results based on calculations within that table, and also to compare tables (these are called correlated subqueries). They can also be used in the HAVING clause as a search condition, the FROM clause as a table specification, and the SELECT clause as a column specification. 

**Discuss the differences between an equijoin, inner join, and outer join.**
* _Equijoin_: Equals operator is used to compare the two columns. 
* _Inner join_: _Only_ rows that satisfy the join condition are included in the result set. 
* _Outer join_: Returns all matching rows _and_ unmatched rows in the left or right table. 

**Define three types of join commands and use SQL to write these commands.**
* _Left join_: Includes all the the rows from the first (left) table 
* _Cross join_: Produces each row from the first table joined with each row from the second table. Result = Cartesian product. 
* _NATURAL_ keyword: Joins automatically based on all columns in the two tables that have the same name 

**What is a self-join and how is it used?** 
* _Self-join_: Joins a table to itself. You must use aliases for the table, and you must qualify each column name with itself. They can be used to get a subset of data from a single table, and are used often as a last resort, when data can't be retrieved another way. 

**In which clause should you include the condition "dnumber = 4" to restrict the rows processed by a query?** 
* WHERE 

**In which clause should you include the condition MAX(salary) > 60000 to restrict groups displayed in the query results?**
* WHERE 

**Which group function can be used to perform a count that includes NULL values?**
* COUNT(*)

**How is the HAVING clause different from the WHERE clause?**
* _HAVING_ is used after a GROUP BY, so after results have been grouped together, whereas _WHERE_ is used outside of groups. A WHERE can come before a HAVING, but not after. 

**Which group functions can be used on date values?**
* _MAX()_ 
* _MIN()_ 
* _COUNT()_ 

**How are the 'group by' and 'having' clauses used?**
* _GROUP BY_ combines results from a dataset, determining how those results will be cominbed or grouped. _HAVING_ determines which of those groups will be included in the final result. 

**Which are the aggregate functions that work with both numeric and character data columns?** 
* _MAX()_ 
* _MIN()_ 
* _COUNT()_ 

**Explain the difference between single-row and group functions.**
* While single-row functions operate on single values, group functions operate on a series of values and return a single summary value. 

**Which clause is used to restrict the records retrieved from a table? Which clause restricts groups displayed in the query results?**
* _WHERE_ restricts records retrieved from a table. 
* _HAVING_ restricts groups.  

**Give an example of a keyword.**
* SELECT 

**Give an example of a clause.**
* CHARSET: sets character set at database, table, or column level 

**What two ways can the sort condition of the ORDER BY clause be written? Give an example of each.**
* ASC: In ascending order, e.g. `SELECT Name FROM Students ORDER BY Name ASC` returns names in alphabetical order
* DESC: In descending order, e.g. `SELECT Name FROM Students ORDER BY Name DESC` returns names in reverse alphabetical order 

**Which command should you use to copy data from one table and have it added to an existing table?** 
* `INSERT INTO table1 SELECT columns FROM table2;`

**When do changes generated by DML operations become stored in database table permanently?**
* By default, MySQL automatically commits changes immediately to the database after each INSERT, UPDATE, or DELETE. 

**How is a user password assigned in MySQL?**
* `IDENTIFIED BY` after a `CREATE USER` statement 
* Can also be changed with `SET PASSWORD` 

How can you assign a password to a role?

How can you remove a user account from MySQL?

What’s the difference between a single-row subquery and a multiple-row subquery?

What happens if a single-row subquery returns more than one row of results?

Which SQL clause(s) can’t be used in a subquery in the WHERE or HAVING clauses?

What’s the difference between correlated and uncorrelated subqueries?

What type of situation requires using a subquery?

How is a simple view different from a complex view?

Under what circumstances is a DML operation not allowed on a simple view?

What is a view? Discuss the difference between a view and a base relation.

What restrictions are necessary to ensure that a view is updatable?

**What’s the purpose of the WITH CHECK OPTION constraint?** 
* Prevents an update if that update causes the row to be excluded from a View. 


**Discuss the problems that can be caused by data redundancy.**
* Data redundancy can waste storage space, cause maintenance problems if data is likely to change (e.g. each row that contains a value must be updated).

Consider the following relations for a database that keeps track of student
enrollment in courses and the books adopted for each course: 
STUDENT (SSN, Name, Major, Bdate)
COURSE (CourseID, Quarter, Grade)
ENROLL (SSN, CourseID, Quarter, Grade)
BOOK_ADOPTION (CourseID, Quarter, Book_ISBN) TEXT (Book_ISBN, Book_Title, Publisher, Author)

Specify the foreign keys for this schema, stating any assumptions you make.

-- Query 1 
SELECT jobID, description, jobType
FROM BookJob
WHERE pubID = (SELECT pubID FROM Publisher WHERE pubName = 'Brown Paper Press');; 

-- Query 2 
SELECT pubName, telNo
FROM Publisher p
JOIN BookJob b USING (pubID) 
WHERE b.jobTYpe = 'R'; 

-- Query 3 
SELECT poDate
FROM PurchaseOrder po 
INNER JOIN BookJob b USING (jobID)
WHERE b.pubId = (SELECT pubID FROM Publisher WHERE pubName = 'Gold Press'); 

-- Query 4 
SELECT pubName, count(*)
FROM Publisher
GROUP BY creditCode; 

-- Query 5 
SELECT jobType, count(*) AS numberOfJobs
FROM BookJob
GROUP BY jobType 
HAVING count(*) >= 3; 

-- Query 6 
SELECT AVG(price)
FROM Item; 

-- Query 7 
SELECT * 
FROM Item 
WHERE price < (SELECT AVG(price) FROM Item); 

