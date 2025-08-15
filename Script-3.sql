--Data Manipulation Lengauage

--Create Table
create table products(
   	product_id int PRIMARY KEY,
   	product_name varchar,
   	price float
);
--insert data
insert into products(
product_id, product_name, price)
values
	(1, 'Aplle', 100),
	(2, 'Banana', 50),
	(3, 'Cherry', 80);

--select column 
select * from products p; --p adalah inisial table

--select spesifik column 
select p.product_id, p.product_name, p.price 
from products p;

--select with the limit 
select * from products p 
limit 1;

--select with the where
select * from products p 
where price > 70;

--update data
update products
set
	product_name = 'avocado',
	price = 200
where product_id = 1;

--Delete data
delete from products 
where product_name = 'Banana';


-- Create Table
create table employees(
	employee_id int primary key,
	employee_name varchar,
	department_id float);
	
-- Insert Table
insert into employees(
	employee_id, employee_name, department_id)
values
	(1, 'John Doe', 101),
	(2, 'Jane Smith', 102),
	(3, 'Bob Johnson', 101),
	(4, 'Alice Williams', 103),
	(5, 'Jane Doe', 104);

-- Create Table departments
create table departments(
	department_id int primary key,
	department_name varchar);
	
-- Insert Table
insert into departments(
	department_id, department_name)
values
	(101, 'HR'),
	(102, 'Marketing'),
	(103, 'IT'),
	(105, 'Product');
	
select * from departments d;

select * from employees e ;


-- Inner join 
select e.employee_id, e.employee_name, d.department_name 
from employees e 
inner join departments d 
	on e.department_id  = d.department_id ; 

-- Left Join
SELECT 
e.employee_id,
e.employee_name,
d.department_name
FROM 
employees e -- table kiri
LEFT JOIN 
departments d -- table kanan
ON e.department_id = d.department_id;

-- Right Join
SELECT 
e.employee_id,
e.employee_name,
d.department_name
FROM 
employees e -- table kiri
RIGHT JOIN 
departments d -- table kanan 
ON e.department_id = d.department_id;

-- Full outer join
SELECT 
e.employee_id,
e.employee_name,
d.department_name
FROM 
employees e
FULL OUTER JOIN 
departments d
ON e.department_id = d.department_id;

-- Union
SELECT
	city, country_id 
FROM 
	city c
WHERE
	country_id = 2
UNION
SELECT
	city, country_id 
FROM 
	city c
WHERE
	country_id = 3
ORDER BY 
	city;

-- Cross Join
select e.employee_name, d.department_name  
from employees e 
cross join departments d;

--case 
SELECT title,
       length,
       CASE
           WHEN length > 0
                AND length <= 50 THEN 'Short'
           WHEN length > 50
                AND length <= 120 THEN 'Medium'
           WHEN length > 120 THEN 'Long'
       END duration
FROM 
film
ORDER BY 
title;


