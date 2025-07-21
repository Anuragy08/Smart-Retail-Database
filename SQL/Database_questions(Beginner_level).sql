-- An sql query to retrive all store names and their corresponding zip codes
select store_name, zip_code from stores;

-- The total number of customers in the database.
select count(customer_id) from customers;

-- The list of unique product categories available
select distinct category_id, category_name from categories;

-- Retrive all orders placed by a specific customer using their customer ID
select * from orders
where customer_id = 1;
-- or
select distinct customer_id, count(t2.order_id) from  orders t1
left join order_items t2 on t1.order_id = t2.order_id
group by 1;

-- List all products with a price higher than $500
select product_id, product_name, list_price from products
where list_price > 500;
