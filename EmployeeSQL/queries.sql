
----------------------------------------------------------
-- 1. List the following details of each employee: employee number, last name, first name, sex, 
-- and salary.
--Need to join Salary table to get salary info

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

SELECT Dept_Manager.Dept_no, Department.Dept_name, Dept_Manager.emp_no, Employees.first_name, Employees.last_name
  FROM Department
  INNER JOIN Dept_Manager
  ON Dept_Manager.Dept_no = Department.dept_no
  INNER JOIN Employees
  ON Dept_Manager.emp_no = Employees.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT  Dept_emp.emp_no,Employees.first_name, Employees.last_name,Department.dept_name
FROM Department
INNER JOIN Dept_emp ON
Department.dept_no = Dept_emp.dept_no
INNER JOIN Employees ON
Dept_emp.emp_no =Employees.emp_no



-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE(first_name ='Hercules' AND last_name LIKE 'B%');

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name. 


SELECT Department.dept_name, Dept_emp.emp_no,Employees.first_name, Employees.last_name
FROM Department
INNER JOIN Dept_emp ON
Department.dept_no = Dept_emp.dept_no
INNER JOIN Employees ON
Dept_emp.emp_no =Employees.emp_no
WHERE (dept_name = 'Sales');


-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.-done
SELECT Department.dept_name, Dept_emp.emp_no,Employees.first_name, Employees.last_name
FROM Department
INNER JOIN Dept_emp ON
Department.dept_no = Dept_emp.dept_no
INNER JOIN Employees ON
Dept_emp.emp_no =Employees.emp_no
WHERE (dept_name = 'Sales' OR dept_name ='Development');

-- 8. In descending order, list the frequency count of employee last names,
--  i.e., how many employees share each last name.

SELECT DISTINCT(Employees.last_name)
FROM Employees
ORDER BY last_name DESC;

SELECT COUNT(DISTINCT Employees.last_name)
FROM Employees