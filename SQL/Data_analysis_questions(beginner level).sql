-- What is the average order value per customer?
select t1.customer_id, concat(t1.first_name, ' ', t1.last_name) as customer_name, 
count(distinct t3.order_id) as number_of_order, avg(t3.quantity*t3.list_price - t3.discount) as average_order_value
from customers t1
join orders t2 on t1.customer_id = t2.customer_id
join order_items t3 on t2.order_id = t3.order_id
group by 1,2; 

-- How many products are sold per category?
select t1.category_id, t3.product_id, t2.product_name, sum(t3.quantity) as number_of_quantity_sold from categories t1
join products t2 on t1.Category_id = t2.category_id
join order_items t3 on t2.product_id = t3.product_id
group by 1,2,3; 

-- What percentage of total orders come from each store?
select t1.store_id, t1.store_name,
count(distinct t2.order_id) as Number_of_orders, ((t3.list_price*t3.quantity)-t3.discount) as sales_amount,
round((count(distinct t2.order_id)/(select count(*) from order_items)),2) as Total_order_percentage
from stores t1
join orders t2 on t1.store_id = t2.store_id
join order_items t3 on t2.order_id = t3.order_id
group by 1,2;  

-- What is the most comman order status?
select order_status, count(order_status) as Order_status_frequency
from orders
group by 1
order by Order_status_frequency desc;






