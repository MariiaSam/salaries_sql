CREATE TABLE salaries(

year integer, 
exp_level text,
emp_type text, 
job_title text, 
salary integer, 
salary_curr text,
salary_in_usd integer,
emp_location text, 
remote_ratio integer, 
comp_location text, 
comp_size text
);


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

 SELECT
	1 AS nmb_1
	,1 AS nmb_2
	,5+5 AS nmb_3;

SELECT *
FROM salaries
LIMIT 10;
	
SELECT
	COUNT(*) AS cnt_all
	, COUNT(exp_level) AS cnt_all
	FROM salaries
LIMIT 10;


SELECT
	COUNT(*) AS cnt_all
	, COUNT(exp_level) AS cnt_all
	, COUNT(DISTINCT exp_level)
	FROM salaries
LIMIT 10;

-- описова статистика
-- середян ЗП 
 
SELECT
	AVG(salary_in_usd) AS salary_avg
	, MIN(salary_in_usd)  AS salary_min
	, MAX(salary_in_usd)  AS salary_max
	FROM salaries 
LIMIT 10;

SELECT
	AVG(salary_in_usd) AS salary_avg
	, MIN(salary_in_usd)  AS salary_min
	, MAX(salary_in_usd)  AS salary_max
	FROM salaries 
	WHERE year = 2023
	
LIMIT 10;


SELECT
	"year" 
	, exp_level
	, salary_in_usd
	, salary_in_usd * 41 AS salary_in_uah
FROM salaries 
LIMIT 10;

SELECT
	"year" 
	, exp_level
	, salary_in_usd
	, salary_in_usd * 41 AS salary_in_uah
-- 'SE' - Senior
-- 'MI' - Middle
-- Other
	, CASE 
		WHEN exp_level = 'SE'
		THEN 'Senior'
		WHEN exp_level = 'MI'
		THEN 'Middle'
		ELSE 'Other'END AS full_level
	
FROM salaries 
LIMIT 100
