# 📊 Data Analyst Job Market Analysis

## Introduction
This project explores the job market for Data Analysts using SQL, focusing on the highest-paying roles and the skills that are both in-demand and well-compensated. The goal is to answer the question: **which skills are most worth learning to maximize both demand and salary?**

The data comes from [Luke Barousse's SQL course](https://lukebarousse.com/sql) and includes job postings, companies, and the skills associated with them.

The queries I wrote can be found in the [`project_sql/`](./project_sql/) folder.

## Questions I wanted to answer
1. What are the top-paying Data Analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for Data Analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn (high demand AND high paying)?

## Tools I used
- **SQL** — for querying and analyzing the data
- **PostgreSQL** — database management system
- **VS Code** — for writing queries and version control
- **Git & GitHub** — for version control and sharing the project

## The Analysis

### 1. Top Paying Jobs

To identify the highest-paying opportunities, I filtered remote (`Anywhere`) Data Analyst postings with a non-null salary and joined with `company_dim` to include the company name, sorting by `salary_year_avg` in descending order.

**Key finding:** Salaries for the top 10 positions vary widely, from $184,000 to over $650,000 — showing that even within a single job title, compensation depends heavily on factors like seniority, company, and specialization.

### 2. Skills for Top Paying Jobs

To understand what skills are required for the highest-paying roles, I joined the top 10 highest-paying jobs (from the previous query) with the skills tables, using a CTE to keep the query readable.

**Key finding:** *SQL, Python, Power BI, Tableau...*

### 3. In-Demand Skills
*(fill in)*

### 4. Top Paying Skills
*(fill in)*

### 5. Most Optimal Skills to Learn
*(fill in)*

## What I Learned
*(fill in at the end — SQL concepts applied: CTEs, window functions, joins, aggregations...)*

## Conclusions
*(fill in at the end — main insights from the whole analysis and takeaways)*

## Bonus: Additional Practice Queries

Alongside the main 5 questions, I wrote a few extra queries to practice variations on the same concepts.

### Top Paying Jobs Without a Degree Requirement
Explores whether high salaries are achievable without a formal degree by filtering on `job_no_degree_mention`.

### Top Paying Jobs by Hourly Rate
Same approach as the main "Top Paying Jobs" query, but ranked by `salary_hour_avg` instead of annual salary — useful for contract/freelance roles.