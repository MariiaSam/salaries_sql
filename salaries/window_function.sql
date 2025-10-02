SELECT 
	job_title 
	, ROUND(AVG(salary_in_usd), 0) AS avg_salary
FROM salaries 
GROUP BY job_title

WITH cte AS(
SELECT  
	job_title
	, salary_in_usd
	, AVG(salary_in_usd) OVER(partition by job_title) as avg_salary
	, MIN(salary_in_usd) OVER(partition by job_title) as min_salary
	, MAX(salary_in_usd) OVER(partition by job_title) as max_salary
    , COUNT(salary_in_usd) OVER(partition by job_title) as job_count
    , SUM(salary_in_usd) OVER(partition by job_title) as total_salary
FROM salaries 
WHERE year = 2023
)

SELECT * 
	, salary_in_usd::float/max_salary as ratio_max --CAST()
    , salary_in_usd/avg_salary as ratio_avg
FROM cte

--
WITH cte AS(
SELECT  
	job_title
	, salary_in_usd
	, SUM(salary_in_usd) OVER(partition by job_title order by salary_in_usd) as total_salary
	FROM salaries 
WHERE year = 2023
)

SELECT * 
FROM cte