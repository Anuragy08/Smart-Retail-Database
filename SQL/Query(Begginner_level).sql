-- 1. Write a query to display all columns from the stores table.
desc stores;

-- 2. Retrieve the names and emails of all customers from the customers table.
select (first_name,' ',last_name) as "customer_full_name", email as "customer's email"
from customers;

-- 3. Count the total number of products available in the products table.
select product_id, product_name from products
group by 1;

-- 4. List all distinct order statuses from the orders table.
select order_status from orders; 

-- 5. Find the number of employees (staff) working in the company.
select count(distinct staff_id) from staffs;

-- 6. Display all store details where the state is 'California'.
select * from stores 
where state = 'CA';

-- 7. Retrieve all product details where the list price is greater than 100.
select * from products t1
join order_items t2 on t1.product_id = t2.product_id
where t2.list_price > 100;

-- 8. Write a query to display the store names and their corresponding zip codes.
select store_name, zip_code from stores; 

-- 9. Retrieve all records from the stocks table where quantity is greater than 50.
select * from stocks 
where quantity > 50;

-- 10. Find all customers whose first name starts with the letter ‘A’.
select concat(first_name,' ', last_name) as "Customer's_name"
from customers
where first_name like "A%"
