--   --------------------------- scenario ----------------------------------------
-- 📌 Database: Apartment Maintenance Management System

-- Schema (same for all parts):

-- RESIDENT(resident_id, name, phone, flat_no)
DROP table if exists RESIDENT;

CREATE TABLE RESIDENT(
    resident_id int primary key,
    name varchar(20) NOT NULL,
    phone varchar(20) NOT NULL,
    flat_no int NOT NULL,
    FOREIGN KEY (flat_no) REFERENCES FLAT(flat_no)
);

select * from RESIDENT;


-- FLAT(flat_no, block, floor, size_sqft)
drop table if exists FLAT;

create table FLAT(
    flat_no int primary key,
    block varchar(10) not null,
    floor int,
    size_sqft int
);

select * from FLAT;


-- MAINTENANCE(bill_id, flat_no, month, amount)
drop table if exists MAINTENANCE;

CREATE TABLE MAINTENANCE (
    bill_id INT PRIMARY KEY,
    flat_no INT,
    month VARCHAR(15),
    amount DECIMAL(10,2),
    FOREIGN KEY (flat_no) REFERENCES FLAT(flat_no)
);


select * from MAINTENANCE;



-- PAYMENT(payment_id, bill_id, payment_date, mode)
drop table if exists PAYMENT;

CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY,
    bill_id INT,
    payment_date DATE,
    mode VARCHAR(20),
    FOREIGN KEY (bill_id) REFERENCES MAINTENANCE(bill_id)
);

select * from PAYMENT;






-- ------------------------------- questions ------------------------------

-- 🔹 PART 1: CORE SQL FOUNDATIONS (Accuracy + Speed)

-- 🎯 Goal: Master SELECT, WHERE, INSERT, UPDATE, DELETE
-- 💡 Difficulty: Easy → Medium (but exam-strict)
-- Practice Questions


-- Q1) Insert three flats in different blocks and floors.
insert into FLAT(flat_no, block, floor, size_sqft)values
(101, 'A', 1, 850),
(202, 'B', 2, 1100),
(303, 'C', 3, 950);

-- Q2) Insert two residents living on the same floor but different blocks.

/*
explanation:- 
assume it 
(Flat 101 → Block A, Floor 1
Flat 201 → Block B, Floor 1)
*/
INSERT INTO FLAT (flat_no, block, floor, size_sqft)
VALUES (201, 'B', 1, 850);

INSERT INTO RESIDENT (resident_id, name, phone, flat_no) VALUES
(1, 'Ravi', '9876543210', 101),
(2, 'Amit', '9123456789', 201);


-- Q3) Display all residents whose phone number starts with 9.
select * from RESIDENT
WHERE phone like'9%';

-- Q5) List flats with size between 800 and 1200 sqft.
/*select * from FLAT
where size_sqft>800 and size_sqft<1200;*/
SELECT *
FROM FLAT
WHERE size_sqft BETWEEN 800 AND 1200;


-- Q6) Display maintenance bills where amount is NOT equal to 3500.
insert into MAINTENANCE(bill_id, flat_no, month, amount)values
(1001, 101, 'January', 3000),
(1002, 202, 'January', 3500),
(1003, 303, 'February', 4200),
(1004, 101, 'March', 2800);

select * from MAINTENANCE
where amount <> 3500;

-- Q6) Update all residents in Block B to a new phone prefix.
update RESIDENT
SET phone= CONCAT('8',SUBSTRING(phone,2))
where flat_no in(
    SELECT flat_no
    from FLAT
    where block='B'
);

-- Q7) Increase maintenance amount by 10% for flats on floor 1.
UPDATE MAINTENANCE
SET amount = amount*1.10
where flat_no in(
    select flat_no
    from FLAT
    where floor=1
);


-- Q8) Delete payments where mode is NULL.
delete form PAYMENT 
where mode is NULL;

-- Q9) Delete residents whose phone number is missing.
delete from RESIDENT 
where phone is NULL;

-- 10) Display distinct maintenance months.
SELECT DISTINCT month
FROM MAINTENANCE;


-- ---------------------------------------------------------------------

-- 🔹 PART 2: AGGREGATES + GROUP BY + HAVING (EXAM FAVORITE)
-- 🎯 Goal: Think in totals, counts, max, min
-- 💡 Difficulty: Medium

-- Practice Questions

-- Q1) Find total maintenance collected per month.
SELECT month, SUM(amount) AS total_maintenance
FROM MAINTENANCE
GROUP BY month;

-- Q2) Find average maintenance amount per block.
select * from MAINTENANCE;

select f.block, AVG(m.amount) as avg_maintanenceAmount
from MAINTENANCE m join FLAT f
on m.flat_no = m.flat_no
GROUP BY f.block;


-- Q3) Count number of flats in each block.
select block, COUNT(flat_no) as no_of_flat
from FLAT
group by block;

-- Q4) Display blocks having more than 5 flats.
-- Find the month with the highest total maintenance.
-- Find flats that received more than one maintenance bill.
-- Display blocks where average flat size > 1000 sqft.
-- Count number of payments made using each payment mode.
-- Find the minimum maintenance amount issued per block.
-- Display months where total maintenance collected is less than 20,000.

-- ⚠️ HAVING vs WHERE mistakes are checked heavily in PES exams