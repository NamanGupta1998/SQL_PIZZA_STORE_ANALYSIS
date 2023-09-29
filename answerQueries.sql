--- KPI Requirements
/* Q1: Find the total revenue */

select sum(total_price) as total_revenue from
pizza_store


/* Q2: Find the average order value */

select sum(total_price) / sum(quantity) as avg_order_value
from pizza_store


/* Q3: Find the number of total pizza sold */

select sum(quantity) as total_pizza
from pizza_store


/* Q3: Find the total number of order placed */

select count(distinct order_id) as total_order_placed
from pizza_store


/* Q3: Find the average pizza of per order */

select sum(quantity) / count(distinct order_id) as avg_pizza_order
from pizza_store


/* Q3: Find the daily trend for total order */

select to_char(order_date , 'day') as "week_day" , count(distinct order_id) as total_order
from pizza_store
group by "week_day"
order by total_order desc


/* Q3: Find the monthly trend for total order */

select to_char(order_date , 'month') as "Months" , count(distinct order_id) as total_order
from pizza_store
group by "Months"
order by total_order desc


/* Q3: Find the percentage of sales(price) by pizza category */

select pizza_category , sum(total_price)*100 /(select sum(total_price) from pizza_store) as percentage_sales
from pizza_store
group by pizza_category


/* Q4: Find the percentage of sales(price) by pizza size */

select pizza_size , cast(sum(total_price)*100 / (select sum(total_price) from pizza_store) as decimal(10,2)) as percentage_sales
from pizza_store
group by pizza_size


/* Q4: Find the top 5 best seller by revenue , total quantity  total orders */
select * from pizza_store
select pizza_name , sum(total_price) as total_revenue , sum(quantity) as total_quantity , count(distinct order_id) as total_order
from pizza_store
group by 1
order by 3 desc
limit 5


/* Q4: Find the top 5 best seller by revenue , total quantity  total orders */
select * from pizza_store
select pizza_name , sum(total_price) as total_revenue , sum(quantity) as total_quantity , count(distinct order_id) as total_order
from pizza_store
group by 1
order by 2,3,4
limit 5





