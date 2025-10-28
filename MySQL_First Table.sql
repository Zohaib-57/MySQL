
use techbuzz;
create table employee(
id int primary key,
name varchar(50),
age int not null
);
insert into employee values( 1 ,"Ali Firdous",34),( 2 ,"Kamal Khan",56),( 3 ,"Zubiar Ali",48);
select * from employee;