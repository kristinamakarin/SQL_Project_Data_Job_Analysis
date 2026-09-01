/*
Question: What are the top-paying Data Analyst jobs that don't require a degree?
- Same approach as the main top-paying query, but filtered to postings
  that explicitly mention no degree requirement (job_no_degree_mention = TRUE).
- Why? To explore whether high salaries are achievable without a formal
  degree requirement, and how they compare to jobs that do mention one.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_no_degree_mention,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    job_no_degree_mention = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;