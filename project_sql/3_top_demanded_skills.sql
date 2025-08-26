/*
Question: What are the most in demand skills for DA jobs?
- Furthermore, near me especially in NJ, PA, NY?
*/


SELECT 
  skills,
  COUNT(skills_job_dim.job_id) As demand_count
FROM 
  job_postings_fact
INNER JOIN skills_job_dim ON 
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst'
  AND 
  job_location IN ('New York, NY', 'New Jersey', 'Pennsylvania')
GROUP BY
  skills
ORDER BY
  demand_count DESC
LIMIT 5

/**** RESULT ANALYSIS ****/
/**
Key Insights on Top 5 Most Demanded Data Analyst Skills

-- SQL (1785 postings)

Still the #1 most demanded skill for data analysts.

It’s the backbone of querying and managing structured data, a “must-have” skill.

-- Excel (1384 postings)

Despite newer tools, Excel remains critical for quick analysis, reporting, and dashboards.

Employers value it because it’s widely used across non-technical teams too.

-- Python (1029 postings)

Rising as the go-to programming language for automation, advanced analysis, and machine learning.

Complements SQL for deeper, programmatic data work.

-- Tableau (1011 postings)

Visualization tools are in high demand — Tableau shows employers want analysts who can communicate insights effectively.

Tied closely with business intelligence roles.

-- R (588 postings)

Still valued, though less demanded than Python.

Often sought in companies focusing on statistical modeling or research-heavy analysis.
**/

