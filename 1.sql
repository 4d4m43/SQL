/* 1a. Display the first and last names of all actors from the table `actor`.
* 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column `Actor Name`.
*/

USE sakila;

SELECT first_name, last_name FROM actor ORDER BY last_name ASC;

SELECT CONCAT(first_name, " ", last_name) AS name
FROM actor;