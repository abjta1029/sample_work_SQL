
-- WINDOW FUNCTIONS

CREATE TABLE Orders
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(100),
	city VARCHAR(100),	
	order_amount int
);
 
INSERT INTO Orders
values(1001,'04/01/2022','David Smith','GuildFord',10000),
(1002,'04/02/2022','David Jones','Arlington',20000),
(1003,'04/03/2022','John Smith','Shalford',5000),
(1004,'04/04/2022','Michael Smith','GuildFord',15000),
(1005,'04/05/2022','David Williams','Shalford',7000),
(1006,'04/06/2022','Paum Smith','GuildFord',25000),
(1007,'04/10/2022','Andrew Smith','Arlington',15000),
(1008,'04/11/2022','David Brown','Arlington',2000),
(1009,'04/20/2022','Robert Smith','Shalford',1000),
(1010,'04/25/2022','Peter Smith','GuildFord',500);

select*from Orders;

-- Aggregate window function Avg, Count, Max, Min, Sum
select order_id,order_date,customer_name,city,order_amount,
avg(order_amount) OVER(PARTITION BY city) as avg_amount
from Orders;

select order_id, order_date, customer_name, city, order_amount,
count(order_id) OVER(PARTITION BY city) as total_orders
from Orders;

select order_id,order_date,customer_name,city,order_amount,
sum(order_amount) OVER(PARTITION BY city) as total_amount
from Orders;

select order_id,order_date,customer_name,city,order_amount,
max(order_amount) OVER(PARTITION BY city) as max_amount
from Orders;



-- Rank window functin Rank,Dense_rank, Row_number
select order_id,order_date,customer_name,city,order_amount, 
rank() OVER(ORDER BY order_amount desc) as rank
from Orders;

select order_id,order_date,customer_name,city,order_amount, 
dense_rank() OVER(ORDER BY order_amount desc) as DenseRank
from Orders;

select order_id,order_date,customer_name,city, order_amount,
row_number() OVER(PARTITION BY city ORDER BY order_amount desc) as row_number
from Orders;



-- Value window function Lag, Lead, First_value, Last_value
SELECT order_id,customer_name,city, order_amount,order_date,
Lag(order_date,1) OVER(ORDER BY order_date) previous_order_date
from Orders;

SELECT order_id,customer_name,city, order_amount,order_date,
Lead(order_date,1) OVER(ORDER BY order_date) next_order_date
from Orders;

SELECT order_id,order_date,customer_name,city, order_amount,
FIRST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) first_order_date,
LAST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) last_order_date
from Orders;