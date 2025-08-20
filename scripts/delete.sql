\c sql_learning

-- First make a select from the registers do you want to delete

DELETE FROM customers
WHERE  id = 1
RETURNING *
;