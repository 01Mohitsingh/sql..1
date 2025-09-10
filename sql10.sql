use REGEX;
show tables;
select * from courses;
select * from enrollments;

-- full join
select student_id from students
union all
select student_id from enrollments;

-- INNER JOIN
select enrollments.student_id, count(*) from enrollments inner join students on enrollments.student_id = students.student_id group by enrollments.student_id;
 
-- LEFT AND RIGHT JOIN
select * from students left join enrollments on enrollments.student_id = students.student_id;
select students.first_name, enrollments.grade from students right join enrollments on enrollments.student_id = students.student_id;
select * from enrollments right join students on enrollments.student_id = students.student_id;

-- CROSS JOIN         both tables raws multiple raws as output
select * from students cross join courses;

-- self join
select * from employees;
select * from manager_employees;
select * from employees as e1 left join employees as e2 on e1.id = e2.manager_id;

select * from students left join enrollments on enrollments.student_id = students.student_id
union
select * from students right join enrollments on enrollments.student_id = students.student_id;

select * from students left join enrollments on enrollments.student_id = students.student_id;
select * from students right join enrollments on enrollments.student_id = students.student_id;