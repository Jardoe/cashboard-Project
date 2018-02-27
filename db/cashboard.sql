DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount FLOAT NOT NULL,
  merchant_id INT4 REFERENCES merchants(id),
  tag_id INT4 REFERENCES tags(id)
);


-- add dt/date to table, date class in initialize (Date.parse), seeded data
-- method strftime.
-- order by dt desc
