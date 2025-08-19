\c sql_learning

-- Without columns decription

INSERT INTO customers VALUES (
  DEFAULT,
  'Mateus',
  'Silva',
  DEFAULT,
  'mateus@jstasck.com.br'
);

-- With columns decription

INSERT INTO customers(
  first_name,
  last_name,
  email
) 
VALUES (
  'Ian',
  'Vinícius',
  'ianvinicioss@gmail.com'
);

-- A lot of rows to insert

INSERT INTO customers(
  first_name,
  last_name,
  email
) 
VALUES 
  ('João', 'da Silva', 'joao@email.com'),
  ('Pedro', 'da Silva', 'pedro@email.com'),
  ('Maria', 'Oliveira', 'maria@email.com'),
  ('Ana', 'Silva', 'ana@email.com'),
  ('Julia', 'Santos', 'julia@email.com'),
  ('Daniel', 'Santana', 'daniel@email.com'),
  ('Lucia', 'Silva', 'lucia@email.com'),
  ('Rafael', 'Oliveira', 'rafael@email.com'),
  ('Victor', 'Santos', 'victor@email.com');

-- Returns created data

INSERT INTO customers(
  first_name,
  last_name,
  email
) 
VALUES (
  'Rafael',
  'Oliveira',
  'rafael@email.com'
)
RETURNING id, created_at;


-- A loop to insert multiple register on PostgreSql using PL/pgSQL

DO $$
DECLARE
  i INT := 1;
  m INT := 20;
  customer_id INT;
  created_customers INT := 0;

BEGIN
  WHILE i <= m LOOP
    INSERT INTO customers(first_name, last_name, email)
    VALUES('Customer-' || i, 'Doe-' || i, 'customer.' || i || '@email.com')
    RETURNING id INTO customer_id;

    INSERT INTO orders(amount, customer_id)
    VALUES(RANDOM() * 1000, customer_id);

    i := i + 1;
    created_customers := created_customers + 1;
  END LOOP;

  RAISE NOTICE '% customers succesfully created', created_customers;
END $$;