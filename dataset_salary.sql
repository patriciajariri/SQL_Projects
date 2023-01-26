SELECT *
FROM dataset

-- Number of people in each job title

SELECT
	job_title,
    COUNT(one) AS num_of_people,
FROM dataset
GROUP BY 1
ORDER BY num_of_people DESC

-- Number of people in each company

SELECT
	company_name,
    COUNT(one) AS num_of_people
FROM dataset
GROUP BY 1
ORDER BY num_of_people DESC

-- number of people responders per job title per city

SELECT
	location,
    job_title,
    COUNT(job_title) AS num_of_responders
FROM dataset
GROUP BY 1,2
ORDER BY
	location,
    num_of_responders DESC
    
-- max and min salary by city and by job title

SELECT
	location,
    job_title,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM dataset
GROUP BY
	1,2
ORDER BY 1

-- highest and lowest salaries within company

SELECT
	company_name,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM dataset
GROUP BY 1

-- highest paid job title within each company

SELECT
	DISTINCT company_name,
    job_title,
    MAX(salary) AS max_salary
FROM dataset
GROUP BY 1,2

