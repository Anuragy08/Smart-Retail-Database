-- How do product sales vary across different stores
select t1.store_id, t1.store_name,
t4.product_name, sum(t3.quantity) as 'Total_quantity_sold', 
sum((t3.list_price*t3.quantity)-t3.discount) as 'Sales'
from stores t1
join orders t2 on t1.store_id = t2.store_id
join order_items t3 on t2. order_id = t3.order_id
join products t4 on t4.product_id = t3.product_id
group by 1,2,3; 
 
-- What is the trend in monthly sales over the past year
select 
monthname(order_date) as 'Month',
year(order_date) as 'year',
sum((list_price*quantity) - discount) as 'Total_sales'
from orders t1
join order_items t2 on t1.order_id = t2.order_id
where t1.order_date >= date_sub('2018-12-28',interval 12 month)
group by 1
order by 1;

-- What is the correlation between discount percentage and total sales volume?
select ((discount/list_price)*100) as 'Discount_percentage',
sum(quantity) as 'Total_sales_volume'
from order_items
group by 1
order by 1 desc;

-- How many repeat customers are there and how frequently do they place orders?
select t1.customer_id, concat(t1.first_name,' ', t1.last_name) as 'Customer_name', 
count(t1.customer_id) as 'Repeat_customers', count(t3.order_id) as 'Repeat_orders'
from customers t1
join orders t2 on t1.customer_id = t2.customer_id
join order_items t3 on t2.order_id = t3.order_id
group by 1,2;



