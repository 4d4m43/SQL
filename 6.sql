USE sakila;

-- 6a --
SELECT s.first_name, s.last_name, a.address
FROM staff as s
JOIN address as a
ON s.address_id = a.address_id;

-- 6b --
SELECT s.first_name, s.last_name, SUM(p.amount)
FROM staff as s
JOIN payment as p
ON s.staff_id = p.staff_id
WHERE MONTH(payment_date) = 8 and YEAR(payment_date) = 2005;

-- 6c --
SELECT f.title, fa.actor_id
FROM film as f
JOIN film_actor as fa
ON f.film_id = fa.film_id
GROUP BY f.film_id;

-- 6d --
SELECT f.title, COUNT(inventory_id)
FROM film as f
JOIN inventory as i
ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible';

-- 6e --
SELECT c.first_name, c.last_name, SUM(p.amount)
FROM customer as c
JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY last_name ASC;