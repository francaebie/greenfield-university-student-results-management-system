# Document model suitability and comparison

## Why use a document?
A document can keep a student's academic summary, session, semester and course-result list together. This is convenient when an application usually retrieves the whole student summary and course attributes vary.

## Trade-offs
- Relational MySQL tables enforce foreign keys and reduce duplicated student, course and lecturer information.
- A document model can be flexible and convenient for reading a complete student summary.
- Storing the same course or department details in many documents can create duplication and update anomalies.
- A document store does not automatically replace relational constraints or transaction design.

## Other NoSQL models to discuss
- Key-value: cache a frequently requested published result summary by student number.
- Wide-column: store very large academic event histories by student and time/session.
- Graph: model relationships such as students, courses, prerequisites and programme pathways.

For the practical implementation, use the JSON example and, if required by your lecturer, import it into a genuine NoSQL database. Clearly distinguish MySQL's JSON support from a separate NoSQL engine.
