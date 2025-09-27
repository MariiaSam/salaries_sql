-- Відділи
INSERT INTO departments VALUES
(1, 'Data Science'),
(2, 'Engineering'),
(3, 'HR'),
(4, 'Finance');

-- Посади
INSERT INTO job_positions VALUES
(1, 'Data Scientist', 80000, 150000),
(2, 'ML Engineer', 90000, 160000),
(3, 'Backend Engineer', 85000, 140000),
(4, 'HR Manager', 60000, 90000),
(5, 'Accountant', 50000, 80000);

-- Працівники
INSERT INTO employees VALUES
(1, 'Alice', 'Data Scientist', 1, '2020-01-15'),
(2, 'Bob', 'ML Engineer', 1, '2021-03-10'),
(3, 'Charlie', 'Backend Engineer', 2, '2019-07-23'),
(4, 'Diana', 'HR Manager', 3, '2018-11-05'),
(5, 'Eve', 'Accountant', 4, '2022-06-01');

-- Зарплати
INSERT INTO salaries VALUES
(1, 1, 120000, '2020-01-15', NULL),
(2, 2, 150000, '2021-03-10', NULL),
(3, 3, 100000, '2019-07-23', NULL),
(4, 4, 70000, '2018-11-05', NULL),
(5, 5, 60000, '2022-06-01', NULL);

-- Проекти
INSERT INTO projects VALUES
(1, 'AI Platform', '2022-01-01', '2023-12-31', 1),
(2, 'Backend Revamp', '2021-05-01', NULL, 2);

-- Участь у проектах
INSERT INTO project_assignments VALUES
(1, 1, 1, 'Lead Data Scientist'),
(2, 2, 1, 'ML Engineer'),
(3, 3, 2, 'Backend Developer');

-- Тренінги
INSERT INTO trainings VALUES
(1, 'Deep Learning Bootcamp', 'Coursera', 30),
(2, 'Agile Project Management', 'Udemy', 10);

-- Відвідування тренінгів
INSERT INTO training_attendance VALUES
(1, 1, 1, 'Completed'),
(2, 2, 1, 'In Progress'),
(3, 4, 2, 'Completed');

-- Performance Reviews
INSERT INTO performance_reviews VALUES
(1, 1, '2023-01-10', 5, 'Excellent work'),
(2, 2, '2023-01-15', 4, 'Good progress'),
(3, 3, '2023-01-20', 3, 'Needs improvement'),
(4, 4, '2023-01-25', 5, 'Great HR leadership');
