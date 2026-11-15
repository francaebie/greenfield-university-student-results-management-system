USE greenfield_university;

-- 1. Confirm row counts in each table.
SELECT 'departments' AS table_name, COUNT(*) AS row_count FROM departments
UNION ALL SELECT 'students', COUNT(*) FROM students
UNION ALL SELECT 'lecturers', COUNT(*) FROM lecturers
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'registrations', COUNT(*) FROM registrations
UNION ALL SELECT 'results', COUNT(*) FROM results;

-- 2. View student results.
SELECT s.student_number,
       CONCAT(s.first_name, ' ', s.last_name) AS student_name,
       c.course_code,
       c.course_title,
       r.coursework_score,
       r.exam_score,
       r.total_score,
       r.grade,
       reg.academic_session,
       reg.semester
FROM results r
JOIN registrations reg ON reg.registration_id = r.registration_id
JOIN students s ON s.student_id = reg.student_id
JOIN courses c ON c.course_id = reg.course_id
ORDER BY s.student_number, c.course_code;

-- 3. Average score by course.
SELECT c.course_code, c.course_title,
       COUNT(r.result_id) AS students_with_results,
       ROUND(AVG(r.total_score), 2) AS average_score
FROM courses c
JOIN registrations reg ON reg.course_id = c.course_id
JOIN results r ON r.registration_id = reg.registration_id
GROUP BY c.course_id, c.course_code, c.course_title
ORDER BY average_score DESC;

-- 4. Check for registrations without results.
SELECT reg.registration_id, s.student_number, c.course_code
FROM registrations reg
JOIN students s ON s.student_id = reg.student_id
JOIN courses c ON c.course_id = reg.course_id
LEFT JOIN results r ON r.registration_id = reg.registration_id
WHERE r.result_id IS NULL;
