-- drop table if already exists
drop table if exists user1;

-- creating table
create table if not exists users1 (
user_id int primary key,
user_name varchar(50) not null,
email varchar(55) unique not null,
age int,
city varchar(50)
);

select * from users1;

insert into users1(user_id, user_name, email, age, city) values
(1,'piyush kumar', 'piyushkumar810@gmail.com', 23, 'bangalor'),
(2,'rahul', 'rahulrajan349@gmail.com', 24, 'mumbai'),
(3,'neha', 'nehasharma98@gmail.com', 22, 'delhi'),
(4,'arjun', 'arjunverma21@yahoo.com', 27, 'bangalore'),
(5,'megha', 'meghapatil05@gmail.com', 25, 'pune');

truncate table users1;

-- updating dataset
update users1
set age=24
where user_name='neha';
-- but after updating you will see odering is not in proper order neha's data went down 
-- to solve this

select * from users1 order by user_id ASC;


-- updating city whose age>25
update users1
set city='chenni'
where (age>=25);

-- updating age and city of piyush kumar
update users1
set age=24, city='jharkhand'
where user_name='piyush kumar';

-- updating using like
update users1
set age=age+1
where email like '%@gmail.com';
