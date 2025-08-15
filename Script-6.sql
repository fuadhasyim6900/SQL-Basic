-- DS Salaries

-- Select all column 
select * from ds_salaries ds 
limit 10;

-- String Left / Right
select left(job_title, 4)
from ds_salaries ds; 

select right(job_title, 5)
from ds_salaries ds; 

-- Substring
select substring(job_title, 6, 9) 
from ds_salaries ds; 

-- Concat
select concat(first_name,' ', last_name) as nama_lengkap
from actor a; 

-- Lower 
select lower('TEST');

-- Upper 
select upper('test');

-- fahira > Fahira (fungsi Initcap)
select initcap('fahira') 

-- Length
select length(first_name) as length_name, a.first_name 
from actor a ;

-- Timestamp

-- Now / Current Timestamp
select now();
select current_timestamp ; 

-- Add and Sub
select current_timestamp + interval '1 month';

-- Date trunc
select date_trunc('day', current_timestamp); 

-- Extract month
select extract(month from payment_date), payment_date 
from payment p ;

-- Sub Query
-- Use case : Pada tahun 2007, siapakah customer yg total pembeliannya di atas rata-rata?

select customer_id, amount 
from payment 
where amount > (select avg(amount) from payment p)
and extract (year from payment_date) = 2007
order by amount asc;

-- Use case : Melihat total salary dari setiap job title, dimana employee residence = US dan Total_salary > 500.000

select job_title, total_salary, employee_residence
from (select job_title, sum(salary_in_usd) as total_salary, employee_residence
		from ds_salaries ds 
		group by job_title, employee_residence) --Subquery
where employee_residence = 'US'
and total_salary > 500000;

-- CTE

with total_salary as (select job_title, sum(salary) as totalsalary, employee_residence
					  from ds_salaries ds 
					  where employee_residence = 'US'
					  group by job_title, employee_residence
) -- CTE 
select job_title, totalsalary, employee_residence
from total_salary
where totalsalary > 500000; --query utama

with total_salary as (select job_title, sum(salary) as totalsalary, employee_residence
					  from ds_salaries ds 
					  where employee_residence = 'US'
					  group by job_title, employee_residence
) -- CTE 
select * from total_salary ;

-- CTE
-- Use Case : Melihat total salary dari setiap job title, dimana employee residence = US dan Total_salary > 500.000
with total_salary as (select job_title, sum(salary) as totalsalary, employee_residence
					  from ds_salaries ds 
					  where employee_residence = 'US'
					  group by job_title, employee_residence
) -- CTE 
select job_title, totalsalary, employee_residence
from total_salary
where totalsalary > 500000; --query utama 

-- Rank 
-- Use case : melihat Ranking Job Title berdasarkan Total Salary tertinggi, namun berdasarkan pada experience level
select sum(salary) as total_salary, job_title, experience_level,
	rank() over(partition by experience_level order by sum(salary) desc) as ranked
from ds_salaries ds
where employee_residence = 'US'
group by job_title , experience_level
order by job_title;