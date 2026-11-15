USE greenfield_university;

-- Inspect the plan for a student lookup.
EXPLAIN
SELECT s.student_number, CONCAT(s.first_name, ' ', s.last_name) AS student_name,
       c.course_code, r.total_score, r.grade
FROM students s
JOIN registrations reg ON reg.student_id = s.student_id
JOIN courses c ON c.course_id = reg.course_id
JOIN results r ON r.registration_id = reg.registration_id
WHERE s.student_number = 'GFU/2024/001';

-- Inspect the plan for a score filter.
EXPLAIN
SELECT registration_id, total_score, grade
FROM results
WHERE total_score >= 70;

-- Check indexes on relevant tables.
SHOW INDEX FROM students;
SHOW INDEX FROM registrations;
SHOW INDEX FROM results;

-- Optional, depending on MySQL version:
-- EXPLAIN ANALYZE SELECT registration_id, total_score, grade
-- FROM results WHERE total_score >= 70;
