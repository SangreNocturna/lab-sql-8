USE sakila;

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

SELECT s.store_id, sum(p.amount) as total_income_per_store
FROM sakila.store s 
JOIN sakila.staff st
ON s.store_id = st.store_id
JOIN sakila.payment p 
ON st.staff_id = p.staff_id
GROUP BY s.store_id;

-- 3. Which film categories are longest?
SELECT c.name, length
FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
JOIN sakila.category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY length DESC;

-- 4. Display the most frequently rented movies in descending order