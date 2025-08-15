select * from sample;

SELECT "Profit"
FROM sample;


-- 1. Identify customers with negative total profit
select "Customer ID", "Customer Name", 
	sum("Profit") as total_profit
from sample s 
group by "Customer ID", "Customer Name" 
having sum("Profit") < 0 
order by total_profit asc
limit 10;

-- 2. Monthly sales trend
select date_trunc('month', "Order Date") as month,
	sum("Sales") as total_sales
from sample s 
group by month
order by month;

-- 3. Yearly Profit Trend
select extract(year from "Order Date") as year,
	sum("Profit") as total_profit
from sample s 
group by year 
order by year;

-- 4. YoY Sales Growth
select year, total_sales, 
		lag(total_sales) over (order by year) as prev_year_sales,
		round((total_sales - lag(total_sales) over (order by year)) * 100 / 
			nullif(lag(total_sales) over(order by year), 0),2) as yoy_growth_percentage
from (select extract (year from "Order Date") as year,
		sum("Sales") as total_sales
	  from sample s 
	  group by year) --subquery
order by year;

-- formula yoy growth(%) = ((tot_sales - prev_year_sales)/ tot_sales)*100


-- 5. Sales Contribution per Sub-Category
select extract (year from "Order Date") as year ,
		"Sub-Category",
		sum("Sales") as total_sales,
		round(sum("Sales")*100 / sum(sum("Sales")) over(), 2) as percentage_total_sales
from sample s 
group by year, "Sub-Category" 
order by year, percentage_total_sales desc;

-- 6. Sales vs Profit Correlation by Sub-category
select "Sub-Category", sum("Sales") as total_sales, sum("Profit") as total_profit
from sample
group by "Sub-Category";

--7. Running 3- month avegare sales tren
SELECT
    DATE_TRUNC('month', "Order Date") AS month,
    SUM("Sales") AS monthly_sales,
    ROUND(AVG(SUM("Sales")) OVER (
        ORDER BY DATE_TRUNC('month', "Order Date")
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS running_3_month_avg
FROM sample
GROUP BY DATE_TRUNC('month', "Order Date")
ORDER BY month;

-- 8. Detect customers with shortes repeat purchase interval
with ordered_customer as (select "Customer ID", 
							"Order Date"::date as order_date,
							lag("Order Date"::date) over (partition by "Customer ID" order by "Order Date"::date) as prev_order_date
						  from sample s
) -- CTE
select "Customer ID", order_date, prev_order_date, ("order_date" - prev_order_date) as days_between
from ordered_customer
where prev_order_date is not null 
order by days_between desc;

-- 9. Monthly sales vs Target Achievement (Target: 50.000)
select month, total_sales, 50000 as target,
		round(total_sales*100 / 50000, 2) as target_achievement_percentage
from (select date_trunc('month', "Order Date")as month,
		sum("Sales") as total_sales
	 from sample s 
	 group by month)
order by month asc; 

-- 10. Simple predict next onth sales with simple moving average
with monthly_sales as (select date_trunc('month', "Order Date"::date) as month,
						sum("Sales") as total_sales
					   from sample s 
					   group by month 
), -- CTE 1
max_month as (select max(month) as max_month
				from monthly_sales
),
last_3_months as (select ms.*
				  from monthly_sales ms
				  cross join max_month m
				  where ms.month >= m.max_month - interval '3 months'
), -- CTE 2
predicted as (select round(avg(total_sales), 2) as predicted_sales
				from last_3_months
) -- CTE 3
select (mn.max_month + interval '1 month') as predicted_month, p.predicted_sales
from max_month mn
cross join predicted p;






















