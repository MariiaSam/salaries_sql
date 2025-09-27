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


SELECT *
FROM salaries
WHERE 1=1
AND year = 2020
LIMIT 20;


SELECT DISTINCT year
FROM salaries
WHERE 1=1
	AND year > 2020
	AND year < 2023
LIMIT 20;


SELECT DISTINCT year
FROM salaries
WHERE 1=1
	AND year NOT BETWEEN 2021 and 2023
--	AND year >= 2020
--	AND year <= 2023
LIMIT 20;



SELECT DISTINCT year
FROM salaries
WHERE 1=1
	AND year IN (2020, 2021)
--	AND year >= 2020
--	AND year <= 2023
LIMIT 20;



SELECT DISTINCT job_title 
FROM salaries
WHERE 1=1
	AND job_title  IN ('Data Analysis', 'Data Science')
--	AND year >= 2020
--	AND year <= 2023
LIMIT 20;

SELECT DISTINCT job_title 
FROM salaries
WHERE 1=1
	AND job_title LIKE ('Data_A% ')
--	AND year >= 2020
--	AND year <= 2023
LIMIT 20;


SELECT DISTINCT job_title 
FROM salaries
WHERE 1=1
	AND job_title NOT LIKE ('Data_A% ')
--	AND year >= 2020
--	AND year <= 2023
LIMIT 20;

SELECT DISTINCT job_title 
FROM salaries
WHERE 1=1
	AND job_title ILIKE ('data_A% ')
--	AND year >= 2020
--	AND year <= 2023
LIMIT 20;


SELECT COUNT(*) 
FROM salaries
WHERE 1=1
	AND year IS NULL -- шукає пусті значення
LIMIT 20;


SELECT COUNT(*) 
FROM salaries
WHERE 1=1
	AND year IS NOT NULL -- шукає  значення, які не є пусті
LIMIT 20;

SELECT COUNT(year) --
FROM salaries
WHERE 1=1
	--AND year IS NOT NULL
LIMIT 20;
