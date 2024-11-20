SELECT name AS city_name, region AS region_name
FROM cities
WHERE population > 350000;

SELECT c.name AS city_name
FROM cities c
JOIN regions r ON c.region = r.uuid
WHERE r.name = 'Nord';
