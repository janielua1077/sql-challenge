--Create Employee table 
CREATE TABLE employees (
	emp_no INT,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date VARCHAR
    PRIMARY KEY (emp_no),
    FOREIGN KEY (hire_date) REFERENCES employees(emp_no)
);
--Populate that table
SELECT * FROM employees

--Create Departmemts table
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR
    PRIMARY KEY (dept_no),
    FOREIGN KEY (dept_name) REFERENCES departments(dept_no)
	
);
--Populate Departments table
SELECT * FROM departments

--Create Department Employees table
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no, from_date, to_date) REFERENCES dept_emp(emp_no)

);
--Populate Department Employees Table
SELECT * FROM dept_emp

--Create Department Manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	from_date VARCHAR,
	to_date VARCHAR
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no, from_date, to_date) REFERENCES dept_manager(emp_no)
);
--Populate Department Employees table
SELECT * FROM dept_manager

-- Create Salaries Table
CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date VARCHAR,
	to_date VARCHAR
    PRIMARY KEY (emp_no),
    FOREIGN KEY (salary, from_date, to_date) REFERENCES salaries(emp_no)
);
-- Populate Salaries table
SELECT * FROM salaries

--Create Titles table
CREATE TABLE titles (
  	emp_no INT,
	title VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
    PRIMARY KEY (emp_no),
    FOREIGN KEY (title, from_date, to_date) REFERENCES titles(emp_no)
);
--Populate Titles Table
SELECT * FROM titles

--Create New Employee Profile Table
CREATE TABLE employee_profile (
    emp_no INT   NOT NULL,
    last_name VARCHAR   NOT NULL,
    first_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    salary INT   NOT NULL
);

ALTER TABLE employee_profile ADD CONSTRAINT fk_employee_profile_emp_no FOREIGN KEY(emp_no)
REFERENCES dept_emp (emp_no);

ALTER TABLE employee_profile ADD CONSTRAINT fk_employee_profile_last_name_first_name_gender FOREIGN KEY(last_name, first_name, gender)
REFERENCES employees (last_name, first_name, gender);

ALTER TABLE employee_profile ADD CONSTRAINT fk_employee_profile_salary FOREIGN KEY(salary)
REFERENCES salaries (salary);

--1. Query to Populate employee number, last name, first name, gender, and salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
LEFT JOIN salaries as sal
ON (emp.emp_no = sal.emp_no)

--2. Query to find employees who were hired in 1986
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--3. Department Manager List Query
SELECT dep.dept_no, depts.dept_name, dep.emp_no, emp.last_name, emp.first_name, dep.from_date, dep.to_date
FROM dept_manager AS dep
	JOIN departments AS depts
	ON (dep.dept_no = depts.dept_no)
	JOIN employees AS emp
	ON (emp.emp_no = dep.emp_no)

 --4. Query to pull employee number, last name, first name, and department name.     
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
LEFT JOIN departments as dep
ON (emp.emp_no = emp.emp_no)

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY emp_no

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees as emp
CROSS JOIN departments as dep
WHERE dep.dept_name = 'Marketing'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees as emp
CROSS JOIN departments as dep
WHERE dept_name = 'Development' OR dept_name = 'Sales'

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, count(*)
FROM employees
Group By last_name 
ORDER BY last_name DESC;

--Epiloque LOL
SELECT *
FROM employees
WHERE emp_no = '499942'


