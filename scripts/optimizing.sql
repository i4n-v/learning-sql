\c sql_learning

EXPLAIN ANALYSE VERBOSE
SELECT * 
FROM customers
WHERE first_name = 'Customer-10';

SELECT * FROM pg_indexes WHERE tablename = 'customers';

CREATE INDEX customers_first_name_idx ON customers(first_name);

DROP INDEX customers_first_name_idx;