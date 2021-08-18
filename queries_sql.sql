-- basic queries for reference
select * from employees;
select * from departments;
select * from salaries;
select * from dept_manager;
select * from dept_emp;
select * from titles;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no = salaries.emp_no;
	
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name,last_name,hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
-- that way returns 36,150 also probably a little janky

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no,departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN employees ON
employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no;
-- This returns more rows than employees, is this expected

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.