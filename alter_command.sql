drop TABLE IF EXISTS user2;

CREATE table IF NOT EXISTS users2(
    user_id int primary key,
    user_name varchar(20) not null,
    email varchar(50) not null,
    age int ,
    city varchar(50)
);

-- inserting data
insert into users2(user_id, user_name, email, age, city)values 
(1, 'karan', 'karanmalhotra12@gmail.com', 24, 'delhi'),
(2, 'priya', 'priyachauhan07@gmail.com', 23, 'mumbai'),
(3, 'aman', 'amansingh98@yahoo.com', 25, 'pune'),
(4, 'riya', 'riya.sharma31@gmail.com', 22, 'chennai'),
(5, 'aditya', 'adityaverma55@gmail.com', 26, 'hyderabad');

-- display table
select * from users2;

-- (----------------- working with alter command-----------------)

-- altering column name user_name to full_name
alter TABLE users2
rename column user_name to full_name;

--  and also change the datatype of age int to small_int
alter table users2
modify column age smallint;


-- add constraints to age that age should be greater than 18 
-- if any constraints added and you want to delete that applied constraints
alter table users2
drop constraint age;

alter TABLE users2
add constraint check(age>=18);

-- lest try to insert data whose age is less than 18
/*
insert into users2(user_id, full_name, email, age, city) values
(6,'piyush kumar', 'piyushkumar810@gmail.com', 17, 'bangalor');

see the error
heck constraint 'users2_chk_1' is violated.
*/

-- lets change table name 
/*
alter table users1
rename to users2;
*/