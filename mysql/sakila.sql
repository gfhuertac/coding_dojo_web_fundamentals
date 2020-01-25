USE sakila;

# 1. What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.

SELECT cu.first_name, cu.last_name, cu.email, CONCAT(a.address, ' ', a.address2, ', ', ci.city)
FROM customer AS cu JOIN address AS a ON cu.address_id = a.address_id 
    JOIN city AS ci ON a.city_id = ci.city_id
WHERE ci.city_id = 312;

# 2. What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, ca.name AS genre
FROM film AS f JOIN film_category AS fc ON f.film_id = fc.film_id
    JOIN category AS ca ON ca.category_id = fc.category_id
WHERE ca.name = 'comedy';

# 3. What query would you run to get all the films joined by actor_id=5? Your query should return the actor id, actor name, film title, description, and release year.

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor, f.title, f.description, f.release_year
FROM actor AS a JOIN film_actor AS fa ON a.actor_id = fa.actor_id
	JOIN film AS f ON f.film_id = fa.film_id
WHERE a.actor_id = 5;

# 4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address.

SELECT cu.first_name, cu.last_name, cu.email, CONCAT(a.address, ' ', a.address2, ', ', ci.city) AS address
FROM customer AS cu JOIN store AS s ON s.store_id = cu.store_id
    JOIN address AS a ON cu.address_id = a.address_id 
    JOIN city AS ci ON a.city_id = ci.city_id
WHERE s.store_id = 1
AND ci.city_id IN (1, 42, 312, 459);

# 5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? Your query should return the film title, description, release year, rating, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, f.rating, f.special_features
FROM film AS f JOIN film_actor AS fa ON f.film_id = fa.film_id
    JOIN actor AS a ON a.actor_id = fa.actor_id
WHERE f.rating = 'G'
AND f.special_features LIKE '%behind the scenes%'
AND a.actor_id = 15;

# 6. What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.

SELECT  f.film_id, f.title, a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor
FROM film AS f JOIN film_actor AS fa ON f.film_id = fa.film_id
    JOIN actor AS a ON a.actor_id = fa.actor_id
WHERE f.film_id = 369;

# 7. What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, ca.name AS genre
FROM film AS f JOIN film_category AS fc ON f.film_id = fc.film_id
    JOIN category AS ca ON ca.category_id = fc.category_id
WHERE ca.name = 'drama'
AND f.rental_rate = 2.99;

# 8. What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.

SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, ca.name AS genre, a.first_name, a.last_name
FROM film AS f JOIN film_category AS fc ON f.film_id = fc.film_id
    JOIN category AS ca ON ca.category_id = fc.category_id
    JOIN film_actor AS fa ON f.film_id = fa.film_id
    JOIN actor AS a ON a.actor_id = fa.actor_id
WHERE ca.name = 'action'
AND a.first_name = 'SANDRA' AND a.last_name = 'KILMER';
