# ERD relationships

Draw these six entities in MySQL Workbench's EER diagram or another diagram tool:

- `departments` 1 — many `students`
- `departments` 1 — many `lecturers`
- `departments` 1 — many `courses`
- `lecturers` 1 — many `courses`
- `students` 1 — many `registrations`
- `courses` 1 — many `registrations`
- `registrations` 1 — zero-or-one `results` (a result is optional until entered; each result belongs to one registration)

Primary keys:
- departments.department_id
- students.student_id
- lecturers.lecturer_id
- courses.course_id
- registrations.registration_id
- results.result_id

Foreign keys:
- students.department_id -> departments.department_id
- lecturers.department_id -> departments.department_id
- courses.department_id -> departments.department_id
- courses.lecturer_id -> lecturers.lecturer_id
- registrations.student_id -> students.student_id
- registrations.course_id -> courses.course_id
- results.registration_id -> registrations.registration_id

The unique constraint on `(student_id, course_id, academic_session, semester)` prevents a student being registered for the same course twice in the same session and semester.
