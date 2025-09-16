use test;
select * from books;

-- DCL -->  DATA CONTROL LANGUAGE
-- Authentication and Authorization

select * from mysql.user;
create user test identified by 'test123';
create user test@'192.168.%' identified by 'test123';

create database ecommerce;
use ecommerce;
create table customer(id int primary key, name varchar(50))
insert into customer values(1,'abhi'),(2,'yash');   -- not run query due not have cridintialce

grant all privileges on customer.* to test;  -- give all permissions by all privileges

insert into customer values(1,'abhi'),(2,'yash');

-- if we wants to show all permissions of test user
show grants for test;
-- if we wants to remove any privileges or perticular privilege
revoke all privileges on customer.* from test;