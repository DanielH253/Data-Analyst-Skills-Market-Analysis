-- SQL query to find the top 50 highest paying remote data analyst jobs in the United States, along with the company name and job title.
SELECT
    c.name,
    jpf.job_title_short,
    jpf.job_title,
    jpf.salary_year_avg
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS c ON jpf.company_id = c.company_id
WHERE job_location = 'Anywhere' AND salary_year_avg IS NOT NULL AND job_title_short LIKE '%Data Analyst%' AND job_country = 'United States'
ORDER BY salary_year_avg DESC
LIMIT 50 -- A limit of 50 to study the extremes of the salary distribution.





