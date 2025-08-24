\c sql_learning

SELECT
  id,
  CONCAT(first_name, ' ', last_name) AS full_name
FROM
  customers;

SELECT
  COUNT(id) AS total_registers
FROM
  customers;

SELECT
  customer_id,
  COUNT(id) AS total_orders,
  SUM(amount) AS total_revenue,
  MAX(amount) AS min_order,
  MIN(amount) AS max_order,
  ROUND(AVG(amount), 2) AS amount_average
FROM
  orders
GROUP BY customer_id
ORDER BY customer_id ASC
;

SELECT
  customer_id,
  COUNT(id) AS total_orders,
  SUM(amount) AS total_revenue,
  MAX(amount) AS min_order,
  MIN(amount) AS max_order,
  ROUND(AVG(amount), 2) AS amount_average
FROM
  orders
GROUP BY customer_id
HAVING SUM(amount) BETWEEN 500 AND 1000
ORDER BY customer_id ASC
;

SELECT 
	cus.*,
	JSON_AGG(ord.*) AS order
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id 
WHERE cus.id = 53
GROUP BY cus.id;

SELECT 
	cus.*,
	JSON_AGG(
		JSON_BUILD_OBJECT(
		  'id', ord.id,
		  'amount', ord.amount
		)
	) AS order
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id 
GROUP BY cus.id;

SELECT 
	cus.*,
	CASE
		WHEN COUNT(ord.id) THEN
		JSON_AGG(
			SON_STRIP_NULLS(
				JSON_BUILD_OBJECT(
				  'id', ord.id,
				  'amount', ord.amount
				)
			)
		)
		ELSE '[]'::JSON
	END
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id 
GROUP BY cus.id;