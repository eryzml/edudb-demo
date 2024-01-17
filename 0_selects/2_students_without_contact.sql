SELECT name, id, cohort_id
FROM students
WHERE (email IS NULL or email = '') OR (phone IS NULL or email = '');