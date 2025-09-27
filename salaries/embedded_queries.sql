SELECT * 
FROM salaries
WHERE salary_in_usd > 
(
	SELECT AVG(salary_in_usd)
	FROM salaries
);


SELECT * 
FROM salaries
WHERE salary_in_usd > 
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)
	AND year = 2023;

    /-- вивести всіх спеціалістів empl_location, які живуть в країнах comp_location, де середня ЗП вища за середню усіх країн
 
/ -- 1. Визначення Середньої ЗП по всім країнам
/ -- 2. Визначення Середньої ЗП по кожній країні
/ -- 3. Порівнюємо і виводимо перелік країн
/ -- 4. Вивести спеціалістів, які живуть в цих країнах



SELECT AVG(salary_in_usd)
FROM salaries

SELECT
	comp_location
	-- , AVG(salary_in_usd)
FROM salaries 	
WHERE year = 2023
GROUP BY 1
HAVING  AVG(salary_in_usd) > 
(
SELECT AVG(salary_in_usd)
FROM salaries
	WHERE year = 2023
)

--
SELECT *
FROM salaries 
WHERE emp_location IN 
(
SELECT
	comp_location
	-- , AVG(salary_in_usd)
FROM salaries 	
WHERE year = 2023
GROUP BY 1
HAVING  AVG(salary_in_usd) > 
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)
)

--Знайти мінімальну ЗП серед макс ЗП по країнах в 2023 році

-- 1. Макс ЗП по країнах в 2023 році
-- 2. Знайти мін ЗП

--------------------------
--1
SELECT 
	comp_location
	, MAX(salary_in_usd)
FROM salaries 
GROUP BY comp_location;

-- 2 
SELECT MIN(t.salary_in_usd)
FROM
(
SELECT 
	comp_location
	, MAX(salary_in_usd) AS salary_in_usd
FROM salaries 
GROUP BY comp_location 
) AS t;


---

SELECT 
	comp_location 
	, MAX(salary_in_usd) AS salary_in_usd
FROM salaries 
GROUP BY comp_location 
ORDER BY salary_in_usd ASC
LIMIT 1

-- по кожній професії вивести різницю між середньою ЗП та макс ЗП з усіх спеціалістів

-- 1. макс ЗП
-- 2. табл проф і середніх ЗП
-- 3. Результат

SELECT MAX(salary_in_usd)
FROM salaries

SELECT 
	job_title
	, AVG(salary_in_usd) - 
	, (
		SELECT MAX(salary_in_usd)
		FROM salaries
	) AS diff
FROM salaries
GROUP BY job_title


-- вивести дані по співробітнику, який отримує 2-гу по розміру ЗП в таблиці


SELECT *
FROM 
(
	SELECT *
	FROM salaries
	ORDER BY salary_in_usd DESC
	LIMIT 2
) AS t
ORDER BY salary_in_usd ASC
LIMIT 1;



SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 1 OFFSET 1;


SELECT *
FROM salaries
LIMIT 10;

SELECT
	COUNT(*)
	, COUNT(*) - COUNT(salary_in_usd) AS missing_values
FROM salaries;

SELECT 
	job_title
	, COUNT(*)
FROM salaries
GROUP BY job_title
ORDER BY COUNT(*) DESC
LIMIT 10;



SELECT 
	job_title
	, exp_level
	, MIN(salary_in_usd)
	, MAX(salary_in_usd)
	, ROUND(AVG(salary_in_usd), 2) AS avg
	, stddev(salary_in_usd)
FROM salaries
GROUP BY job_title, exp_level;


SELECT 
	TRUNC(salary_in_usd, -1)
	, COUNT(*)
FROM salaries 
GROUP BY salary_in_usd;


SELECT 
	CASE 
		WHEN salary_in_usd <= 10000 THEN 'A'
		WHEN salary_in_usd <= 20000 THEN 'B'
		WHEN salary_in_usd <= 5000 THEN 'C'
		WHEN salary_in_usd <= 100000 THEN 'D'
		WHEN salary_in_usd <= 200000 THEN 'E'
		ELSE 'F' 
	END AS salary_category
	, COUNT(*) 
FROM salaries 
GROUP BY 1;

SELECT 
    CASE 
        WHEN salary_in_usd <= 5000 THEN 'C'
        WHEN salary_in_usd <= 10000 THEN 'A'
        WHEN salary_in_usd <= 20000 THEN 'B'
        WHEN salary_in_usd <= 100000 THEN 'D'
        WHEN salary_in_usd <= 200000 THEN 'E'
        ELSE 'F' 
    END AS salary_category,
    COUNT(*) AS employees_count
FROM salaries
GROUP BY salary_category;

--corr
SELECT 
	corr(remote_ratio, salary_in_usd)
FROM salaries;