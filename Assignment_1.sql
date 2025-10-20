-- ----------------------- assignment 1 ---------------------


-- drop table if exiest
drop table if exists employees1;

-- crete table 
create table employees1(
employee_id serial primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
department varchar(50),
salary decimal(10,2) check(salary>0),
joining_date date not null,
age int check(age>=18)
);

-- inserting data
insert into employees1(first_name, last_name, department, salary, joining_date, age)values
('Amit','Sharma','IT', 60000.00, '2022-05-01',29),
('Neha','Patel','HR',55000.00, '2021-08-15',32),
('Ravi','Kumar','Finance',70000.00,'2020-03-10', 35),
('Anjali','Verma','IT',65000.00,'2019-11-22',28),
('Suresh','Reddy','Operations',50000.00,'2023-01-10',26);


-- show table
select * from employees1 order by employee_id asc;


-------------------------------- q1. retrieve all employees first_name and their department

-- select (first_name,department) from employees1;
SELECT first_name, department FROM employees1;
/*
|                     Query                          |                         Difference                                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `SELECT first_name, department FROM employees1;`   | ✅ Returns two **separate columns** — standard SQL syntax.                                  |
| `SELECT (first_name, department) FROM employees1;` | ⚠️ Returns **one column with tuples** (like `(Piyush, IT)`), only valid in **PostgreSQL**. |
*/

-- Q2. update the salary of all employees in the 'it' department by increasing it by 10%
update employees1
set salary = (salary*1.10)
where department = 'IT';
/*
--------- explanation 
Mathematically,
New Salary = Old Salary × (1 + 10/100)
So:
1 + 10/100 = 1.10
Hence, multiplying by 1.10 increases the value by 10%.
*/


-- Q3. delete all employees who are older than 34 years
delete from employees1 
where age>34;

-- Q4. add a new column email to a employees1 table
alter table employees1
add column Email varchar(50);

/*
| Command                      | What it changes                       | When to use                                     |
| ---------------------------- | ------------------------------------- | ----------------------------------------------- |
| `ALTER TABLE ... ADD COLUMN` | Table **structure** (adds new column) | When you need a new column                      |
| `UPDATE`                     | **Data inside columns**               | When you want to change values in existing rows |


-- --- adding with default value
ALTER TABLE employees1
ADD COLUMN country VARCHAR(50) DEFAULT 'India';

-- --- adding with not null constraints
ALTER TABLE employees1
ADD COLUMN email VARCHAR(100) NOT NULL;
*/


-- Q5. rename the 'department' column to 'dept_name'.
alter table employees1
rename department to dept_name;

-- Q6. retrieve the name of employees who joined after january 1, 2021.
select first_name from employees1
where joining_date>'2021-01-01';

-- Q7. change the date type of the 'salary' to integer
ALTER TABLE employees1
ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER;
/*
| Part                               | Meaning                                                                       |
| ---------------------------------- | ----------------------------------------------------------------------------- |
| `ALTER TABLE employees1`           | Choose the table to modify                                                    |
| `ALTER COLUMN salary TYPE INTEGER` | Change the data type of `salary` to `INTEGER`                                 |
| `USING salary::INTEGER`            | Convert existing values from current type (e.g., NUMERIC or FLOAT) to INTEGER |

Example: 55000.75 → 55000 (fractional part is truncated)
*/

-- Q8. list all employees with their age and salary in descending order of the salary
select age,salary from employees1
order by salary desc;
/*
DESC → descending order (largest to smallest, Z→A for text)
ASC → ascending order (default, smallest to largest, A→Z for text)
*/

-- Q9.insert a new employee with the following details 'Raj','Singh','Marketing',60000,'2023-09-15',30.
insert into employees1(first_name, last_name, dept_name, salary, joining_date, age)values
('Raj','Singh','Marketing',60000,'2023-09-15',30);

-- Q10.update age of employee +1 to every employee
update employees1
set age = (age+1);
