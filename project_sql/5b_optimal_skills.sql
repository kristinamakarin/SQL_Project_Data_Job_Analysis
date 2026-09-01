/*
Question: What are the most optimal skills to learn for Data Analyst jobs? (Concise approach)
- Combine skill demand (job posting count) and average salary data in a single query
  for remote Data Analyst roles with specified salaries.
- Filter using HAVING clause to only include skills with more than 10 job postings.
- Why? Provides a more concise and efficient query alternative to CTEs while yielding 
  the exact same strategic insights for high-demand, high-paying skills.
*/

SELECT 
    skills_dim.skills,
    skills_dim.skill_id,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY 
    skills_dim.skills,
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 30;