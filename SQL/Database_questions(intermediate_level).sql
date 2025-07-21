-- Retrive the total number of products available in stock for each store
select distinct t1.store_id, t2.product_id, t2.quantity from stores t1 
left join stocks t2 on t1.store_id = t2.store_id; 

-- Find the total revenue generated from each product in the order_item table
 select product_id, quantity, list_price, 
 (quantity*list_price) as Total_price_before_discount,
 discount, ((quantity * list_price * discount)/100) as Total_discount_in_amount,
 sum(((quantity*list_price) - ((list_price * discount)/100))) as Total_revenue
 from order_items
 group by 1
 order by 1;
 
 -- Get a list of customers who have placed more than 5 orders
 select t1.customer_id, concat(t1. first_name, ' ',t1.last_name) as Customer_name , count(t3.order_id) as Number_of_customers from customers t1
 left join orders t2 on t1.customer_id = t2.customer_id
 left join order_items t3 on t2.order_id = t3.order_id
 group by 1
 having count(t3.order_id) > 5;
 
 -- Display all orders that have not yet been shipped
 select order_id, shipped_date from orders
 where shipped_date is null;
 
-- Retrieve the total aales per store along with store name
select t1.store_id, t1.store_name, sum((t3.quantity*t3.list_price)-t3.discount) Total_sales
from stores t1
left join orders t2 on t1.store_id = t2.store_id
left join order_items t3 on t2.order_id = t3.order_id
group by 1,2;  
 
 

 