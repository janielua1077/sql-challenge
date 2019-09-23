--Create Employee table 
CREATE TABLE employees (
	emp_no INT,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date VARCHAR
);
--Populate that table
SELECT * FROM employees

--Create Departmemts table
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR
	
);
--Populate Departments table
SELECT * FROM departments

--Create Department Employees table
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR

);
--Populate Department Employees Table
SELECT * FROM dept_emp

--Create Department Manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	from_date VARCHAR,
	to_date VARCHAR
);
--Populate Department Employees table
SELECT * FROM dept_manager

-- Create Salaries Table
CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date VARCHAR,
	to_date VARCHAR
);
-- Populate Salaries table
SELECT * FROM salaries

--Create Titles table
CREATE TABLE titles (
  	emp_no INT,
	title VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
);
--Populate Titles Table
SELECT * FROM titles