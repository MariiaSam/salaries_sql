SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM project_assignments;
SELECT * FROM test;

SELECT * FROM customers c;
SELECT * FROM orders o;
SELECT * FROM order_items oi;
SELECT * FROM shipments s;
SELECT * FROM  payments p;
SELECT * FROM returns r ;



SELECT *
FROM project_assignments
JOIN projects ON project_assignments.project_id  = projects.project_id;


SELECT 
	project_assignments.project_id
	, project_assignments.start_date
	, projects.project_name
	, projects.role
FROM project_assignments
JOIN projects ON project_assignments.project_id  = projects.project_id;

SELECT 
	o.order_date 
	, oi.product_name
	, oi.quantity
FROM orders o
JOIN order_items oi ON oi.order_id = o.id;


SELECT 
	oi.product_name
	, COUNT(o.id)
FROM orders o
JOIN order_items oi ON oi.order_id = o.id;
WHERE  oi.product_name LIKE 'B'
GROUP BY oi.product_name;