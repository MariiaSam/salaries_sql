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
