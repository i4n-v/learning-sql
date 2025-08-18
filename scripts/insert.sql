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
