SELECT * FROM salaries LIMIT 20;  

SELECT *
FROM salaries
WHERE 
	year = 2023
	AND salary = 30000
LIMIT 20;

SELECT *
FROM salaries
WHERE 
	year <> 2023
LIMIT 20;

SELECT *
FROM salaries
WHERE 
		exp_level = 'MI'
		AND year = 2023
		AND job_title = 'Data Analyst'
LIMIT 20;

SELECT *
FROM salaries
WHERE 
		exp_level = 'MI'
		AND (exp_level != 'MI'
		OR exp_level != 'SE')
LIMIT 20;

