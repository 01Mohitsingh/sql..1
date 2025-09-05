show databases;
use monu;

select * from departments where dept_id between 1 and 3
union all
select * from departments where dept_id between 3 and 5;

select * from departments where dept_id between 1 and 3
union
select * from departments where dept_id between 3 and 5;

select * from departments where dept_id between 1 and 3
except
select * from departments where dept_id between 3 and 5;

select * from departments where dept_id between 1 and 3
intersect
select * from departments where dept_id between 3 and 5;

-- CTE --> it funtions by repeatedly executing a query untill a specified termination condition it met.

show tables;
with recursive cte as
(select 1 as n
union
select n+1 from cte where n < 6
)
select * from cte;


-- factorial
with recursive cte1 as
(select 1 as n, 1 as factorial
union
select n+1, factorial*(n+1) from cte1 where n < 6
)
select * from cte1;

select * from departments;
select * from employees;




-- factorial
with recursive cte1 as
(select 1 as n, 1 as factorial
union
select n+1, factorial*(n+1) from cte1 where n < 6
)
select * from cte1;

create database regex1;
use regex1;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;

-- define levels of employees in company -->

with recursive cte as 
(select employee_id, name, manager_id, 1 as levels
from employees as a where manager_id is null
union
select a.employee_id, a.name, a.manager_id, levels+1
from employees as a join cte as b where a.manager_id = b.employee_id)
select * from cte;