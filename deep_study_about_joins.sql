-- --------------- learning joins ---------------------

drop table if exists employee2;
drop table if exists department2;

CREATE TABLE departments2 (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employees2 (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT REFERENCES departments2(dept_id),
    salary NUMERIC(10,2)
);
	-- REFERENCES departments(dept_id) → This sets up a foreign key constraint. It means that the values stored in this column (dept_id) must already exist in the dept_id column of the departments table.

select * from departments2;
select * from employees2;

INSERT INTO departments2 (dept_name, location) VALUES
('IT', 'Bangalore'),
('HR', 'Mumbai'),
('Finance', 'Delhi'),
('Sales', 'Pune');

INSERT INTO employees2 (emp_name, dept_id, salary) VALUES
('Rohit', 1, 60000),
('Priyanshu', 1, 50000),
('Praneeth', 2, 40000),
('Piyush', 3, 55000),
('Amit', NULL, 45000);  -- employee without department



/*🧠  What is a JOIN?

A JOIN combines rows from two or more tables based on a related column between them.

👉 In our case:
employees.dept_id ↔ departments.dept_id

🧩 Types of Joins in PostgreSQL
Type	                                       Description
INNER JOIN	            					Returns only matching rows in both tables
LEFT JOIN(or LEFT OUTER JOIN)				Returns all rows from left table + matched from right
RIGHT JOIN(or RIGHT OUTER JOIN)				Returns all rows from right table + matched from left
FULL JOIN (or FULL OUTER JOIN)				Returns all rows from both tables (matched + unmatched)
CROSS JOIN									Returns Cartesian product (all combinations)
SELF JOIN									Joins a table to itself

💡 1. INNER JOIN

Syntax:

SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
Example:
*/
SELECT e.emp_name, e.salary, d.dept_name
FROM employees2 e
INNER JOIN departments2 d
ON e.dept_id = d.dept_id;
/*
Output:

emp_name	salary	dept_name
Rohit	60000	IT
Priyanshu	50000	IT
Praneeth	40000	HR
Piyush	55000	Finance

🧾 Amit (NULL dept) is not shown — because no matching department.
*/



/*
💡 2. LEFT JOIN
Syntax:

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
Example:
*/
SELECT e.emp_name, d.dept_name
FROM employees2 e
LEFT JOIN departments2 d
ON e.dept_id = d.dept_id;
/*
Output:

emp_name	dept_name
Rohit	IT
Priyanshu	IT
Praneeth	HR
Piyush	Finance
Amit	NULL

✅ Returns all employees, even if department is missing (NULL).
*/


/*
💡 3. RIGHT JOIN
Syntax:

SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
Example:
*/
SELECT e.emp_name, d.dept_name
FROM employees2 e
RIGHT JOIN departments2 d
ON e.dept_id = d.dept_id;
/*
Output:

emp_name	dept_name
Rohit	IT
Priyanshu	IT
Praneeth	HR
Piyush	Finance
NULL	Sales

✅ Shows all departments, even if no employee exists there (Sales dept is empty).
*/


/*
💡 4. FULL JOIN
Syntax:

SELECT columns
FROM table1
FULL JOIN table2
ON table1.column = table2.column;
Example:
*/
SELECT e.emp_name, d.dept_name
FROM employees2 e
FULL JOIN departments2 d
ON e.dept_id = d.dept_id;
/*
Output:
emp_name	dept_name
Rohit	IT
Priyanshu	IT
Praneeth	HR
Piyush	Finance
Amit	NULL
NULL	Sales

✅ Returns everything — all employees and all departments (even if unmatched).
*/


/*
💡 5. CROSS JOIN

Syntax:
SELECT columns
FROM table1
CROSS JOIN table2;
Example:
*/



SELECT e.emp_name, d.dept_name
FROM employees2 e
CROSS JOIN departments2 d;
/*
Output:

Produces every possible combination

5 employees × 4 departments = 20 rows

⚠️ Use carefully — large tables = huge result!
*/


/*
💡 10. SELF JOIN
Used when a table references itself (like an employee’s manager).
Example:
*/
CREATE TABLE emp_manager (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO emp_manager (emp_name, manager_id) VALUES
('Rohit', NULL),
('Priyanshu', 1),
('Praneeth', 1),
('Piyush', 2);


Now self-join:

SELECT e.emp_name AS employee, m.emp_name AS manager
FROM emp_manager e
LEFT JOIN emp_manager m
ON e.manager_id = m.emp_id;
