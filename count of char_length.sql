create TABLE IF NOT EXISTS Tweets(
    tweet_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(50) NOT NULL);

INSERT INTO Tweets(content) VALUES 
("Let us Code"),
("to learn coding you must watch code with harry"),
("i dont know coding"),
("my name piyush"),
("coding is a bit tough");

SELECT * FROM Tweets;

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid 
-- if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

select tweet_id FROM tweets
WHERE char_length(content)>15;