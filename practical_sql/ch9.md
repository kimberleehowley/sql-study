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

### Other notes 
- Make a list of all potential errors first and then run cleanup tasks. 