\c sql_learning

SELECT
	cus.*,
	SUM(ord.amount) AS total_spent
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id
GROUP BY cus.id
;

SELECT
	cus.*,
	SUM(ord.amount) AS total_spent
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id
GROUP BY cus.id
HAVING SUM(ord.amount) > (
	SELECT AVG(sub_ord.amount)
	FROM orders AS sub_ord
)
ORDER BY cus.id
;


SELECT * 
FROM orders AS ord 
WHERE ord.customer_id IN (
	SELECT cus.id
	FROM customers AS cus 
	WHERE cus.first_name LIKE '%5'
);

SELECT
	cus.*,	
	(
		SELECT MAX(sub_ord.amount) 
		FROM orders AS sub_ord
		WHERE sub_ord.customer_id = cus.id
	) AS max_order_value
FROM customers AS cus
ORDER BY cus.id
;