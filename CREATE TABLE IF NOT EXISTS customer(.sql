CREATE TABLE IF NOT EXISTS customer(
    id INT AUTO_INCREMENT PRIMARY key,
    name VARCHAR(20) NOT NULL,
    referee_id int
);

INSERT INTO customer(name,referee_id) VALUES
('Will', NULL),
('Jane', NULL),
('Alex', 2),
('Bill', NULL),
('Zack', 1),
('Mark', 2);

SELECT * FROM customer



-- Find the names of the customer that are either:
--           referred by any customer with id != 2.
--           not referred by any customer.
-- Return the result table in any order.

SELECT name FROM customer WHERE
referee_id !=2 OR referee_id is NULL;


-- note
-- in place of referee_id is NULL i wrote:-
-- referee_id = NULL

-- In SQL, NULL is special — it means “unknown / no value”.
-- So you cannot compare it with = or !=.

-- examples:-
-- SELECT 1 = NULL;      -- returns NULL (not true)
-- SELECT 1 != NULL;     -- returns NULL (not true)
-- SELECT NULL = NULL;   -- returns NULL (not true)
-- SELECT NULL IS NULL;  -- returns TRUE
