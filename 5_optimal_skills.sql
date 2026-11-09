/*
Project question:
Which skills offer a strong combination of employer demand and high average
salary for remote Data Analyst roles?

Method:
1. Measure demand by counting job-skill associations in remote Data Analyst
   postings.
2. Measure salary by calculating the average annual salary for each skill
   among remote Data Analyst postings with reported salaries.
3. Combine the two measures by skill.
4. Keep skills appearing in more than 10 job-skill records, then rank by
   average salary and demand.

Interpretation:
This is a comparative screening method for identifying skills that are both
requested and associated with higher-paying postings in this dataset.
It does not establish that learning a skill will cause a higher salary.
The demand threshold is a practical filter; change it to explore other
coverage levels.
*/

WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sj.job_id) AS demand_count
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
        ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS sd
        ON sj.skill_id = sd.skill_id
    WHERE
        j.job_title_short = 'Data Analyst'
        AND j.job_work_from_home = TRUE
    GROUP BY
        sd.skill_id,
        sd.skills
),
skills_salary AS (
    SELECT
        sd.skill_id,
        sd.skills,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
        ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS sd
        ON sj.skill_id = sd.skill_id
    WHERE
        j.job_title_short = 'Data Analyst'
        AND j.job_work_from_home = TRUE
        AND j.salary_year_avg IS NOT NULL
    GROUP BY
        sd.skill_id,
        sd.skills
)
SELECT
    sd.skill_id,
    sd.skills,
    sd.demand_count,
    ss.avg_salary
FROM skills_demand AS sd
INNER JOIN skills_salary AS ss
    ON sd.skill_id = ss.skill_id
WHERE
    sd.demand_count > 10
ORDER BY
    ss.avg_salary DESC,
    sd.demand_count DESC
LIMIT 25;
