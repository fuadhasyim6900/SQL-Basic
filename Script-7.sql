
-- Row Number : Memberikan nomor urut pada data
-- Use case : Mau melihat urutan transaksi untuk setiap customer dari yg terlama hingga terupdate
select customer_id, amount, payment_date,
	row_number() over(partition by customer_id order by payment_date) as transaksi_berapa
from payment p; 

-- Sum() with Window Function
-- Use case : Menghitung total kumulatif pembelian masing-masing customer dari waktu ke waktu
select customer_id , amount, payment_date,
	sum(amount) over(partition by customer_id order by payment_date) as cumulative_amount
from payment p; 

-- Lag() with Window Function
select amount, payment_date,
	amount,
	lag(amount) over(order by payment_date)as penjualan_hari_sebelumnya
from payment p; 

with penjualan as (select payment_date,
						amount,
					lag(amount) over(order by payment_date)as penjualan_hari_sebelumnya
					from payment
)
select payment_date, amount, penjualan_hari_sebelumnya, (amount-penjualan_hari_sebelumnya) as selisih_amount
from penjualan;