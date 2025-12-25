create database Pizza
use pizza

select * from pizza_sales 



# 1. Total Revenue: 

select sum(total_price) as Total_Revenue from pizza_sales



 # 2. Average Order value 
 
 select sum(total_price)/ count(distinct order_id) as Avg_order_value from pizza_sales



 # 3. Total Pizza Sold 

select sum(quantity) as  total_pizza_sold from pizza_sales



# 4 . Total orders 

select count(distinct order_id) as  total_order from pizza_sales



# 5.  Average Pizzas Per Order 

select sum(quantity)/count(distinct order_id ) as Avg_Pizzas_per_order from pizza_sales



# 6.  Daily Trend for Total Orders 

select DAYNAME(STR_TO_DATE(order_date,'%y-%m-%d')) as order_days, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by  order_days



# 7.  Hourly Trend for Orders 

SELECT HOUR(order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by HOUR( order_time)



# 8. % of Sales by Pizza Category 

select pizza_category , sum(total_price) as Revenue , cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category 



# 9.  % of Sales by Pizza Size 

select pizza_size , sum(total_price) as Revenue , cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size



# 10. Total Pizzas Sold by Pizza Category 
select pizza_category , sum(quantity) as  total_pizza_sold from pizza_sales
group by pizza_category 




# 11. Top 5 Best Sellers by Total Pizzas Sold

select pizza_name , sum(quantity) as  total_pizza_sold from pizza_sales
group by pizza_name
order by sum(quantity) desc limit 5



# 12. Bottom 5 Best Sellers by Total Pizzas Sold 

select pizza_name , sum(quantity) as  total_pizza_sold from pizza_sales
group by pizza_name
order by sum(quantity) asc limit 5