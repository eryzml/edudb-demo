# Setup the Educational Institution Database demo
This repository contains SQL files for setting up an educational institution database, including tables for cohorts and students. Follow the steps below to get started.
## Prerequisites
PostgreSQL is required to setup and run the query files. Download and install Postgres before proceeding:
* [Download PostgreSQL on your operating system.](https://www.postgresql.org/download/)
* [Setup and start the Postgres server.](https://www.postgresql.org/docs/current/server-start.html)
## Database Setup
### Open Interactive Shell
Open a PostgreSQL interactive shell from the project directory. The shell allows for commands and interaction with the database:
```bash
psql
```
### Create Database
From the interactive shell run the following command to create a new database:
```bash
CREATE DATABASE edudb;
```
### Connect to Database
Connect to the newly created database from the shell:
```bash
\c edudb;
```
### Run Migrations
Execute migration files to create tables in the database:
```bash
\i migrations/students_cohorts.sql
\i migrations/assignment_submissions.sql
\i migrations/teachers_assistance_requests.sql
```
### Seed the Database
Populate the tables with sample data using seed files:
```bash
\i seeds/students.sql
\i seeds/teachers_seeds.sql
\i seeds/cohorts.sql
\i seeds/assignments_seeds.sql
\i seeds/assignment_submissions_seeds.sql
\i seeds/assistance_requests_seeds.sql
```
## Run SQL Queries
Explore and execute SQL query files to perform analysis on the educational institution database. 

SQL query file directories:
```bash
0_selects
1_queries
2_queries_joins
3_queries_group-by
4_queries
```
### Example SQL Queries
The query files demonstrate a range of statistical analysis using the sample data. Here are some of the queries available to run in the  in the fileset:
* SELECT statement with WHERE clause:
  ```sql
  \i 0_selects/1_students_without_github.sql

  -- executes:

  SELECT id, name, email, cohort_id
  FROM students
  WHERE github = '' OR github IS NULL
  ORDER BY cohort_id;
  ```
* JOIN query with AGGREGATE function:
  ```sql
  \i 2_queries_joins/1_total_student_time_spent_on_assignments.sql

  --- executes:

  SELECT SUM(assignment_submissions.duration) AS total_duration
  FROM assignment_submissions
  JOIN students ON students.id = assignment_submissions.student_id
  WHERE students.name = 'Ibrahim Schimmel';
  ```
* MULTIPLE-JOIN query with AGGREGATE function:
  ```sql
  \i 4_queries/13_teachers_total_assistances_per_cohort.sql

  -- executes:

  SELECT DISTINCT(teachers.name) AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistances
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = assistance_requests.student_id
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  WHERE cohorts.name = 'JUL02'
  GROUP BY teacher, cohort
  ORDER BY teacher;
  ```
  Feel free to explore further and modify these queries based on your specific needs!
