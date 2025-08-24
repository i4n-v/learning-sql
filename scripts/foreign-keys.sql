\c sql_learning

ALTER TABLE orders
ADD CONSTRAINT customers_orders_fk 
FOREIGN KEY(customer_id) REFERENCES customers(id);

ALTER TABLE orders
ADD CONSTRAINT customers_orders_fk 
FOREIGN KEY(customer_id) REFERENCES customers(id)
ON UPDATE RESTRICT
ON DELETE CASCADE;
