CREATE TABLE customers(
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
email TEXT UNIQUE 
);

INSERT INTO customers (first_name, last_name, email) VALUES
('Olena', 'Kovalenko', 'olena@example.com'),
('Taras', 'Shevchenko', 'taras@example.com'),
('Iryna', 'Bondar', 'iryna@example.com');


CREATE TABLE orders(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	order_date DATE NOT NULL,
	customer_id INTEGER, 
	FOREING KEY (customer_id) REFERENCES customers(id)
);

--INSERT INTO orders (order_date, customer_id) VALUES 