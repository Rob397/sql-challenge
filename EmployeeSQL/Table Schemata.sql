
-- initial code
CREATE TABLE Employees(
    emp_no SERIAL,
    emp_title_id INT NOT NULL,
	DOB date,
	first_name VARCHAR (30),
	last_name VARCHAR(30),
	SEX VARCHAR(30),
	hire_date date,
    PRIMARY KEY (emp_no)
);


CREATE TABLE Salaries(
    emp_no INT NOT NULL,
	salary DEC NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);


CREATE TABLE Titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
    PRIMARY KEY (title_id)
);


CREATE TABLE Dept_Emp(
	Dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Salaries(emp_no)	
	);





    --Edited---This worked

DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Dept_Emp;
DROP TABLE Titles;



	CREATE TABLE Employees(
    emp_no INT NOT NULL,
    emp_title_id VARCHAR (30),
	DOB date,
	first_name VARCHAR (30),
	last_name VARCHAR(30),
	SEX VARCHAR(30),
	hire_date date,
    PRIMARY KEY (emp_no) 
);
	CREATE TABLE Titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
    PRIMARY KEY (title_id)
);
CREATE TABLE Salaries(
    emp_no INT NOT NULL,
	salary DEC NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Department(
    Dept_no VARCHAR (30) NOT NULL,
	Dept_name VARCHAR (30)NOT NULL,
	PRIMARY KEY (dept_no)
);


CREATE TABLE Dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no, dept_no)	
	);
	

	CREATE TABLE Dept_Manager(
	Dept_no VARCHAR(30) NOT NULL,
	emp_no VARCHAR(30) NOT NULL,
    PRIMARY KEY (Dept_no,emp_no)
);

