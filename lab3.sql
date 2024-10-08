SELECT name 
FROM cities 
WHERE name LIKE '%ськ';

SELECT name 
FROM cities 
WHERE name LIKE '%донец%';

SELECT CONCAT(name, ' (', region, ')') AS city_region 
FROM cities 
WHERE population > 100000 
ORDER BY name;

SELECT name, population, 
       (population / 40000000.0) * 100 AS population_percentage 
FROM cities 
ORDER BY population DESC 
LIMIT 10;

SELECT name AS city_name,
       (population / 40000000) * 100 AS population_percentage
FROM cities
WHERE population >= 40000
ORDER BY population_percentage;
