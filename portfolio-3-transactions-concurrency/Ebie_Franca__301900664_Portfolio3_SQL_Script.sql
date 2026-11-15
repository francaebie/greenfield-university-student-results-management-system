
-- PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY CONTROL
-- Case Study: Greenfield University Student Results Management System

USE greenfield_university;

-- 1. Create a demonstration table for student fee transactions
CREATE TABLE IF NOT EXISTS student_fee_transaction_demo (
    demo_id INT PRIMARY KEY,
    student_number VARCHAR(30) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    outstanding_balance DECIMAL(10,2) NOT NULL,
    last_payment DECIMAL(10,2) DEFAULT 0,
    payment_status VARCHAR(30) NOT NULL
) ENGINE=InnoDB;

-- 2. Insert or reset demonstration records
INSERT INTO student_fee_transaction_demo
(demo_id, student_number, student_name, outstanding_balance, last_payment, payment_status)
VALUES
(1, 'GFU/DEMO/001', 'Ada Okafor', 150000.00, 0.00, 'Pending'),
(2, 'GFU/DEMO/002', 'Tunde Bello', 120000.00, 0.00, 'Pending')
ON DUPLICATE KEY UPDATE
student_number = VALUES(student_number),
student_name = VALUES(student_name),
outstanding_balance = VALUES(outstanding_balance),
last_payment = VALUES(last_payment),
payment_status = VALUES(payment_status);

-- 3. View the initial records
SELECT * FROM student_fee_transaction_demo;

-- 4. Demonstrate COMMIT
START TRANSACTION;

UPDATE student_fee_transaction_demo
SET outstanding_balance = outstanding_balance - 50000,
    last_payment = 50000,
    payment_status = 'Partially Paid'
WHERE demo_id = 1;

-- Check the change before committing
SELECT * FROM student_fee_transaction_demo
WHERE demo_id = 1;

COMMIT;

-- Confirm that the change was saved
SELECT * FROM student_fee_transaction_demo
WHERE demo_id = 1;

-- 5. Demonstrate ROLLBACK
START TRANSACTION;

UPDATE student_fee_transaction_demo
SET outstanding_balance = outstanding_balance - 25000,
    last_payment = 25000,
    payment_status = 'Partially Paid'
WHERE demo_id = 2;

-- Check the temporary change
SELECT * FROM student_fee_transaction_demo
WHERE demo_id = 2;

ROLLBACK;

-- Confirm that the change was reversed
SELECT * FROM student_fee_transaction_demo
WHERE demo_id = 2;

-- 6. Demonstrate transaction isolation levels
SELECT @@transaction_isolation AS Current_Isolation_Level;

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT @@transaction_isolation AS Current_Isolation_Level;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT @@transaction_isolation AS Current_Isolation_Level;
