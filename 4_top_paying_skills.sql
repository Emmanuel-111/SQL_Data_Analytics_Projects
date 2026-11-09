/*
Question: Which skills are associated with the highest average annual salaries
in remote Data Analyst job postings?

- Restrict to postings classified as Data Analyst.
- Include only postings with a reported annual average salary.
- Restrict to postings marked as work-from-home.
- Calculate the average annual salary for postings associated with each skill.
- Return the 25 skills with the highest averages.

These are associations, not proof that a skill causes a higher salary. Skills
with fewer matching postings may have less stable averages.
*/
SELECT
    sd.skills,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
INNER JOIN skills_dim AS sd
    ON sj.skill_id = sd.skill_id
WHERE
    j.job_title_short = 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
    AND j.job_work_from_home = TRUE
GROUP BY
    sd.skills
ORDER BY
    avg_salary DESC,
    sd.skills
LIMIT 25;

/*
Supplied result snapshot:
- PySpark: $208,172
- Bitbucket: $189,155
- Couchbase and Watson: $160,515 each

These are dataset-specific averages, not current salary quotes or evidence
of a causal salary premium. Rerun to refresh.
*/