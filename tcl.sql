use test;
-- auto commit is used for you change on server then set value 1 of auto commit and value is 0 then data not updated on server
select @@autocommit;
show tables;
select * from books;

set @@autocommit = 0;
select * from books;
INSERT INTO `test`.`books` (`BookID`, `Title`, `Author`, `Price`) VALUES ('8', 'Hello Brother', 'Rohit Singh', '1500');

/*
Transaction start: 
-- start transaction
or
-- auto commit is disable

dml operation (transaction pending)

*/
set @@autocommit = 0;
select @@autocommit;
INSERT INTO `test`.`books` (`BookID`, `Title`, `Author`, `Price`) VALUES ('9', 'Hello Brother', 'Rohit Singh', '1500');
update books set Title = "CopyId";
select * from books;

rollback;

INSERT INTO `test`.`books` (`BookID`, `Title`, `Author`, `Price`) VALUES ('10', 'Hello Brother', 'Rohit Singh', '1500');
select * from books;
commit;
rollback;

update books set Title = "Hello brother";
select * from books;
commit;
rollback;

start transaction;
INSERT INTO `test`.`books` (`BookID`, `Title`, `Author`, `Price`) VALUES ('11', 'Hello Brother', 'Rohit Singh', '1500');
INSERT INTO `test`.`books` (`BookID`, `Title`, `Author`, `Price`) VALUES ('12', 'Hello Brother', 'Rohit Singh', '1500');
savepoint hello;
INSERT INTO `test`.`books` (`BookID`, `Title`, `Author`, `Price`) VALUES ('13', 'Hello Brother', 'Rohit Singh', '1500');
rollback to hello;
select * from books;
