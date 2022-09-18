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
SELECT f.title, r.rental_id
FROM sakila.film f
JOIN sakila.inventory i
ON f.film_id = i.film_id
JOIN sakila.rental r
ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY r.rental_id DESC;


-- 5. List the top five genres in gross revenue in descending order
SELECT c.name, sum(p.amount) as gross_revenue
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
JOIN sakila.film f
ON fc.film_id = f.film_id
JOIN sakila.inventory i
ON f.film_id = i.film_id
JOIN sakila.rental r
ON i.inventory_id = r.inventory_id
JOIN sakila.payment p
ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY p.payment_id DESC
LIMIT 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT st.store_id, f.title
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
JOIN sakila.film f
ON fc.film_id = f.film_id
JOIN sakila.inventory i
ON f.film_id = i.film_id
JOIN sakila.store st
WHERE f.title = 'ACADEMY DINOSAUR'
GROUP BY st.store_id;

-- 7. Get all pairs of actors that worked together


-- 8. Get all pairs of customers that have rented the same film more than 3 times


-- 9. For each film, list actor that has acted in more films
SELECT f.title, a.first_name, a.last_name, count(a.last_name) as apariciones
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
JOIN sakila.actor a
ON fa.actor_id = a.actor_id
GROUP BY f.title
ORDER BY count(a.last_name) DESC;


