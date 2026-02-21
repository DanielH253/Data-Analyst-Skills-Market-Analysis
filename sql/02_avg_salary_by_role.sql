/*This query calculates the average salary for Data Analyst 
positions in the United States that are listed as "Anywhere" 
in terms of location. It filters out any job postings that 
do not have a specified average yearly salary and groups the 
results by the short job title, ordering them from highest to 
lowest average salary.*/
SELECT
    job_title_short,
    ROUND(AVG(salary_year_avg), 2) AS average
FROM job_postings_fact 
WHERE job_location = 'Anywhere' AND salary_year_avg IS NOT NULL AND job_title_short LIKE '%Data Analyst%' AND job_country = 'United States'
GROUP BY job_title_short
ORDER BY average DESC





