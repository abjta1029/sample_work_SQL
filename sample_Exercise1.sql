/* Exercise1: Write a SQL query to fetch all the duplicate records from a table.
   
   table: users
    |  Column name  |  type  |
    +---------------+--------+
    |   user_id     |  int   |
    |   use_name    | varchar|
    |   email       | varchar|
    +---------------+--------+
    user_id is the primary key. */
    
use practice_exercise; -- It's the database that used
    
create table users(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users(user_id, user_name, email)
values(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com'),
(6, 'Amit', 'amit@gmail.com');

select*from users;
    
-- Solution
select user_name, email, count(*) as num_of_duplicate_rows
from users
group by user_name, email
having count(*)>1;
    
-- can add more values to table to verify the result 
insert into users values 
(7, 'Amit', 'amit@gmail.com'), 
(8, 'Robin', 'robin@gmail.com'); 

delete from users where user_id in (7,8);