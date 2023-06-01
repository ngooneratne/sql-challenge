-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    dept_no varchar(20) NOT NULL  ,
    dept_name varchar(20)   NOT NULL
	primary key (dept_no)
    
);


CREATE TABLE dept_emp (
    emp_no int NOT NULL  ,
    dept_no varchar(20)   NOT NULL
    primary key (emp_no)
	foreign key (dept_no) references departments(dept_no)
     
);


CREATE TABLE dept_manager (
    dept_no varchar(20) NOT NULL  ,
    emp_no int  NOT NULL
	foreign key (dept_no) references departments(dept_no)
	foreign key (emp_no) references dept_emp(emp_no)
);


CREATE TABLE employees (
    emp_no int NOT NULL  ,
    emp_title varchar(20) NOT NULL  ,
    birth_date varchar(20) NOT NULL ,
    first_name varchar(20)  NOT NULL ,
    last_name varchar(20) NOT NULL ,
    sex varchar(20)  NOT NULL ,
    hire_date varchar(20) NOT NULL 
	foreign key (emp_no) references dept_emp(emp_no)
	foreign key (emp_title) references titles(title_id)
);


CREATE TABLE salaries (
    emp_no int NOT NULL  ,
    salary int NOT NULL
	foreign key (emp_no) references dept_emp(emp_no)
);


CREATE TABLE titles (
    title_id varchar(20) NOT NULL ,
    title varchar(20)  NOT NULL
	primary key (title_id)
    
);

--1)
select e.emp_no, last_name, first_name, sex, salary
from employees e
join salaries s on e.emp_no = s.emp_no

--2)
select last_name, first_name, hire_date
from employees
where hire_date like '%1986'

--3)
select * from dept_manager
select * from employees
select dept_no, e.emp_no, last_name, first_name
from employees e
join dept_manager dm on dm.emp_no = e.emp_no

--4)
select * from employees
select * from dept_emp
select d.dept_no, e.emp_no, last_name, first_name, dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no

--5)
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6)
select*from departments
select de.emp_no, first_name, last_name, dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where dept_name = 'Sales'

--7)
select * from departments
select * from employees
select de.emp_no, last_name, first_name, dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where dept_name = 'Sales'
or dept_name = 'Development'

--8)
select last_name, count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc


