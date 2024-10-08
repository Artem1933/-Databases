SELECT name, population 
FROM cities 
WHERE population >= 1000000;

SELECT name, population 
FROM cities 
WHERE region IN ('E', 'W') 
ORDER BY population DESC;

SELECT name, population 
FROM cities 
WHERE population > 50000 AND region IN ('S', 'C', 'N');

SELECT name, population 
FROM cities 
WHERE population BETWEEN 150000 AND 350000 AND region IN ('E', 'W', 'N') 
ORDER BY name 
LIMIT 20;

SELECT name, population 
FROM cities 
WHERE region NOT IN ('E', 'W') 
ORDER BY population DESC 
LIMIT 10 OFFSET 10;
