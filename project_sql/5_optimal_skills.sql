/**
Question: What are the most optimal skills to learn as 
a Data Analyst
**/

/* demanding skills */
WITH skills_demand AS
(
  SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
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
    job_work_from_home = TRUE
    AND
    salary_year_avg IS NOT NULL
  GROUP BY
    skills_dim.skill_id
), avg_sal AS (
  SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg), 0) as avg_sal
  FROM 
    job_postings_fact
  INNER JOIN skills_job_dim ON 
      skills_job_dim.job_id = job_postings_fact.job_id
  INNER JOIN skills_dim ON
      skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home = TRUE
  GROUP BY
    skills_job_dim.skill_id
)

SELECT 
  skills_demand.skill_id,
  skills_demand.skills,
  demand_count,
  avg_sal
FROM 
  skills_demand
INNER JOIN avg_sal ON avg_sal.skill_id = skills_demand.skill_id
WHERE
  demand_count > 10
ORDER BY
  avg_sal DESC
LIMIT 25