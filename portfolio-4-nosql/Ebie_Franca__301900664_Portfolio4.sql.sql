USE greenfield_university;

CREATE TABLE IF NOT EXISTS student_academic_documents (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    student_number VARCHAR(20) NOT NULL,
    academic_document JSON NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO student_academic_documents (student_number, academic_document)
VALUES
(
 'GFU/2024/001',
 JSON_OBJECT(
   'studentNumber', 'GFU/2024/001',
   'name', JSON_OBJECT('first', 'Ada', 'last', 'Okafor'),
   'department', 'Computer Science',
   'academicSession', '2025/2026',
   'semester', 'First',
   'courses', JSON_ARRAY(
      JSON_OBJECT('courseCode','CSC101','totalScore',86,'grade','A'),
      JSON_OBJECT('courseCode','CSC205','totalScore',74,'grade','B'),
      JSON_OBJECT('courseCode','CSC310','totalScore',92,'grade','A')
   )
 )
);

-- Read a document.
SELECT student_number,
       JSON_PRETTY(academic_document) AS formatted_document
FROM student_academic_documents
WHERE student_number = 'GFU/2024/001';

-- Extract the department and session from the JSON document.
SELECT student_number,
       JSON_UNQUOTE(JSON_EXTRACT(academic_document, '$.department')) AS department,
       JSON_UNQUOTE(JSON_EXTRACT(academic_document, '$.academicSession')) AS academic_session
FROM student_academic_documents;
