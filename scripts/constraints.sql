\c sql_learning

ALTER TABLE customers
ALTER COLUMN email SET NOT NULL;

ALTER TABLE customers
ADD CONSTRAINT customers_email_unique UNIQUE(email);

ALTER TABLE customers
ADD CONSTRAINT customers_email_id_unique UNIQUE(email, id);

ALTER TABLE customers
DROP CONSTRAINT customers_email_unique;

CREATE TABLE customers (
	email VARCHAR(256) NOT NULL
	
	CONSTRAINT customers_email_unique UNIQUE(email)
);


ALTER TABLE orders 
ADD CONSTRAINT orders_min_amount CHECK(amount > 500);

SELECT 
	constraint_name,
	constraint_type,
    table_name 
FROM information_schema.table_constraints
WHERE table_schema = 'public';