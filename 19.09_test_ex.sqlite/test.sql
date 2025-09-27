-- тест
CREATE TABLE test(
	id_test INTEGER PRIMARY KEY,
	a_test TEXT NOT NULL,
	b_test TEXT NOT NULL, 
	c_test INTEGER NOT NULL, 
	d_test DATA,
    emp_id INTEGER,
    dept_id INTEGER,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- тест
INSERT INTO test VALUES
(1, 'A', 'B', 1, '2025-09-20', 1, 1), 
(2, 'A', 'B', 2, '2025-08-19', 2, 2), 
(3, 'A', 'B', 3, '2025-07-18', 3, 3), 
(4, 'A', 'B', 4, '2025-06-17', 4, 4), 
(5, 'A', 'B', 5, '2025-05-16', 5, 5);
