
SELECT * 
FROM information_schema.TABLES
#WHERE TABLE_NAME LIKE '%CYBER%'
;

SELECT * 
FROM information_schema.COLUMNS
WHERE COLUMN_NAME LIKE '%CYBER%'
;

SELECT * 
FROM information_schema.VIEWS 
#WHERE TABLE_NAME LIKE '%CYBER%' 
#or VIEW_DEFINITION LIKE '%CYBER%'
;

SELECT * 
FROM mysql.proc 
WHERE TYPE = 'PROCEDURE'
#AND BODY LIKE '%CYBER%'
;

SELECT * 
FROM mysql.proc 
WHERE TYPE = 'FUNCTION'
#AND BODY LIKE '%CYBER%'
;

SELECT DISTINCT * 
FROM information_schema.STATISTICS
WHERE TABLE_NAME LIKE '%CYBER%'
;

SELECT * 
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_NAME LIKE '%CYBER%'
;