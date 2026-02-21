/* This query identifies the top skills associated with high-paying 
remote Data Analyst jobs in the United States. It counts the number 
of distinct job postings that require each skill, filtering for remote 
positions with a specified average yearly salary, and a job title that 
includes "Data Analyst". The results are ordered by the count of job postings 
for each skill in descending order.*/

SELECT
    ss.skills,
    COUNT(DISTINCT jpf.job_id) AS skill_count
FROM job_postings_fact jpf
JOIN skills_job_dim sj
    ON jpf.job_id = sj.job_id
JOIN skills_dim ss
    ON sj.skill_id = ss.skill_id
WHERE 
    jpf.job_location = 'Anywhere'
    AND jpf.salary_year_avg IS NOT NULL
    AND jpf.job_title_short LIKE '%Data Analyst%'
    AND jpf.job_country = 'United States'
GROUP BY ss.skills
ORDER BY skill_count DESC;





