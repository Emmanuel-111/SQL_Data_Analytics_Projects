/*
Question: What are the five most frequently requested skills in remote
Data Analyst job postings?

- Restrict to postings classified as Data Analyst.
- Restrict to postings marked as work-from-home.
- Join postings to the job-skill bridge table and skills dimension.
- Count job-skill associations for each skill and return the top five.

The count represents joined job-skill records in the filtered dataset.
*/
SELECT
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
    sd.skills
ORDER BY
    demand_count DESC,
    sd.skills
LIMIT 5;

/*
Supplied result snapshot:
1. SQL      - 7,291
2. Excel    - 4,611
3. Python   - 4,330
4. Tableau  - 3,745
5. Power BI - 2,609

The original comments said all postings, but the SQL filters to work-from-home
postings only. Figures are dataset-specific; rerun to refresh.
*/