USE sakila;

-- 8a --
CREATE VIEW top_5 AS
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

-- 8b --
SELECT * FROM top_5;

-- 8c --
DROP VIEW top_5;