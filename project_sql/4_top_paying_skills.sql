/*
Question: What are the top skills based on salary?
*/


SELECT 
  skills,
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
  skills
ORDER BY
  avg_sal DESC
LIMIT 10


/**** RESULT ANALYSIS ****/
/**
Here are some key insights about the **top 10 highest-paying skills for Data Analysts** from your list:

* **Big Data & Distributed Computing is top-tier**

  * **PySpark** tops the list (\$208K+) – showing that companies highly value analysts who can handle **large-scale data processing** on distributed systems (often used with Hadoop/Spark clusters).
  * This suggests a trend: analysts with **data engineering–adjacent skills** are paid more.

* **Version Control & Collaboration Tools are lucrative**

  * **Bitbucket (\$189K)** and **GitLab (\$154K)** are surprisingly high, indicating that organizations reward analysts who can work in **modern DevOps-oriented environments**.
  * Knowledge of these tools shows ability to integrate analytics into **production pipelines**, not just ad-hoc analysis.

* **AI/ML & Automation Platforms matter**

  * **IBM Watson (\$160K)** and **DataRobot (\$155K)** point toward the rising demand for analysts who can leverage **AI platforms** for automated insights and predictive modeling.
  * This bridges the gap between pure analysis and **machine learning deployment**.

* **NoSQL & Search Technologies in demand**

  * **Couchbase (\$160K)** and **Elasticsearch (\$145K)** highlight the need for analysts who can query, process, and analyze **unstructured or semi-structured data** beyond traditional SQL.
  * Useful for real-time analytics, text mining, and modern data pipelines.

* **Programming & Analysis Skills Still Pay Well**

  * **Swift (\$153K)** may reflect demand in **mobile data analytics** or cross-over roles where data teams work closely with app development.
  * **Jupyter (\$152K)** and **Pandas (\$151K)** remain core data analysis tools, showing that strong **Python-based analysis & reproducible workflows** are still highly rewarded.

* **Key Trend: Hybrid Skill Sets Drive Salaries**

  * The highest salaries cluster around roles that **combine data analysis with engineering, automation, or advanced platforms**.
  * Analysts who can “go beyond Excel and SQL” into **big data, cloud, ML platforms, and deployment workflows** are commanding the premium pay.
**/
