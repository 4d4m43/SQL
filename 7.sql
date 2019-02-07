USE sakila;

-- 7a --
SELECT *
FROM film f 
WHERE (f.title LIKE 'K%') OR (f.title LIKE 'Q%') 
AND f.title IN(
	SELECT title
    FROM film ff
    where ff.language_id = '1'
    );

-- 7b --
SELECT *
FROM actor a 
WHERE a.actor_id IN(
	SELECT actor_id
    FROM film_actor fa
    where fa.film_id IN(
		SELECT film_id
        FROM film f
        WHERE f.title = 'Alone Trip'
    )
);

-- 7c --
SELECT c.first_name, c.last_name, c.email, c.address_id
FROM customer as c
JOIN address as a
ON c.address_id = a.address_id
JOIN city as cy
ON a.city_id = cy.city_id
JOIN country as cu
ON cu.country_id = cy.country_id
WHERE cu.country = 'Canada'
ORDER BY last_name ASC;

-- 7d --
SELECT f.title, fc.category_id, c.name
FROM film as f
JOIN film_category as fc
ON f.film_id = fc.film_id
JOIN category as c
ON fc.category_id = c.category_id
WHERE c.name = 'Family';

-- 7e --
SELECT r.inventory_id, COUNT(c.last_name, SUM(p.amount)
FROM rental as r
JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY last_name ASC;