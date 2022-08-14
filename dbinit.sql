--CREATE TABLE accounts (
  --  id UUID PRIMARY KEY,
    --balance INT8
--);

--CREATE TABLE Users(
  --  id UUID PRIMARY KEY,
    --userName STRING,
    --firstName STRING,
    --lastName STRING	
--);

CREATE TABLE Purchase(
    id UUID PRIMARY KEY,
    userName STRING,
    amount NUMERIC,
    purchaseDate Date
);

 --cat dbinit.sql | cockroach sql --url postgresql://root@localhost:26257?sslmode=disable