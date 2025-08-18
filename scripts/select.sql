\c sql_learning

-- WARNING: SELECT ONLY COLUMNS THAT YOU NEED
-- "AS" define a column alias
-- PostGreSQL define columns on lowercase
-- "*" get all columns

SELECT 
  *
FROM 
  customers;

SELECT 
  id, 
  first_name AS "firstName",
  last_name AS "lastName",
  email,
  created_at AS "createdAt"
FROM 
  customers;