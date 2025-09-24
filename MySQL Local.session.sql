CREATE TABLE IF NOT EXISTS host (
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(30) NOT NULL, 
age INT,
place VARCHAR(30) NOT NULL,
matric VARCHAR(200) NOT NULL,
inter VARCHAR(200) NOT NULL,
graduation VARCHAR(200) NOT NULL,
mobile VARCHAR(15) NOT NULL,
email VARCHAR(20) NOT NULL
);

INSERT INTO host (username, age, place, matric, inter, graduation, mobile, email) VALUES
('Piyush Kumar', 22, 'koderma', '10th - 67%', '12th - 76%', 'BCA - 7.47 gpa', '8102356837', 'piyushkumar810'),
('harsh kumar', 21, 'kolkata', '10th - 96%', '12th - 93%', 'btech - 9.6 gpa', '7482092276', 'harshkumar428'),
('parth manji', 23, 'kolkata', '10th - 95%', '12th - 91%', 'ai-ml', '8925789345', 'parthmanji5234');

SELECT * FROM host;