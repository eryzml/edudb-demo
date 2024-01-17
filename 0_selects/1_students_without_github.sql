SELECT id, name, email, cohort_id
FROM students
WHERE github = '' OR github IS NULL
ORDER BY cohort_id;