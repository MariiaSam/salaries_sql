-- 1. Відділи
CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL
);

-- 2. Працівники
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT NOT NULL,
    job_title TEXT NOT NULL,
    dept_id INTEGER,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 3. Зарплати
CREATE TABLE salaries (
    salary_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    salary_in_usd INTEGER NOT NULL,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- 4. Проекти
CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY,
    project_name TEXT NOT NULL,
    start_date DATE,
    end_date DATE,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 5. Участь у проектах (many-to-many)
CREATE TABLE project_assignments (
    assign_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    project_id INTEGER,
    role TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- 6. Позиції (посади)
CREATE TABLE job_positions (
    job_id INTEGER PRIMARY KEY,
    job_title TEXT NOT NULL,
    min_salary INTEGER,
    max_salary INTEGER
);

-- 7. Тренінги
CREATE TABLE trainings (
    training_id INTEGER PRIMARY KEY,
    training_name TEXT NOT NULL,
    provider TEXT,
    duration_days INTEGER
);

-- 8. Відвідування тренінгів
CREATE TABLE training_attendance (
    attend_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    training_id INTEGER,
    completion_status TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (training_id) REFERENCES trainings(training_id)
);

-- 9. Performance review
CREATE TABLE performance_reviews (
    review_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    review_date DATE,
    rating INTEGER,
    comments TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);