DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;
DROP TABLE budgets;

CREATE TABLE budgets(
  id SERIAL4 PRIMARY KEY,
  amount INT4 NOT NULL,
  month VARCHAR(255) NOT NULL,
  dt DATE NOT NULL
);

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount FLOAT NOT NULL,
  merchant_id INT4 REFERENCES merchants(id) NOT NULL,
  category_id INT4 REFERENCES categories(id) NOT NULL,
  budget_id INT4 REFERENCES budgets(id) NOT NULL,
  dt DATE NOT NULL
);
