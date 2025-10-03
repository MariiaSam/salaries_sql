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

--
--
WITH cte AS(
SELECT  
	job_title
	, salary_in_usd
	, AVG(salary_in_usd) OVER(partition by job_title) as avg_salary
	FROM salaries
WHERE year = 2023
)

SELECT * 
FROM cte
WHERE salary_in_usd > avg_salary

--
SELECT 
	InvoiceId 
	, CustomerId 
	, InvoiceDate 
	, Total
	, LAG(Total, 1) OVER(Partition by CustomerId Order by InvoiceDate) AS lag_total
	, LAG(InvoiceDate, 1) OVER(Partition by CustomerId Order by InvoiceDate) AS lag_total
	, JULIANDAY(InvoiceDate) - JULIANDAY(LAG(InvoiceDate, 1) OVER(Partition by CustomerId Order by InvoiceDate)) diff_in_days
	, LEAD(Total, 1) OVER(Partition by CustomerId Order by InvoiceDate) AS lead_total
	FROM Invoice 
ORDER by CustomerId 

--

SELECT 
	i.InvoiceId 
	, i.CustomerId 
	, InvoiceDate 
	, i.Total
	, FIRST_VALUE(Total) OVER(Partition by CustomerId Order by InvoiceDate ASC) AS first_amount
FROM Invoice i 