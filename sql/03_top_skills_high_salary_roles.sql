-- Get skills from top 10% highest-paying remote DA jobs
WITH top_10_percent AS (
    SELECT salary_year_avg
    FROM job_postings_fact
    WHERE 
        job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
        AND job_title_short LIKE '%Data Analyst%'
        AND job_country = 'United States'
    ORDER BY salary_year_avg DESC
    LIMIT (SELECT CEIL(COUNT(*) * 0.10)
           FROM job_postings_fact
           WHERE job_location = 'Anywhere'
             AND salary_year_avg IS NOT NULL
             AND job_title_short LIKE '%Data Analyst%'
             AND job_country = 'United States')
),

min_top_salary AS (
    SELECT MIN(salary_year_avg) AS threshold
    FROM top_10_percent
)

-- Final query to get skills associated with top 10% highest-paying remote DA jobs
SELECT
    ss.skills,
    COUNT(DISTINCT jpf.job_id) AS skill_count
FROM job_postings_fact jpf
JOIN skills_job_dim sj
    ON jpf.job_id = sj.job_id
JOIN skills_dim ss
    ON sj.skill_id = ss.skill_id
JOIN min_top_salary mts
    ON jpf.salary_year_avg >= mts.threshold
WHERE 
    jpf.job_location = 'Anywhere'
    AND jpf.salary_year_avg IS NOT NULL
    AND jpf.job_title_short LIKE '%Data Analyst%'
    AND jpf.job_country = 'United States'
GROUP BY ss.skills
ORDER BY skill_count DESC;





