
-- creating employee table
create table employees3(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    department_id integer
);

select * from employees3;

insert into employees3(first_name, last_name, department_id)values
('rahul', 'sharma', 101),
('priya', 'metha',102),
('Ankit', 'verma',103),
('simran', 'kaur', NULL),
('aman', 'singh',101);


-- creating department table

drop table if EXISTS department3;

create table department3(
    department_id int primary key,
    department_name varchar(50)
);

insert into department3(department_id, department_name)values
(101,'sales'),
(102, 'marketing'),
(103,'it'),
(104, 'HR');

select * from department3;


-- performing inner join retrieve a matching value from both of the table 
select e.employee_id,e.first_name,e.last_name,
       d.department_name
from
employees3 e
INNER JOIN
department3 d
ON e.department_id=d.department_id;

-- perform left join retrieve employee3 and their department name, include those without a department
select e.employee_id,e.first_name,e.last_name,
       d.department_name
FROM employees3 e LEFT JOIN department3 d
on e.department_id=d.department_id;

-- performing right join
select e.employee_id,e.first_name,e.last_name,
       d.department_id,d.department_name
FROM employees3 e 
RIGHT JOIN department3 d
on e.department_id=d.department_id;


-- performing fulll outer join
-- select e.employee_id,e.first_name,e.last_name,
--        d.department_id,d.department_name
-- FROM employees3 e 
-- FULL OUTER JOIN department3 d
-- on e.department_id=d.department_id;

-- not supportd in sql


-- perfrming cross join
select d.department_id,e.first_name,e.last_name,d.department_name
from employees3 e
cross JOIN department3 d;


-- self_join
select e1.first_name as employee_name1,
       e2.first_name as employee_name2,
       d.department_name
from employees3 e1 join employees3 e2
on e1.department_id=e2.department_id AND e1.employee_id <> e2.employee_id
join department3 d
on e1.department_id=d.department_id;