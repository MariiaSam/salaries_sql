SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM project_assignments;
SELECT * FROM test;


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
