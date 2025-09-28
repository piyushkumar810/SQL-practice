Create table If Not Exists Views 
(
    article_id int, author_id int, viewer_id int, view_date date
    );

insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02');
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01');
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02');
insert into Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22');
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21');
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21');

select * from Views;

-- Write a solution to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

select DISTINCT author_id as id
FROM Views 
WHERE author_id = viewer_id
ORDER BY id;

-- WHERE author_id = viewer_id → ensures the person who wrote the article also viewed it.

-- DISTINCT → removes duplicates, since the same author may view their article multiple times.

-- ORDER BY id → sorts the results in ascending order.

-- ? author_id as id
-- ans-> author_id is the original column name in the table.
--       AS id renames the column in the result set to id.