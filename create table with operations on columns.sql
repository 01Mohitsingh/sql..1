use mydata;
create table student1(
id int primary key,
full_name varchar(50) not null,
age int,
price decimal(10,2),
discount decimal(10,2)
);
insert into student1(id,full_name,age,price,discount)values(2,"Mohit Singh",25,"222222.32.12","77777.55"),(3,"Mohit Singh",25,"222222.32.12","77777.55");


show databases;

use regex;

-- create table 
create table student11(id int, name varchar(50));
-- insert data
insert into student11(id) values (4);
insert into student11(name) values ('monu');
insert into student11(id,name) values (2,'rohit'),(3,'monu');
-- update query 
-- for query apply for all rows
update student11 set name = 'Vinod';
-- query for delete perticular conditional row
update student11 set id = 1 where name = 'Vinod';
update student11 set name = "Rohit Singh" where id = 2;
update student11 set name = 'Tonu' where id between 1 and 3;

-- delete query
-- for delete all rows of table
delete from student11;
-- for delete perticular conditional row
delete from student11 where id = 3;


/*
MERGE-->

merge into table using regerencetabel 
when condition then statement(insert/update/delete)
*/

-- TRUNCATE
/*
truncate just delete the table data

truncate --> drop table + recreate table structure
	means that its using this query for 1st for drop the table then recreate table structure
*/

truncate table student11;
select * from student11;

-- tinyint --> size is smallar 1 byte 2^8 = 256 (-128 to 127)
create table test18(id tinyint);
insert into test18 values(10);
insert into test18 values(-128);
insert into test18 values(-129); -- given error 
drop table test18;

-- unsigned --> take value positive only
-- tinyint with unsigned --> size is smallar 1 byte 2^8 = 256 (0 to 255)
create table test19(id tinyint unsigned);
insert into test19 values(10);
insert into test19 values(-128); -- given error
insert into test19 values(255);
insert into test19 values(256); -- given error
select * from test19; 
drop table test19;

use regex;
create table test1(id int unique not null default 1, salary int default 0, sname varchar(30) not null);
insert into test1(id) values(1); -- error
insert into test1(sname) values ('Mohit Singh');
insert into test1(sname) values ('Mohit Singh'); -- error bcz id work for last query and now give error
insert into test1(id) values (2); -- error due to sname is null
select * from test1;
drop table test1;

create table test2(id int primary key, salary int default 0, sname varchar(30) not null);
insert into test2(sname) values ('Mohit Singh');   -- error due to primary key is not null and unique also
insert into test2(id,sname) values (1,'Mohit Singh');
insert into test2 values (2,7827,'Rohit Singh');
select * from test2;
drop table test2;

create table test2(id int primary key, id1 int primary key);   -- error due to do not allow multiple primary key in single table

drop table st1;
create table st1(sid int, sname varchar(20), FOREIGN KEY (sid,sname) REFERENCES cours(cid,cname), primary key(sid,sname));
create table cours(cid int, cname varchar(20), primary key(cid,cname));
insert into cours values (1, 'Python'),(2,'Java'),(3,'AWS');
insert into st1 values (1, 'Mohit', 3),(2,'Prince',1),(3,'Vinod',2),(4,'Ishan',3);
select * from st1;
select * from cours;
drop table cours;

