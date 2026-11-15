
-- PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION
-- Database: Greenfield University

USE greenfield_university;

-- 1. Inspect existing indexes
SELECT
    TABLE_NAME,
    INDEX_NAME,
    COLUMN_NAME,
    NON_UNIQUE
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = DATABASE()
ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX;

-- 2. Check academic sessions
SELECT
    academic_session,
    semester,
    COUNT(*) AS Total_Registrations
FROM registrations
GROUP BY academic_session, semester;

-- 3. Baseline execution plan
EXPLAIN
SELECT
    s.student_number,
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_title,
    r.academic_session,
    r.semester
FROM registrations r
JOIN students s ON r.student_id = s.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE r.academic_session = '2025/2026'
AND r.semester = 'First';

-- 4. Test available course IDs
SELECT DISTINCT course_id
FROM registrations
ORDER BY course_id;

-- 5. Execution plan using composite index
EXPLAIN
SELECT
    registration_id,
    student_id,
    course_id,
    academic_session,
    semester
FROM registrations
WHERE course_id = 1
AND academic_session = '2025/2026'
AND semester = 'First';

-- 6. Execution plan ignoring composite index
EXPLAIN
SELECT
    registration_id,
    student_id,
    course_id,
    academic_session,
    semester
FROM registrations
IGNORE INDEX (idx_registrations_course_session)
WHERE course_id = 1
AND academic_session = '2025/2026'
AND semester = 'First';

-- 7. Actual performance using composite index
EXPLAIN ANALYZE
SELECT
    registration_id,
    student_id,
    course_id,
    academic_session,
    semester
FROM registrations
WHERE course_id = 1
AND academic_session = '2025/2026'
AND semester = 'First';

-- 8. Actual performance ignoring composite index
EXPLAIN ANALYZE
SELECT
    registration_id,
    student_id,
    course_id,
    academic_session,
    semester
FROM registrations
IGNORE INDEX (idx_registrations_course_session)
WHERE course_id = 1
AND academic_session = '2025/2026'
AND semester = 'First';
