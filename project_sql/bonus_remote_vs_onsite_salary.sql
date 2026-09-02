/*
Question: How are Data Analyst salaries distributed across pay brackets?
- Use a CASE statement to bucket salaries into Entry/Mid/Senior brackets,
  then count how many postings fall into each.
- Why? Gives a clearer picture of salary distribution than just min/max/avg.
*/

SELECT
    CASE
        WHEN job_work_from_home = TRUE OR job_location = 'Anywhere' THEN 'Remote'
        ELSE 'On-site'
    END AS work_type,
    COUNT(*) AS number_of_postings,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    work_type
ORDER BY
    avg_salary DESC;