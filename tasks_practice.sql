-- 1 Вивести з/п спеціалістів ML Engineer в 2023 році, додати сортування за зростанням зп

SELECT
	salary_in_usd AS salary
	, year
	, job_title
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'ML Engineer'
	
ORDER BY 1 ASC;

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
ORDER BY 3  ASC
 
LIMIT 1;

--3/ Вивести топ 5 з/п серед усіх спеціалістів, які працюють повністю віддалено (remote_ratio = 100)
SELECT 
     salary_in_usd AS salary
    , job_title
	, remote_ratio
FROM salaries 
Where 
	remote_ratio = 100
ORDER BY salary_in_usd DESC 
LIMIT 5;

-- 4/ Вивести кількість унікальних значень для кожної колонки, що містить текстові значення.
SELECT DISTINCT comp_location
FROM salaries;

SELECT COUNT(DISTINCT comp_location)
FROM salaries

-- 5 вивести середню, мінімальну, макс ЗП для 2023 року
SELECT 
	ROUND(AVG(salary_in_usd), 2) AS average_salary
	, MIN(salary_in_usd) AS min_salary
	, MAX(salary_in_usd) AS max_salary
FROM salaries;

-- 6/ Вивести 5 найвищих заробітних плат в 2023 році для представників спеціальності ML Engineer. Заробітні плати перевести в гривні
SELECT 
	salary_in_usd
	, year
	, job_title
	, (salary_in_usd * 42) AS salary_in_uah
FROM salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY salary_in_usd DESC 
LIMIT 5;	

-- 7/ Вивести Унікальні значення колонки remote_ratio, формат даних має бути дробовим з двома знаками після коми, приклад: значення 50 має відображатись в форматі 0.50


SELECT DISTINCT ROUND((remote_ratio/100.0), 3) AS remote
FROM salaries


-- 8/ Вивести всі дані таблиці, додавши колонку 'exp_level_full' з повною назвою рівнів досвіду працівників відповідно до колонки exp_level. Визначення: Entry-level (EN), Mid-level (MI), Senior-level (SE), Executive-level (EX)

SELECT *
	,CASE 
		WHEN exp_level = 'EN' THEN 'Entry-level'
		WHEN exp_level = 'MI' THEN 'Mid-level'
		WHEN exp_level = 'SE' THEN 'Mid-Senior-level'
		ELSE 'Executive-level' END AS exp_level_full
FROM salaries
LIMIT 10;

-- 9 Додатки колонку "salary_category', яка буде відображати різні категорії заробітних плат відповідно до їх значення в колонці 'salary_in_usd'. Визначення: з/п менша за 20 000 - Категорія 1, з/п менша за 50 000 - Категорія 2, з/п менша за 100 000 - Категорія 3, з/п більша за 100 000 - Категорія 4

SELECT *
	,CASE 
		WHEN salary_in_usd < 50000 THEN 'Category 1'
		WHEN salary_in_usd < 100000 THEN 'Category 2'
		WHEN salary_in_usd < 150000 THEN 'Category 3'
		ELSE 'Category 4' END AS salary_level
FROM salaries
LIMIT 10;

-- 10/ Дослідити всі колонки на наявність відсутніх значень, порівнявши кількість рядків таблиці з кількістю значень відповідної колонки




