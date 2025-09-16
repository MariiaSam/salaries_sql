-- для кожної професії та відпвідного рівня досвіду навести:

-- кількість в табл
-- середню ЗП


SELECT *
FROM salaries 
LIMIT 20;

SELECT 
	job_title
	, exp_level 
	, COUNT(*) AS job_numb
	, ROUND(AVG(salary_in_usd * 42), 2) AS salary_avg_in_uah
FROM salaries
WHERE year = 2023
GROUP BY job_title, exp_level
ORDER BY 1, 2; 

/*
 Навести ЗП для професій, які зустрічаються лише 1 раз
 */

SELECT 
	job_title
	--, COUNT(*) AS job_numb
	, ROUND(AVG(salary_in_usd * 42), 2) AS salary_avg_in_uah
FROM salaries
WHERE year = 2023
GROUP BY job_title
HAVING COUNT(*) = 1
ORDER BY 2 ASC

/*
 Навести ЗП для професій, які зустрічаються лише 2 раз
 */

SELECT 
	job_title
	--, COUNT(*) AS job_numb
	, ROUND(AVG(salary_in_usd * 42), 2) AS salary_avg_in_uah
FROM salaries
WHERE year = 2023
GROUP BY job_title
HAVING 
	COUNT(*) = 2
	AND ROUND(AVG(salary_in_usd * 42), 2) > 4000000
ORDER BY 2 ASC;
