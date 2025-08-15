--select all column
select * from payment p;
--select distint
select distinct staff_id
from payment p;

--order by
select title, length
from film f
order  by title asc; -- A ke Z

select title, length
from film f
order  by title desc; -- Z ke A

--Agregration
--count
select count(title)
from film f;

--max
select max(title)
from film f;

--Group by
select staff_id,
sum(amount) as total_amount
from payment p 
group by staff_id;

--Group by Having
select staff_id,
sum(amount) as total_amount
from payment p 
group by staff_id
having sum(amount)<31000;

--Tampilkan kolom first_name dan last_name dari tabel actor untuk aktor
--yang memiliki first_name Jennifer, Nick, dan Ed.

SELECT first_name, last_name
FROM actor
WHERE first_name IN ('Jennifer', 'Nick', 'Ed');

--Hitung total amount untuk setiap payment_id dari tabel payment, 
--dan tampilkan hanya baris yang memiliki total amount lebih dari 5.99.

SELECT payment_id, SUM(amount) AS total_amount
FROM payment
GROUP BY payment_id
HAVING SUM(amount) > 5.99;

--Dari tabel film, tampilkan film_id, title, description, dan length.
-- Kelompokkan length ke dalam 4 kategori sebagai berikut:

SELECT
    film_id,
    title,
    description,
    length,
    CASE 
    	when length > 100 then 'Over 100'
    	when length > 86 and length <= 100 then 'Between 87 and 100'
    	when length > 71 and length <= 87 then 'Between 72 and 86'
    	when length < 72 then 'Under 72' 
    end as length_category
    from film;
    

--Gabungkan tabel rental dan payment untuk menampilkan 10 baris pertama dengan kolom:
--rental_id, rental_date, payment_id, amount

SELECT 
    r.rental_id,
    r.rental_date,
    p.payment_id,
    p.amount
FROM rental r
INNER JOIN payment p ON r.rental_id = p.rental_id
ORDER BY p.amount asc
LIMIT 10;

--Dari tabel address, gabungkan seluruh kolom dari alamat yang memiliki 
--city_id = 42 dan city_id = 300 menggunakan UNION.

SELECT
	city_id 
FROM 
	address
WHERE
	city_id = 42
UNION
SELECT
	city_id 
FROM 
	address
WHERE
	city_id = 300
ORDER BY 
	city_id;





