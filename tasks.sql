-- 1 Вивести з/п спеціалістів ML Engineer в 2023 році
SELECT 
 	year
 	, job_title
	, salary_in_usd 
FROM salaries 
WHERE 
	year = 2023
	AND job_title = 'ML Engineer';


-- 2/ Назвати країну (comp_location), в якій зафіксована найменша з/п спеціаліста в сфері Data Scientist в 2023 році
SELECT 
	year
	, job_title
	, salary_in_usd
	, comp_location
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'Data Scientist'
 ORDER BY salary_in_usd  ASC
 
LIMIT 1;

SELECT  	
    comp_location
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'Data Scientist'
 ORDER BY salary_in_usd  ASC
 
LIMIT 1;


--3/ Вивести з/п українців (код країни UA), додати сортування за зростанням з/п

SELECT 
	salary_in_usd 
	, empl_location
FROM salaries 
WHERE
	empl_location = 'UA'
ORDER BY salary_in_usd  ASC;


SELECT 
    year,
    job_title,
    salary_in_usd,
    empl_location
FROM salaries 
WHERE empl_location = 'UA'
ORDER BY salary_in_usd ASC;




