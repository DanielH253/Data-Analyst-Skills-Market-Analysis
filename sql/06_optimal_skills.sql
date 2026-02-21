/*This query identifies Data Analyst skills that are mentioned in ten job postings or more,
and calculates a combined score based on the number of job postings and the average salary 
for those postings. The results are ordered by the combined score to highlight the most valuable 
skills for Data Analysts in the United States with remote work options.*/
WITH skill_stats AS (
    SELECT
        ss.skills,
        COUNT(DISTINCT jpf.job_id) AS skill_count,
        AVG(jpf.salary_year_avg) AS avg_salary,
        COUNT(DISTINCT jpf.job_id) * AVG(jpf.salary_year_avg) AS score
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
    HAVING COUNT(DISTINCT jpf.job_id) >= 10  -- filter out very rare skills
)

-- Final selection and ordering by combined score
SELECT
    skills,
    skill_count,
    ROUND(avg_salary, 2) AS avg_salary,
    ROUND(score, 2) AS combined_score
FROM skill_stats
ORDER BY combined_score DESC;





