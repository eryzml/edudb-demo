SELECT DISTINCT(teachers.name) AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistances
FROM students
JOIN cohorts ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher;