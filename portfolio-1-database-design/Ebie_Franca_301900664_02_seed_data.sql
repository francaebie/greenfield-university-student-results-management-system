USE greenfield_university;

INSERT INTO departments (department_name, office_location) VALUES
('Computer Science','Science Block A'),
('Applied Mathematics','Science Block B'),
('Business Administration','Management Building'),
('Information Technology','Technology Building');

INSERT INTO students
(student_number, first_name, last_name, email, date_of_birth, admission_year, department_id, student_status)
VALUES
('GFU/2024/001','Ada','Okafor','ada.okafor@example.edu','2005-03-12',2024,1,'Active'),
('GFU/2024/002','Tunde','Balogun','tunde.balogun@example.edu','2004-11-02',2024,2,'Active'),
('GFU/2023/014','Mariam','Yusuf','mariam.yusuf@example.edu','2003-07-21',2023,3,'Active'),
('GFU/2024/018','Chidi','Eze','chidi.eze@example.edu','2005-01-30',2024,4,'Active'),
('GFU/2022/031','Zainab','Bello','zainab.bello@example.edu','2002-09-17',2022,1,'Active'),
('GFU/2023/022','David','Akinyemi','david.akinyemi@example.edu','2004-05-08',2023,2,'Active'),
('GFU/2024/027','Ngozi','Nwosu','ngozi.nwosu@example.edu','2005-12-10',2024,3,'Active'),
('GFU/2022/041','Samuel','James','samuel.james@example.edu','2002-04-19',2022,4,'Active'),
('GFU/2023/035','Fatima','Sani','fatima.sani@example.edu','2004-02-14',2023,1,'Active'),
('GFU/2024/044','Peter','Adeyemi','peter.adeyemi@example.edu','2005-08-26',2024,2,'Active');

INSERT INTO lecturers
(staff_number, first_name, last_name, email, department_id)
VALUES
('GFU/STAFF/101','Grace','Ibrahim','grace.ibrahim@example.edu',1),
('GFU/STAFF/102','Michael','Ojo','michael.ojo@example.edu',2),
('GFU/STAFF/103','Helen','Umeh','helen.umeh@example.edu',3),
('GFU/STAFF/104','Kunle','Fashola','kunle.fashola@example.edu',4),
('GFU/STAFF/105','Bola','Danladi','bola.danladi@example.edu',1);

INSERT INTO courses
(course_code, course_title, credit_units, department_id, lecturer_id)
VALUES
('CSC101','Introduction to Computing',3,1,1),
('CSC205','Database Fundamentals',3,1,5),
('MTH101','Foundations of Mathematics',3,2,2),
('MTH203','Statistics for Computing',3,2,2),
('BUS101','Principles of Management',2,3,3),
('ITC201','Information Systems',3,4,4),
('CSC310','Advanced Database Systems',3,1,5),
('BUS205','Business Analytics',3,3,3);

INSERT INTO registrations
(student_id, course_id, academic_session, semester, registered_at, registration_status)
VALUES
(1,1,'2025/2026','First','2025-09-08','Completed'),
(1,2,'2025/2026','First','2025-09-08','Completed'),
(1,7,'2025/2026','First','2025-09-08','Completed'),
(2,3,'2025/2026','First','2025-09-08','Completed'),
(2,4,'2025/2026','First','2025-09-08','Completed'),
(2,1,'2025/2026','First','2025-09-08','Completed'),
(3,5,'2025/2026','First','2025-09-08','Completed'),
(3,8,'2025/2026','First','2025-09-08','Completed'),
(4,6,'2025/2026','First','2025-09-08','Completed'),
(4,1,'2025/2026','First','2025-09-08','Completed'),
(5,2,'2025/2026','First','2025-09-08','Completed'),
(5,7,'2025/2026','First','2025-09-08','Completed'),
(6,3,'2025/2026','First','2025-09-08','Completed'),
(6,4,'2025/2026','First','2025-09-08','Completed'),
(7,5,'2025/2026','First','2025-09-08','Completed'),
(7,8,'2025/2026','First','2025-09-08','Completed'),
(8,6,'2025/2026','First','2025-09-08','Completed'),
(8,1,'2025/2026','First','2025-09-08','Completed'),
(9,1,'2025/2026','First','2025-09-08','Completed'),
(9,2,'2025/2026','First','2025-09-08','Completed'),
(10,3,'2025/2026','First','2025-09-08','Completed'),
(10,4,'2025/2026','First','2025-09-08','Completed');

INSERT INTO results (registration_id, coursework_score, exam_score, grade) VALUES
(1,32,54,'A'),
(2,28,46,'B'),
(3,35,57,'A'),
(4,30,48,'B'),
(5,24,39,'C'),
(6,26,43,'B'),
(7,31,52,'A'),
(8,27,44,'B'),
(9,29,48,'B'),
(10,22,35,'C'),
(11,34,55,'A'),
(12,30,51,'A'),
(13,18,28,'D'),
(14,25,42,'B'),
(15,20,33,'C'),
(16,33,54,'A'),
(17,27,45,'B'),
(18,29,50,'A'),
(19,16,25,'D'),
(20,23,36,'C'),
(21,36,58,'A'),
(22,28,47,'B');
