use vinaydatabase

select * from pizza_sales

select SUM(total_price) as Total_Revenue from pizza_sales

select SUM(total_price)/ COUNT(distinct order_id) as Average_Order_Value from pizza_sales

select SUM(quantity) as Total_Pizzas_Sold from pizza_sales

select COUNT(distinct order_id) as Total_Orders from pizza_sales

select CAST(CAST(SUM(quantity) as decimal(10,2)) / 
CAST(COUNT(distinct order_id) as decimal(10,2))
as decimal(10,2)) as Avg_Pizzas_Per_Order from pizza_sales

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
group by DATENAME(MONTH, order_date) 
order by total_orders DESC


select pizza_category,SUM(total_price) as Total_Sales, SUM(total_price) * 100 / (select sum(total_price) from pizza_sales) as Per_Of_Sales
from pizza_sales 
--where MONTH(order_date) = 1
group by pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size


select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc