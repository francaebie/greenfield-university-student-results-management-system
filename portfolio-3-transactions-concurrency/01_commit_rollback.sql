USE greenfield_university;

-- See the original score for registration 1.
SELECT registration_id, coursework_score, exam_score, total_score, grade
FROM results WHERE registration_id = 1;

-- Demonstration A: rollback cancels the update.
START TRANSACTION;
UPDATE results
SET coursework_score = 30, exam_score = 50, grade = 'A'
WHERE registration_id = 1;
SELECT registration_id, coursework_score, exam_score, total_score, grade
FROM results WHERE registration_id = 1;
ROLLBACK;

-- Confirm original values returned.
SELECT registration_id, coursework_score, exam_score, total_score, grade
FROM results WHERE registration_id = 1;

-- Demonstration B: commit makes an update permanent.
-- Run this section only after you understand the rollback example.
START TRANSACTION;
UPDATE results
SET coursework_score = 31, exam_score = 51, grade = 'A'
WHERE registration_id = 1;
COMMIT;

SELECT registration_id, coursework_score, exam_score, total_score, grade
FROM results WHERE registration_id = 1;

-- Reset the sample record to its original seed values if desired.
-- UPDATE results SET coursework_score = 32, exam_score = 54, grade = 'A'
-- WHERE registration_id = 1;
