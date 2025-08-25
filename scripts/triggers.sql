\c sql_learning;

SELECT * FROM customers WHERE id = 53;

ALTER TABLE customers
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE OR REPLACE FUNCTION set_updated_at_trigger() RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
		NEW.updated_at = CURRENT_TIMESTAMP;
		RETURN NEW;
	END;
$$;

CREATE OR REPLACE TRIGGER customers_update_updated_at
BEFORE UPDATE ON customers
FOR EACH ROW EXECUTE FUNCTION set_updated_at_trigger();

UPDATE customers SET age = 23 WHERE id = 53;