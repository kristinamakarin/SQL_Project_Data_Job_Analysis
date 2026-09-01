/*
Question: What are the top-paying skills for Data Analyst jobs?
- Join job postings with skills tables and calculate the average salary
  for each skill, filtering for remote Data Analyst roles with a
  non-null salary.
- Why? Reveals which individual skills are associated with the highest
  average pay, helping identify which skills are most financially
  worthwhile to learn or highlight.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM    
    job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;