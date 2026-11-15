# Keys, constraints and normalisation notes

## Keys
Each table has a primary key. Foreign keys connect related records and protect referential integrity. Natural identifiers such as student number, staff number and course code have unique constraints so duplicates cannot be entered.

## Constraints
- Required names and identifiers use `NOT NULL`.
- Student numbers, emails, staff numbers and course codes are unique.
- Course credit units must be between 1 and 6.
- Coursework scores are limited to 0–40 and examination scores to 0–60.
- A result can only reference an existing registration.
- A student cannot register for the same course twice in one session and semester.

## Normalisation
The design aims for Third Normal Form (3NF):
- 1NF: each field contains a single value; repeated course registrations are stored as separate rows rather than columns.
- 2NF: non-key attributes in each table depend on the whole primary key. Registration-specific attributes are stored in `registrations`, not in `students`.
- 3NF: department names are stored once in `departments`; lecturer details are stored in `lecturers`; course details are stored in `courses`. These details are referenced by keys instead of being repeatedly copied into each result row.

`total_score` is a generated column calculated from coursework and exam scores, so it is not manually maintained. The grade is stored as entered by the results officer in this starter version; in a later refinement, a controlled grade-calculation rule or trigger could be used. Confirm the grading policy with your lecturer before treating any grade scale as official.
