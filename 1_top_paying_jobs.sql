/*
Question: What are the highest-paying remote Data Analyst job postings?

- Filter to records classified as Data Analyst.
- Use job_location = 'Anywhere' as the dataset's remote/anywhere indicator.
- Exclude postings without a reported annual average salary.
- Join company_dim to include employer names.
- Return the 10 highest-paying postings.

Note: job_title_short is the dataset category; the displayed job_title may
contain specialist, principal, or leadership titles.
*/
SELECT
    j.job_id,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date,
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
LIMIT 10;

/*
Supplied result snapshot: the 10 selected postings ranged from $184,000
to $650,000 in annual average salary. These are historical dataset results,
not current vacancies or guaranteed market salary ranges. Rerun to refresh.
*/