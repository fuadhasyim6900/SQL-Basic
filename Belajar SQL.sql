--mengambil data dari kolom actor pakai *
select *
from actor a;

--memilih kolom tertentu 
select a.first_name , a.last_name 
from actor a;

--penggunaan where yang ada nick nama depanya
select * 
from actor a 
where a.first_name = 'nick';

---------------------------------------------- 5

--limit (untuk menampilkan beberapa kolom), sama aja 
--seperti head di python
--mengambil 5 baris pertama dalam tabel
select *
from address a 
limit 5;

--mengambil 5 baris terakhir dalam tabel
select *
from address a 
order by a.address desc
limit 5;

--mengambil 5 baris setelah baris ke 10
select*
from address a 
limit 5
offset 5;

-----------------06 Alias
--menggunakan alias AS
select
title as judul,
rental_rate as harga_sewa
from film;

--tanpa menggunakan alias AS
select
title judul,
rental_rate harga_sewa
from film;

--menulis kolom judul alias tanpa spasi
select 
title "Judul Film",
rental_rate harga_sewa
from film;

--menggunakan alias untuk nama tabel
SELECT 
    f.film_id as id_film, 
    f.title as judul_film, 
    f.release_year as tahun_perilisan,
    f.rental_rate as harga_sewa, 
    c."name" as kategori_film
FROM film f 
JOIN film_category fc 
    ON f.film_id = fc.film_id 
JOIN category c 
    ON fc.category_id = c.category_id;

--menggunakan alias bersama fungsi agregat (sum,avg dll)
select
sum (amount) total_pendapatan,
count (*) jumlah_transaksi,
min (amount) pembayaran_minimum,
max (amount) pembayaran_maksimum,
avg (amount) pembayaran_ratarata
from payment p;

--menggunakan alias pada joins
SELECT 
    f.film_id as id_film, 
    f.title as judul_film, 
    f.release_year as tahun_perilisan,
    f.rental_rate as harga_sewa, 
    c."name" as kategori_film
FROM film f 
JOIN film_category fc 
    ON f.film_id = fc.film_id 
JOIN category c 
    ON fc.category_id = c.category_id;

--menggunakan alias pada subquery
select *
from
(select * from film f 
join film_category fc 
on f.film_id = fc.film_id
join category c 
on fc.category_id = c.category_id 
where f.length >= 60) as film_data_60;

