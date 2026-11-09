/*
Question: Which skills are listed in the 10 highest-paying remote Data Analyst
postings?

The CTE selects the 10 postings using the same filters as query 1. The joins
then return one row per job-and-skill association.

Important: this query lists skills for each selected job. It does NOT calculate
overall skill-demand counts. A separate aggregation would be needed to rank
skills by frequency across the 10 jobs.
*/
WITH top_paying_jobs AS (
    SELECT
        j.job_id,
        j.job_title,
        j.salary_year_avg,
        c.name AS company_name
    FROM job_postings_fact AS j
    LEFT JOIN company_dim AS c
        ON j.company_id = c.company_id
    WHERE
        j.job_title_short = 'Data Analyst'
        AND j.job_location = 'Anywhere'
        AND j.salary_year_avg IS NOT NULL
    ORDER BY
        j.salary_year_avg DESC
    LIMIT 10
)
SELECT
    tpj.job_id,
    tpj.job_title,
    tpj.salary_year_avg,
    tpj.company_name,
    sd.skills
FROM top_paying_jobs AS tpj
INNER JOIN skills_job_dim AS sj
    ON tpj.job_id = sj.job_id
INNER JOIN skills_dim AS sd
    ON sj.skill_id = sd.skill_id
ORDER BY
    tpj.salary_year_avg DESC,
    tpj.job_id,
    sd.skills;
