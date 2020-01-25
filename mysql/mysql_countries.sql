USE world;

#1. What query would you run to get all the countries that speak Slovene? Your query should return the name of the country, language and language percentage. Your query should arrange the result by language percentage in descending order. (1)

SELECT c.name, l.language, l.percentage
FROM countries AS c JOIN languages AS l ON c.code = l.country_code
WHERE l.language = 'Slovene'
ORDER BY l.percentage DESC;

#2. What query would you run to display the total number of cities for each country? Your query should return the name of the country and the total number of cities. Your query should arrange the result by the number of cities in descending order. (3)

SELECT c.name, COUNT(ci.id) AS number_of_cities
FROM countries AS c LEFT JOIN cities AS ci ON c.code = ci.country_code
GROUP BY c.name
ORDER BY number_of_cities DESC;

#3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? Your query should arrange the result by population in descending order. (1)

SELECT ci.name, ci.population
FROM countries AS c JOIN cities AS ci ON c.code = ci.country_code
WHERE c.name = 'Mexico'
AND ci.population > 500000
ORDER BY ci.population DESC;

#4. What query would you run to get all languages in each country with a percentage greater than 89%? Your query should arrange the result by percentage in descending order. (1)

SELECT c.name, l.language, l.percentage
FROM countries AS c JOIN languages AS l ON c.code = l.country_code
WHERE l.percentage > 89
ORDER BY c.name ASC, l.percentage DESC;

#5. What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)

SELECT c.name
FROM countries AS c
WHERE c.surface_area < 501
AND c.population > 100000
ORDER BY c.name ASC;

#6. What query would you run to get countries with only Constitutional Monarchy with a capital greater than 200 and a life expectancy greater than 75 years? (1)

SELECT c.name
FROM countries AS c JOIN cities AS ci ON c.capital = ci.id
WHERE c.government_form = 'Constitutional Monarchy'
AND c.life_expectancy > 74
AND ci.population > 200
ORDER BY c.name ASC;

#7. What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? The query should return the Country Name, City Name, District and Population. (2)

SELECT c.name, ci.name, ci.district, ci.population
FROM countries AS c JOIN cities AS ci ON c.capital = ci.id
WHERE c.name = 'Argentina'
AND ci.district > 'Buenos Aires'
AND ci.population > 500000
ORDER BY ci.name ASC;

#8. What query would you run to summarize the number of countries in each region? The query should display the name of the region and the number of countries. Also, the query should arrange the result by the number of countries in descending order. (2)

SELECT c.region, COUNT(c.id) AS number_of_countries
FROM countries AS c
GROUP BY c.region
ORDER BY number_of_countries DESC;