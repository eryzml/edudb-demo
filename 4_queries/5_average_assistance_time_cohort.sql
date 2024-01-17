SELECT cohorts.name AS name, AVG(completed_at-started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON students.id = assistance_requests.assignment_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE students.id = assistance_requests.assignment_id AND students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY average_assistance_time;