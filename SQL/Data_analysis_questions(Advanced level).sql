-- Which products have a seasonal trend in sales?
select t1.product_id,
t1.product_name,
concat(monthname(t3.order_date), ' ',year(t3.order_date)),
count(t2.order_id) as 'Number of orders placed'
from products t1
join order_items t2 on t1.product_id = t2.product_id
join orders t3 on t3.order_id = t2.order_id
where order_date >= subdate('2018-12-28', interval 24 month)
group by 1, 2, 3
order by 1;

-- How does customer location affect purchasing behavior?
select
distinct t1.customer_id, 
concat(t1.city, ' ',t1.state) as "Customer's Address",
t1.state,
concat(t3.city, ' ',t3.state) as "store's Address",
t3.state,
count(t2.order_id) as "Number of order placed",
sum(t4.quantity) as "Total_Quantity",
sum(t4.List_price) as "Total_printed_cost_per_item",
(sum((t4.list_price*t4.quantity) - t4.discount)) as "Total_sales"
from customers t1
join orders t2 on t1.customer_id = t2.customer_id
join stores t3 on t3.store_id = t2.store_id
join order_items t4 on t2.order_id = t4.order_id
group by 1,2,3,4,5;

-- Perform an RFM(Recency, Frequency, Monetary) analysis
With RFM as(
select t1.customer_id, concat(t1.first_name, ' ', t1.last_name) as "Customer_name",
datediff(curdate(), max(t2.order_date)) as "Recency", count(t3.order_id) as "Frequency", 
sum((t3.list_price*t3.quantity) - t3.discount) as "Monetary"
from customers t1
join orders t2 on t1.customer_id = t2.customer_id
join order_items t3 on t2.order_id = t3.order_id
group by 1,2
)
select customer_id, customer_name , Recency as "Recency (No. of days since last purchase)",
Frequency as "Frequency (No. of total orders placed)", 
Monetary as "Monetary (Total amount Spent)"
from RFM




