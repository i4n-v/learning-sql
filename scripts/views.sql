\c sql_learning

DROP VIEW IF EXISTS customers_summary;

CREATE OR REPLACE VIEW customers_summary AS (
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
);

ALTER VIEW customers_summary RENAME COLUMN  total_orders TO "totalOrders";

SELECT * FROM customers_summary WHERE customer_id = 53;

SELECT * FROM pg_views WHERE viewname = 'customers_summary';



