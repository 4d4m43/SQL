/*/ 4a. List the last names of actors, as well as how many actors have that last name.

* 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors.

* 4c. The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as `GROUCHO WILLIAMS`. Write a query to fix the record.

* 4d. Perhaps we were too hasty in changing `GROUCHO` to `HARPO`. It turns out that `GROUCHO` was the correct name after all! In a single query, if the first name of the actor is currently `HARPO`, change it to `GROUCHO`.
*/

USE sakila;

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name;

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

UPDATE actor
SET first_name = "HARPO", last_name = "WILLIAMS"
WHERE first_name = "GROUCHO" and last_name = "WILLIAMS";

UPDATE actor
SET first_name = "GROUCHO", last_name = "WILLIAMS"
WHERE first_name = "HARPO" and last_name = "WILLIAMS";

SELECT * FROM actor
WHERE first_name = "HARPO";