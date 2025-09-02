
show databases;
use mohit1;
create database mohit1;
show tables;

-- Department Table
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
-- Employee Table
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT NULL,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');
-- Insert Employees
INSERT INTO Employees (emp_id, emp_name, manager_id, salary, dept_id) VALUES
(101, 'Alice', NULL, 90000, 3), -- Alice is IT Head
(102, 'Bob', 101, 60000, 3), -- Bob reports to Alice
(103, 'Charlie', 101, 55000, 3), -- Charlie reports to Alice
(104, 'David', 102, 40000, 3), -- David reports to Bob
(105, 'Eve', NULL, 80000, 2), -- Eve is Finance Head
(106, 'Frank', 105, 50000, 2), -- Frank reports to Eve
(107, 'Grace', NULL, 75000, 1), -- Grace is HR Head
(108, 'Heidi', 107, 45000, 1), -- Heidi reports to Grace
(109, 'Ivan', NULL, 70000, 4), -- Ivan is Marketing Head
(110, 'Judy', 109, 48000, 4); -- Judy reports to Ivan


show tables;

-- Find each employee’s manager (if any).

select a.emp_name as employee,b.emp_name as manager from employees as a join employees as b
on a.manager_id = b.emp_id;

-- Calculate average salary per department. 
select a.dept_id, avg(b.salary) from departments as a 
join employees as b on a.dept_id = b.dept_id
group by a.dept_id;

-- Find employees who earn more than the average salary of their department.
select emp_name, salary from employees as e
where e.salary > (select avg(a.salary) from employees as a where a.dept_id = e.dept_id);

-- Show each employee with manager name, department, and whether they earn
-- above their department average.
select e1.emp_name, e1.salary, e2.emp_name as manager, d.dept_name from employees as e1
join employees as e2 on e1.emp_id = e2.manager_id 
join departments as d on e2.dept_id = d.dept_id
where e1.salary > (select avg(a.salary) from employees as a where a.dept_id = e1.dept_id);

-- Find the highest-paid employee(s) in each department using a subquery
select emp_name, salary from employees as e
where (e.dept_id, e.salary) in 
(select a.dept_id, max(a.salary) from employees as a where a.dept_id = e.dept_id
group by a.dept_id);

-- find departments where the average salary is higher than the overall company average salary
select * from departments;
select * from employees;
select d.dept_name, sum(e.salary) from employees as e
join departments as d on e.dept_id = d.dept_id
group by d.dept_name
having sum(e.salary) > (select avg(salary) from employees);