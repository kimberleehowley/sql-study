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