# Two-session isolation exercise

This exercise requires two Workbench query tabs or two separate connections to the same local database.

1. In Session A, run:
   `SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;`
   `START TRANSACTION;`
   `SELECT coursework_score, exam_score FROM greenfield_university.results WHERE registration_id = 1;`
2. In Session B, run:
   `SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;`
   `START TRANSACTION;`
   `UPDATE greenfield_university.results SET coursework_score = 29 WHERE registration_id = 1;`
   `COMMIT;`
3. In Session A, repeat the SELECT. Under READ COMMITTED, a new SELECT statement can see the committed value from Session B.
4. Run `COMMIT;` in Session A.
5. Reset the sample score to its original value if needed:
   `UPDATE greenfield_university.results SET coursework_score = 32, exam_score = 54, grade = 'A' WHERE registration_id = 1;`

Record what each session saw. Exact behaviour depends on transaction isolation and the sequence in which statements are run. Never claim you observed a result you did not see.
