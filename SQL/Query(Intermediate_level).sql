-- 1.	Retrieve the product name and brand name for all products by joining products and brands.
select t1.product_name, t2.brand_name from products t1
join brands t2 on t1.brand_id = t2.brand_id;

-- 2.	List all orders along with the customer’s first name and last name.
select distinct t2.order_id, concat(t3.first_name, ' ', t3.last_name) as "Customer's name"
from order_items t1
join orders t2 on t1.order_id = t2.order_id
join customers t3 on t2.customer_id = t3.customer_id;

-- 3.	Find the total quantity of all products available in stock across all stores. 
select t1.store_id, t2.store_name, t3.product_name, sum(quantity) AS "Total_stock_quantity"
from stocks t1
join stores t2 on t1.store_id = t2.store_id
join products t3 on t1.product_id = t3.product_id
group by 1,2,3;

-- 4.	Write a query to display all products that belong to the "Electronics" category (assume the category name is stored in categories).
select t1.category_id, t1.category_name, t2.product_name,
t2.list_price from categories t1
join products t2 on t1.Category_id = t2.category_id
where category_name like 'E%'
ORDER BY t2.list_price DESC;

-- 5.	Get the total number of orders placed by each customer (customer_id, first_name, total_orders).
select
t1.customer_id, 
concat(t1.first_name,' ',t1.last_name) as "Customer's name",
sum(t2.order_id) as "Number of Order Placed"
from customers t1
join orders t2 on t1.customer_id = t2.customer_id
group by 1,2;

-- 6.	Find the total revenue generated from each order (order_id, total_price)
select order_id, sum(list_price * quantity) as "Total_printed_price",
sum((list_price * quantity) - discount) from order_items
group by 1; 

-- 7.	Retrieve all products that have never been ordered.
select t1.product_id, t1.product_name from products t1
left join order_items t2 on t1.product_id = t2.product_id
where t2.product_id is NULL;

-- 8.	Display the details of orders that have not been shipped yet (shipped_date is NULL).
select order_id, shipped_date from orders
where shipped_date is NULL;

-- 9.	Find the total number of products available in each store.
select t1.store_id, t1.store_name, sum(t2.quantity) as "Total_quantity" from stores t1
join stocks t2 on t1.store_id = t2.store_id
group by 1, 2;

-- 10.	Write a query to display the details of the highest-priced product in each category.
select t1.category_id,
t1.category_name,
t2.product_name,
max(t3.list_price) as "highest-priced product"
from categories t1
join products t2 on t1.Category_id = t2.category_id
join order_items t3 on t2.product_id = t3.product_id
group by 1,2; 
 