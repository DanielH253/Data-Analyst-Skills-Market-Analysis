/*This query retrieves the top skills for Data Analyst positions 
in the United States with an average salary, considering only those 
skills that are associated with at least 10 job postings*/
SELECT
    ss.skills,
    COUNT(DISTINCT jpf.job_id) AS skill_count,
    ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary
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
HAVING COUNT(DISTINCT jpf.job_id) >= 10
ORDER BY avg_salary DESC;





