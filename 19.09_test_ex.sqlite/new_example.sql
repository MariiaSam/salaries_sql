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
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO orders(order_date, customer_id) VALUES 
	('2025-09-10', 1),
	('2025-09-11', 2), 
	('2025-09-12', 3); 


CREATE TABLE order_items(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	order_id INTEGER,
	product_name TEXT NOT NULL,
	quantity INTEGER NOT NULL,
	price REAL NOT NULL, --
	FOREIGN KEY (order_id) REFERENCES orders(id)

);

INSERT INTO order_items (order_id, product_name, quantity, price) VALUES
	(1, 'Laptop', 1, 1200.00),  
	(1, 'Mouse', 2, 25.50),
	(2, 'Phone', 1, 800.00),    
	(3, 'Book', 3, 15.00);      

CREATE TABLE shipments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_item_id INTEGER NOT NULL,
    shipped_date DATE NOT NULL,
    delivery_status TEXT NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES order_items(id)
);

INSERT INTO shipments (order_item_id, shipped_date, delivery_status) VALUES
	(1, '2025-09-01', 'delivered'),
	(2, '2025-09-02', 'in transit'),
	(3, '2025-09-05', 'pending');

CREATE TABLE payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_item_id INTEGER NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method TEXT NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES order_items(id)
);

INSERT INTO payments (order_item_id, payment_date, amount, method) VALUES
	(1, '2025-09-01', 1200.00, 'credit_card'),
	(2, '2025-09-02', 350.00, 'paypal'),
	(3, '2025-09-03', 560.00, 'cash');


CREATE TABLE returns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_item_id INTEGER NOT NULL,
    return_date DATE NOT NULL,
    reason TEXT NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES order_items(id)
);

INSERT INTO returns (order_item_id, return_date, reason) VALUES
	(2, '2025-09-07', 'defective product'),
	(3, '2025-09-10', 'wrong size');