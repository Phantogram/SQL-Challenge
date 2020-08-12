--Display each table
select * from titles
select * from employees
select * from departments
select * from dept_manager
select * from dept_emp
select * from salaries

--List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
select hire_date from employees;

select first_name, last_name, hire_date
from employees
where hire_date between date '1986-01-01' and '1986-12-31'
order by hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	m.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
	
FROM
	departments d
INNER JOIN dept_manager m 
    ON m.dept_no = d.dept_no
INNER JOIN employees e 
    ON e.emp_no = m.emp_no
ORDER BY dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	m.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
FROM
	departments d
INNER JOIN dept_emp m 
    ON m.dept_no = d.dept_no
INNER JOIN employees e 
    ON e.emp_no = m.emp_no
ORDER BY dept_name;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees
where first_name = 'Hercules'
and last_name like '%B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	m.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
FROM
	departments d
INNER JOIN dept_emp m 
    ON m.dept_no = d.dept_no
INNER JOIN employees e 
    ON e.emp_no = m.emp_no
WHERE dept_name = 'Sales'
ORDER BY emp_no;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	m.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
FROM
	departments d

INNER JOIN dept_emp m 
    ON m.dept_no = d.dept_no
INNER JOIN employees e 
    ON e.emp_no = m.emp_no
WHERE dept_name = 'Sales' OR (dept_name = 'Development')
ORDER BY emp_no;


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name, count(employees.last_name) from employees
group by last_name
order by count desc;

--Epilogue
select * from employees
where emp_no = '499942';

