\c sql_learning

UPDATE 
  customers
SET 
  first_name = 'Ian Vinícius',
  first_name = 'ianvinicioss@gmail.com'
WHERE 
  id = 1
RETURNING *
;