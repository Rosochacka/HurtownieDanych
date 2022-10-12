--create database test;
--use test;

-- 1
with amt as(
SELECT sum(p.price*od.quantity) as total from order_details od
	JOIN pizzas p on p.pizza_id = od.pizza_id 
	JOIN orders o on od.order_id = o.order_id 
	WHERE o.date ='2015-02-18'
	group by o.order_id
)
select avg(total) as avg_price from amt;

-- 2
with ingr as(
select o.order_id, STRING_AGG(t.ingredients, ',') as ingredients from orders o
	JOIN order_details od on od.order_id = o.order_id
	JOIN pizzas p on od.pizza_id = p.pizza_id
	JOIN pizza_types t on p.pizza_type_id = t.pizza_type_id
	WHERE o.date BETWEEN '2015-03-01' and '2015-03-31'
	GROUP BY o.order_id
)
select order_id from ingr where ingredients not like '%Pineapple%';

-- 3
SELECT TOP 10
rank() over (order by sum(p.price*od.quantity) desc ) as ranking,
o.order_id,
sum(p.price*od.quantity) as total
from order_details od
	JOIN pizzas p on p.pizza_id = od.pizza_id 
	JOIN orders o on od.order_id = o.order_id 
	WHERE o.date like '2015-02-%'
	group by o.order_id;

-- 4
with mnt_avg as(
	select o.order_id, sum(p.price*od.quantity) as order_amount, o.date
	FROM orders o
	JOIN order_details od on od.order_id = o.order_id
	JOIN pizzas p on od.pizza_id = p.pizza_id
	GROUP BY o.order_id, o.date
),
average_month_amount as(
		select AVG(m.order_amount) as average_month_amount, MONTH(m.date) as m_data from mnt_avg m
		GROUP BY MONTH(m.date)
)
select m.order_id, m.order_amount, a.average_month_amount, m.date from mnt_avg m 
JOIN average_month_amount a on MONTH(m.date)=a.m_data;

-- 5
select count(o.order_id) as order_count, o.date,  DATEPART(HOUR, o.time) as hour FROM orders o
	WHERE o.date = '2015-01-01'
	GROUP BY DATEPART(HOUR, o.time), o.date;

-- 6
select sum(od.quantity) as ilosc, t.name, t.category from orders o
	JOIN order_details od on od.order_id = o.order_id
	JOIN pizzas p on od.pizza_id = p.pizza_id
	JOIN pizza_types t on p.pizza_type_id = t.pizza_type_id
	WHERE o.date like '2015-01-%'
	GROUP BY t.pizza_type_id, t.name, t.category
	ORDER BY ilosc desc;

-- 7
select p.size, count(*) as count from orders o
	JOIN order_details od on od.order_id = o.order_id
	JOIN pizzas p on od.pizza_id = p.pizza_id
	WHERE o.date >='2015-02-01' and o.date < '2015-04-01'
	GROUP BY p.size;
