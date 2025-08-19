\c sql_learning

DROP TABLE IF EXISTS customers;

-- CHAR (Character)
-- VARCHAR (Variable Character)
-- SERIAL = Auto Increment
CREATE TABLE IF NOT EXISTS customers (
  id SERIAL,
  first_name VARCHAR(20),
  last_name VARCHAR(60),
  email VARCHAR(256), -- Is added on alter-table.sql
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders (
  id SERIAL,
  customer_id INT,
  amount NUMERIC(7, 2)
);