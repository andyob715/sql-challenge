-- Need to create the following tables
-- employees, titles, salaries, dept_manager, dept_emp, departments

-- 1. create titles (needed first to build employees with FK)
CREATE TABLE titles (
title_id VARCHAR NOT NULL PRIMARY KEY,
title VARCHAR NOT NULL
);

-- 2. Create employees
CREATE TABLE employees (
  	emp_no INT NOT NULL PRIMARY KEY,
  	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id),
  	birth_date DATE NOT NULL,
  	first_name VARCHAR,
  	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE NOT NULL
);

-- 3. Create Salaries (needed employees for FK)
CREATE TABLE salaries (
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INT NOT NULL
);

-- 4. Create Departments (will have be FK for others)
CREATE TABLE departments (
dept_no VARCHAR NOT NULL PRIMARY KEY,
dept_name VARCHAR NOT NULL
);

-- 5. Create Dept/Emp table with FK Dept and FK Emp
CREATE TABLE dept_emp (
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR NOT NULL,
FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- 6. Create Dept_Manager
CREATE TABLE dept_manager (
dept_no VARCHAR NOT NULL,
FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);