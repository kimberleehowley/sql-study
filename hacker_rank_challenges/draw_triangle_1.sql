-- REPEAT the symbol a varaible number of times, where that variable is set to another variable minus 1
SELECT REPEAT('* ', @NUMBER := @NUMBER - 1) 
FROM information_schema.tables, (SELECT @NUMBER:=21) t LIMIT 20