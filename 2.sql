/* 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?

* 2b. Find all actors whose last name contain the letters `GEN`:

* 2c. Find all actors whose last names contain the letters `LI`. This time, order the rows by last name and first name, in that order:

* 2d. Using `IN`, display the `country_id` and `country` columns of the following countries: Afghanistan, Bangladesh, and China:
*/

USE sakila;

SELECT * FROM actor LIMIT 10;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = "Joe"
ORDER BY last_name ASC;

SELECT *
FROM actor
WHERE UPPER(last_name) LIKE "%GEN%"
ORDER BY last_name ASC;

SELECT *
FROM actor
WHERE UPPER(last_name) LIKE "%LI%"
ORDER BY last_name, first_name;

SELECT * FROM country LIMIT 10;

SELECT country_id, country
FROM country
WHERE country IN ("Afghanistan", "Bangladesh", "China");