-- MIT 8103 | Franca Ebie
-- Portfolio 1: relational schema
-- WARNING: This recreates the project database and drops an existing database with this name.
DROP DATABASE IF EXISTS greenfield_university;
CREATE DATABASE greenfield_university;
USE greenfield_university;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    office_location VARCHAR(100)
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_number VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    date_of_birth DATE,
    admission_year YEAR NOT NULL,
    department_id INT NOT NULL,
    student_status ENUM('Active','Deferred','Graduated','Withdrawn') NOT NULL DEFAULT 'Active',
    CONSTRAINT fk_students_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE lecturers (
    lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_number VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    CONSTRAINT fk_lecturers_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(15) NOT NULL UNIQUE,
    course_title VARCHAR(120) NOT NULL,
    credit_units TINYINT UNSIGNED NOT NULL,
    department_id INT NOT NULL,
    lecturer_id INT NOT NULL,
    CONSTRAINT chk_course_units CHECK (credit_units BETWEEN 1 AND 6),
    CONSTRAINT fk_courses_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_courses_lecturer
        FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    academic_session VARCHAR(9) NOT NULL,
    semester ENUM('First','Second') NOT NULL,
    registered_at DATE NOT NULL,
    registration_status ENUM('Registered','Dropped','Completed') NOT NULL DEFAULT 'Registered',
    CONSTRAINT uq_student_course_session UNIQUE
        (student_id, course_id, academic_session, semester),
    CONSTRAINT fk_registrations_student
        FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_registrations_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_id INT NOT NULL UNIQUE,
    coursework_score DECIMAL(5,2) NOT NULL,
    exam_score DECIMAL(5,2) NOT NULL,
    total_score DECIMAL(5,2)
        GENERATED ALWAYS AS (coursework_score + exam_score) STORED,
    grade CHAR(2) NOT NULL,
    recorded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_coursework_score CHECK (coursework_score BETWEEN 0 AND 40),
    CONSTRAINT chk_exam_score CHECK (exam_score BETWEEN 0 AND 60),
    CONSTRAINT chk_total_score CHECK (coursework_score + exam_score BETWEEN 0 AND 100),
    CONSTRAINT chk_grade CHECK (grade IN ('A','B','C','D','E','F')),
    CONSTRAINT fk_results_registration
        FOREIGN KEY (registration_id) REFERENCES registrations(registration_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Helpful indexes for common searches and joins.
CREATE INDEX idx_students_department ON students(department_id);
CREATE INDEX idx_courses_department ON courses(department_id);
CREATE INDEX idx_registrations_course_session
    ON registrations(course_id, academic_session, semester);
CREATE INDEX idx_results_grade ON results(grade);
