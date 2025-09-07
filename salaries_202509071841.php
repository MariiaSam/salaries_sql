<?php
$SELECT 
 	year
 	, job_title
 	, salary_in_usd 
 FROM  salaries
 WHERE 
 	year = 2023
 	AND job_title = 'Data Scientist'
 ORDER BY salary_in_usd  DESC 
 
 LIMIT 5 = array(
	array(
		"year" => 2023,
		"job_title" => "Data Scientist",
		"salary_in_usd" => 370000
	),
	array(
		"year" => 2023,
		"job_title" => "Data Scientist",
		"salary_in_usd" => 317070
	),
	array(
		"year" => 2023,
		"job_title" => "Data Scientist",
		"salary_in_usd" => 300240
	),
	array(
		"year" => 2023,
		"job_title" => "Data Scientist",
		"salary_in_usd" => 300240
	),
	array(
		"year" => 2023,
		"job_title" => "Data Scientist",
		"salary_in_usd" => 300000
	)
);
?>