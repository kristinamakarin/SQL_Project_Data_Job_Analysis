/*
Question: What are the top-paying Data Analyst jobs by hourly rate?
- Same approach as the main top-paying query, but ranked by salary_hour_avg
  instead of salary_year_avg.
- Why? Annual salary isn't reported for contract/freelance roles, so ranking
  by hourly rate surfaces high-paying opportunities that the main query misses.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_hour_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_hour_avg IS NOT NULL 
ORDER BY 
    salary_hour_avg DESC
LIMIT 10;