
-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

-- 8. In descending order, list the frequency count of employee last names,
--  i.e., how many employees share each last name.

-- examples---------------------------------------
 Bonus 1:
-- Create a query to view cities in Queensland
SELECT city, state
FROM cities
WHERE state = 'Queensland';

-- Bonus 2:
-- Create a query to view cities and states
-- with a population less than 1,000,000
SELECT *
FROM cities
WHERE population < 1000000;

-- Bonus 3:
-- Create a query to view the city in Queensland
-- with a population of less than 1,000,000
SELECT *
FROM cities
WHERE population < 1000000
AND state = 'Queensland';

----------------------------------------------------------
-- 1. List the following details of each employee: employee number, last name, first name, sex, 
-- and salary.
--need to join Salary table to get salary info

SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Employees.SEX, Salaries.salary
FROM Salaries
INNER JOIN Employees ON
Employees.emp_no=Salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE (hire_date BETWEEN '01/01/1986' AND '12/31/1986');
--however Sqlite (unable to install PostregreSQL) does not use this format so YYYY-MM-DD need to be used with the excel table format changed

SELECT first_name, last_name, hire_date
FROM Employees
WHERE (hire_date BETWEEN '1986/01/01' AND '1986/12/31');

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.


SELECT Dept_Manager.Dept_no, Department.Dept_name, Employees.first_name, Employees.last_name, Dept_Manager.emp_no
  FROM Employees
  INNER JOIN Dept_Manager
  ON Dept_Manager.emp_no = Employees.emp_no
  INNER JOIN Department
  ON Dept_Manager.Dept_no = Department.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Department.dept_name
FROM Employees
INNER JOIN Dept_emp ON
Employees.emp_no= Dept_emp.emp_no;
INNER JOIN Department
ON  Dept_emp.dept_no=Department.dept_no;


-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE(first_name ='Hercules' AND last_name LIKE 'B%');

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.


SELECT Employees.first_name, Employees.last_name, Employees.emp_no, Department.Dept_name
FROM Employees
INNER JOIN Dept_emp ON
Employees.emp_no= Dept_emp.emp_no;
INNER JOIN Department
ON  Dept_emp.dept_no=Department.dept_no
WHERE dept_name = 'Sales'
