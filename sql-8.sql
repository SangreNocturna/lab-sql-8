use sakila;

-- 1. Write a query to display for each store its store ID, city, and country
SELECT s.store_id, c.city, co.country
FROM sakila.store s
JOIN sakila.address a
ON s.address_id = a.address_id
JOIN sakila.city c 
ON a.city_id = c.city_id
JOIN sakila.country co 
ON c.country_id = co.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in

