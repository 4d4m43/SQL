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
SELECT f.title, COUNT(r.inventory_id)
FROM rental r
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film f
ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY COUNT(r.inventory_id) DESC;

-- 7f --
SELECT s.store_id, SUM(p.amount)
FROM store s
JOIN inventory i
ON s.store_id = i.store_id
JOIN rental r
ON r.inventory_id = i.inventory_id
JOIN payment p
ON p.rental_id = r.rental_id
GROUP BY s.store_id;


-- 7g --
SELECT s.store_id, cy.city, cu.country
FROM store s
JOIN address a
ON s.address_id = a.address_id
JOIN city cy
ON a.city_id = cy.city_id
JOIN country cu
ON cy.country_id = cu.country_id;

-- 7h --
SELECT c.name, SUM(p.amount)
FROM category c
JOIN film_category AS fc
ON c.category_id = fc.category_id
JOIN inventory AS i
ON i.film_id = fc.film_id
JOIN rental AS r
ON r.inventory_id = i.inventory_id
JOIN payment AS p
ON p.rental_id = r.rental_id
GROUP BY c.name
ORDER BY SUM(p.amount) DESC
LIMIT 5;