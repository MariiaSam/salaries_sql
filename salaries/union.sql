SELECT 
	'min_salary' as parameter
	, MIN(salary_in_usd) as value
FROM salaries

UNION 

SELECT 
	'max_salary' as parameter
	, MAX(salary_in_usd) as value
FROM salaries;