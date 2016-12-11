DROP TABLE IF exists customers;
DROP TABLE IF exists films;
DROP TABLE IF exists tickets;

CREATE TABLE customers(
  id serial8 primary key,
  name VARCHAR(255),
  funds INT2

);

CREATE TABLE films(
  id serial8 primary key,
  title VARCHAR(255),
  price INT2


);

CREATE TABLE tickets(
  id serial8 primary key,
  customer_id INT2 references customers(id),
  film_id INT2 references films(id)


);