CREATE TABLE IF NOT EXISTS products(
    product_id INT PRIMARY KEY,
    low_fats VARCHAR(10) NOT NULL,
    recyclable VARCHAR(10) NOT NULL
);

INSERT INTO products(product_id,low_fats,recyclable)VALUES
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'y', 'Y'),
(4, 'N', 'N');

SELECT * FROM products

-- Write a solution to find the ids of products that are both low fat and recyclable.

SELECT product_id FROM products WHERE
low_fats="y" AND recyclable="y";