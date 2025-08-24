\c sql_learning;

-- INNER JOIN
SELECT 
	*
FROM customers AS cus
INNER JOIN orders AS ord ON ord.customer_id = cus.id
WHERE cus.id = 53;

-- LEFT OUTER JOIN
SELECT 
	*
FROM customers AS cus
LEFT OUTER  JOIN orders AS ord ON ord.customer_id = cus.id
WHERE cus.id = 53;

-- RIHT OUTER JOIN
SELECT 
	*
FROM customers AS cus
LEFT OUTER JOIN orders AS ord ON ord.customer_id = cus.id
WHERE cus.id = 53;

-- FULL OUTER JOIN
SELECT 
	*
FROM customers AS cus
FULL OUTER JOIN orders AS ord ON ord.customer_id = cus.id
WHERE cus.id = 53;

-- CROSS JOIN
SELECT 
	*
FROM customers AS cus
CROSS JOIN orders AS ord ON ord.customer_id = cus.id 
WHERE cus.id = 53;