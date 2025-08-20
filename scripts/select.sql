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

SELECT 
  * 
FROM
  customers
ORDER BY first_name DESC; -- DESC = DESCENDING OR ASC = ASCENDING

SELECT 
  * 
FROM
  customers
ORDER BY 
  first_name ASC,
  created_at DESC; -- Can be used with more than one column

SELECT 
  * 
FROM
  customers
ORDER BY 
  first_name ASC,
  created_at DESC; -- Can be used with more than one column

SELECT 
  * 
FROM
  customers
ORDER BY id ASC
LIMIT 5 -- Limit the number of rows returned
OFFSET 4; -- Skip the first 5 rows


SELECT 
  *
FROM 
  customers
WHERE -- Filter rows
  (id = 10 AND first_name != 'Ian')
  OR (last_name = 'Doe-1' AND id > 15)
  OR id IN(1, 8, 3)
;

SELECT 
  *
FROM 
  customers
WHERE -- Filter rows
  email ILIKE '%Customer.1%'
;