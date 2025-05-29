CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees (name, department, salary) VALUES
('Alice Smith', 'HR', 60000),
('Bob Johnson', 'Engineering', 80000),
('Carol Evans', 'Finance', 75000);
