\c sql_learning

DROP TABLE bank_accounts;

DROP TABLE bank_accounts;

CREATE TABLE bank_accounts (
	id SERIAL PRIMARY KEY,
	user_id INT,
	balance NUMERIC(10, 2) CHECK(balance >= 0)
);

INSERT INTO bank_accounts(user_id, balance) VALUES
(1, 500), (2, 100);

SELECT * FROM bank_accounts;

BEGIN;
	UPDATE bank_accounts 
	SET balance = balance + 200 WHERE user_id = 1;

	UPDATE bank_accounts 
	SET balance = balance - 200 WHERE user_id = 2;
COMMIT;

BEGIN;
	INSERT INTO bank_accounts(user_id, balance)
	VALUES (3, 100);

	SAVEPOINT account_created;
	
	UPDATE bank_accounts
	SET balance = balance - 200
	WHERE id = 3;
ROLLBACK TO SAVEPOINT account_created;

BEGIN;
	SELECT balance FROM bank_accounts WHERE id = 3 FOR UPDATE;
COMMIT;

BEGIN;
	UPDATE bank_accounts 
	SET balance = balance + 200 
	WHERE user_id = 1 AND balance = 100 
COMMIT;

BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	SELECT balance FROM bank_accounts WHERE id = 3 FOR UPDATE;
COMMIT;