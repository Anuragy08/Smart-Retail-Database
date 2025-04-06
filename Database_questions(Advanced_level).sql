-- Identify the top 5 best-selling products based on quantity sold 
select t1.product_id, t1.product_name, sum(t2.quantity) as total_quantity from products t1
left join order_items t2 on t1.product_id = t2.product_id
group by 1,2
order by total_quantity desc limit 5;

-- Find the average discount applied to all products in each category
select t1.product_id, t1.product_name, avg(t2.discount) as Average_discount from products t1
left join order_items t2 on t1.product_id = t2.product_id
group by 1,2;

-- Write a query to determine which store has the highest inventory value.
select t1.store_id, t1.store_name, sum(t3.quantity*t3.list_price) as Inventory_value from stores t1
join orders t2 on t1.store_id = t2.store_id
join order_items t3 on t2.order_id = t3.order_id
group by 1,2
order by Inventory_value desc limit 1;

-- Retrieve the top 3 customers who have spent the most in total purcchase
select t1.customer_id, concat(t1.first_name,' ',t1.last_name) as Customer_name, 
count(t3.order_id) as Total_orders_placed, sum(t3.quantity*t3.list_price) as total_purchase
from customers t1
join orders t2 on t1.customer_id = t2.customer_id
join order_items t3 on t2.order_id = t3.order_id
group by 1,2
order by total_purchase desc 
limit 3;

-- Find the most frequently ordered product in the last 6 months
select t1.product_id, t1.product_name, t3.order_date, sum(t2.quantity) as Quantity from products t1
join order_items t2 on t1.product_id = t2.product_id
join orders t3 on t2.order_id = t3.order_id
where t3.order_date >= date_sub('2018-12-28', interval 6 month)
group by 1,2,3
order by t2.quantity desc;




