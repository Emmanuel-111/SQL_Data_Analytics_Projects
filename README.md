# SQL Data Analytics Projects

A portfolio of PostgreSQL projects exploring job-market data through practical SQL queries. The analyses focus on Data Analyst job postings, salary patterns, remote-work opportunities, and the skills employers request.

## Project questions

| File | Business question | SQL concepts |
|---|---|---|
| [1_top_paying_jobs.sql](1_top_paying_jobs.sql) | Which remote Data Analyst postings have the highest reported annual salaries? | Filtering, LEFT JOIN, ORDER BY, LIMIT |
| [2_top_paying_job_skills.sql](2_top_paying_job_skills.sql) | Which skills are listed in the 10 highest-paying remote Data Analyst postings? | CTE, INNER JOIN, multi-table joins |
| [3_top_demanded_skills.sql](3_top_demanded_skills.sql) | Which skills appear most frequently in remote Data Analyst postings? | INNER JOIN, COUNT, GROUP BY |
| [4_top_paying_skills.sql](4_top_paying_skills.sql) | Which skills are associated with the highest average salaries in remote Data Analyst postings? | AVG, ROUND, GROUP BY |

## Selected findings

These figures come from the supplied query output snapshots. They are specific to that dataset version and should be refreshed by rerunning the SQL scripts.

- **Top-paying postings:** the 10 selected postings ranged from **$184,000 to $650,000** in reported annual average salary.
- **Frequently requested skills:** SQL (7,291), Excel (4,611), Python (4,330), Tableau (3,745), and Power BI (2,609) led the supplied remote-posting results.
- **Salary-associated skills:** PySpark ($208,172), Bitbucket ($189,155), and Couchbase / Watson ($160,515 each) appeared among the highest average salary results in the supplied snapshot.

## Interpretation notes

- The dataset uses `job_title_short = 'Data Analyst'` as a posting category. The displayed `job_title` can include specialist, principal, or leadership titles.
- The demand analysis filters to postings marked `job_work_from_home = TRUE`; it does not cover every posting in the dataset.
- The salary-by-skill analysis shows an association, not proof that a skill causes a higher salary. Averages may also be affected by the number and type of postings associated with each skill.
- These are historical dataset outputs, not live job vacancies or current salary offers.

## Database tables

The scripts expect the following tables:

- `job_postings_fact` — job-posting records, salary, and work arrangement fields.
- `company_dim` — company details.
- `skills_job_dim` — bridge table connecting job postings to skills.
- `skills_dim` — skill names and metadata.

The SQL is written for **PostgreSQL**.

## How to run

1. Set up the project database and load the source dataset tables listed above.
2. Open the scripts in pgAdmin or another PostgreSQL-compatible SQL editor.
3. Run the files in numerical order, from query 1 through query 4.
4. Review the results and rerun the scripts whenever the underlying dataset changes.

## Skills demonstrated

- SQL querying and data exploration
- Filtering and sorting
- INNER JOIN and LEFT JOIN
- Common Table Expressions (CTEs)
- Aggregations using COUNT and AVG
- GROUP BY and LIMIT
- Translating query output into business-oriented observations

## Repository structure

    SQL_Data_Analytics_Projects/
    ├── README.md
    ├── 1_top_paying_jobs.sql
    ├── 2_top_paying_job_skills.sql
    ├── 3_top_demanded_skills.sql
    └── 4_top_paying_skills.sql

## Notes

This is a learning portfolio. Query explanations are aligned with what each SQL statement actually calculates. Result figures are labelled as supplied snapshots and should be refreshed against the source database before being used in a new report.
