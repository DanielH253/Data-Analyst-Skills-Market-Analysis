SELECT 
	COUNT(job_title_short),
	EXTRACT (MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
FROM job_postings_fact	
WHERE job_posted_date >= '2023-01-01' AND job_posted_date <= '2023-12-31'
GROUP BY month
ORDER BY month	