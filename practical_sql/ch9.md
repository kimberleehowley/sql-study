# Chapter 9: Inspecting and modifying data 

## Interviewing data
_Interviewing data just means checking to see whether it contains what we need_. 

### Checking for duplicate entries
_We use meat and poultry data for this example_. 

`SELECT company, street, city, st, COUNT(*) AS address_count 
FROM meat_poultry_egg_inspect
-- GROUPs by unique combinations of company, street, city, st 
GROUP BY company, street, city, st
-- List only the group where that special combo happens more than once 
HAVING count(*) > 1
ORDER BY company, street, city, st;` 

### Checking for missing values 
- In a dataset about values from all states, a good sanity check is to evaluate how and if all states actually do have values. 
- So, query what we're expecting from data and see what's there to inspect. 
- We can check for "WHERE <value> IS NULL" when we want to look for missing data sets. 

### Checking for inconsistent values 
- GROUP BY can help find inconsistent values, e.g. scanning through and seeing what names have different spellings here: 

`SELECT company, COUNT(*) AS company_count 
FROM meat_poultry_egg_inspect
-- Groups by company name, then can scan list 
GROUP BY company 
ORDER BY company ASC;` 

### Checking for malformed values with length() 
- Some values (like Zip) need to be a certain length, and we can use the string function to confirm if they are where they should be, e.g. 

`-- SELECT length of zip, and the number of values that are in each of those lengths 
SELECT length(zip), count(*) AS length_count
FROM meat_poultry_egg_inspect
-- GROUP BY length of zip to see the number of values at each length 
GROUP BY length(zip)
ORDER BY length(zip) ASC;`

### Other notes 
- Make a list of all potential errors first and then run cleanup tasks. 

## Modifying tables, columns, and data 

### ALTER TABLE 
- ALTER TABLE lets us ADD COLUMN, ALTER COLUMN, DROP COLUMN 
_(Vs. UPDATE table, which lets us change values in a column.)_
`ALTER TABLE table_name ADD COLUMN column_name data_type;` 
`ALTER TABLE table_name DROP COLUMN column_name;` 
- Changing the data type of a column: 
`ALTER TABLE table_name ALTER COLUMN column_name SET DATA TYPE data_type;`
- Add a NOT NULL constraint:  
`ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL`; 
_Adding a constraint means all rows have to be evaluated, which can be timely_. 
- Remove the constraint: 
`ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL`; 

### MODIFY with UPDATE 
- Basic syntax: 

`UPDATE table_name 
SET column = value;` 

- Updating multiple at a time: 

`UPDATE table_name 
SET column_a = value, 
    column_b = value;`

- Updating a specific row: 

`UPDATE table_name 
SET column = value
WHERE criteria;` 

- Updating one table with values from another, using a subquery: 

`UPDATE table_name
SET column_name = (SELECT column_name
                    FROM table_name_b
                    WHERE table_name.column = table_name_b.column)
WHERE EXISTS (SELECT column_name 
                FROM table_b
                WHERE table.column = table_b.column);`

### Creating backup tables  
- Use SELECT * to create identical backups, e.g. 

`CREATE TABLE table_name_backup AS 
SELECT * FROM original_table;`

- Confirm by counting the number of rows in each: 

`SELECT 
    (SELECT count(*) FROM table_name) AS original, 
    (SELECT count(*) FROM table_name_backup) AS backup;`

### Restoring missing column values 

#### Creating column copies
- Useful to create copies of just column values using ADD COLUMN before making any column-wide updates, just in case, e.g. 
`ALTER TABLE table_name ADD COLUMN column_copy data_type; 
UPDATE table_name SET column_copy = original_column;`
- Confirm this worked by selecting both the column and column-copy values and scanning that they look as expected. 
- Then, if you mess up later, you can run an update statement that sets the messed up column back to its original values: 

`UPDATE meat_poultry_egg_inspect 
SET st = st_copy`; 

#### Updating rows where values missing 
- Use an UPDATE statement with criteria that SETs missing values where the column is empty. 

### Updating values for consistency 
- Create a copy of inconsistent data column. 

`ALTER TABLE table_name 
ADD COLUMN column_copy varchar(100);` 

`UPDATE table_name 
SET column_copy = column;` 

- Work in the new column to avoid messing up original data. 
- Use update statements with criteria. 

`UPDATE table_name 
SET column_copy = consistent value
WHERE column LIKE inconsistent value;`

- Verify your work: 
`SELECT column, column_copy
FROM column
WHERE column LIKE inconsistent value;`

### Repairing zip codes using concatenation
- Create a copy column, as before. 
- Use concatenation symbol to add the missing zeros, or any values, to the zip, or any column, e.g. 

`UPDATE meat_poultry_egg_inspect 
SET zip = '00' || zip
WHERE st IN ('PR', 'VI') AND length(zip) = 3;`

### Updating values across tables 
- You can connect tables with subqueries and the WHERE EXISTS keyword to update specific values 
- `WHERE EXISTS` functions kind of like joins, but in subqueries 

## Deleting unnecessary data 
- `DELETE FROM` for removing rows 
* To remove all rows: `DELETE FROM table_name;`
* Only selected rows: `DELETE FROM table_name WHERE _criteria;`

- `ALTER TABLE` for deleting columns: 
* `ALTER TABLE table_name DROP COLUMN column_name;`

- `DROP TABLE` to get rid of entire table 
* `DROP TABLE table_name`

## Using transaction blocks to save or revert changes 
- Transaction blocks help prevent errors from changes to tables that are final (e.g. updating and removing columns)
- They wrap SQL statements 
- `START TRANSACTION`: start the transaction. 
- `COMMIT`: if the update you want to make looks good, use this to make it permanent. 
- `ROLLBACK`: if the updates you want look bad, run this until you're satisfied with them (then commit) 

## Improving performance when updating large tables 
- In PostgresSQL, every time you add a column with values to a table can increase size, because the database creates a new version of each row every time the value is updated, but doesn't get rid of the old. 
- Copying the entire tale over actually saves disk space. 
- You can use the `RENAME TO` clause to change table names, so you can change a temp and backup tables to the original table name instead of adding column values. 
