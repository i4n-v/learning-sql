\c sql_learning

DROP TABLE IF EXISTS customers;

-- CHAR (Character)
-- VARCHAR (Variable Character)
-- SERIAL = Auto Increment
CREATE TABLE IF NOT EXISTS customers (
  id SERIAL,
  first_name VARCHAR(20),
  last_name VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);