INSERT INTO salaries ("year",job_title,salary_in_usd) VALUES
	 (2023,'Data Scientist',370000),
	 (2023,'Data Scientist',317070),
	 (2023,'Data Scientist',300240),
	 (2023,'Data Scientist',300240),
	 (2023,'Data Scientist',300000);


SELECT * from salaries;


SELECT 
	year
	, exp_level AS level
	, empl_type AS type
FROM salaries
WHERE 
	year != 2022
	AND exp_level = 'SE'
ORDER BY year ASC

LIMIT 20
;



-- top 5 ds salaries in 2023


SELECT 
 	year
 	, job_title
 	, salary_in_usd 
 FROM  salaries
 WHERE 
 	year = 2023
 	AND job_title = 'Data Scientist'
 ORDER BY salary_in_usd  DESC 
 
 LIMIT 5;