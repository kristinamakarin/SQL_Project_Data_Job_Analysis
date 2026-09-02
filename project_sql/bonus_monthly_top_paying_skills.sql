/*
Question: Do the top-paying skills for Data Analyst jobs shift from
month to month (January - March)?
- Join job postings with the skills tables, extract the posting month,
  and calculate average salary and demand count per skill, per month.
- Restricted to the first quarter (months 1-3) as a sample period.
- Why? Tests whether "top-paying skills" is a stable list, or whether
  it fluctuates month to month due to which postings happen to appear.
*/

SELECT
    EXTRACT(MONTH FROM job_posted_date) AS posting_month,
    skills_dim.skills,
    skills_dim.skill_id,
    ROUND(AVG(salary_year_avg)) AS avg_salary,
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
    EXTRACT(MONTH FROM job_posted_date) < 4
GROUP BY
    posting_month,
    skills_dim.skills,
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC;