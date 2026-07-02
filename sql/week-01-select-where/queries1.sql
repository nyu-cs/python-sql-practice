--List all directors of Pixar movies (alphabetically), without duplicates 
SELECT DISTINCT Director FROM movies
ORDER BY Director ASC;

--List the last four Pixar movies released (ordered from most recent to least) 
SELECT * FROM movies
ORDER BY Year DESC
LIMIT 4;

--List the first five Pixar movies sorted alphabetically 
SELECT * FROM movies
ORDER BY Title ASC
LIMIT 5;

--List the next five Pixar movies sorted alphabetically 
SELECT * FROM movies
ORDER BY Title ASC
LIMIT 5 OFFSET 5;

--List all the Canadian cities and their populations
SELECT * FROM north_american_cities
WHERE Country = "Canada";

--Order all the cities in the United States by their latitude from north to south
SELECT * FROM north_american_cities
WHERE Country = "United States"
ORDER BY Latitude DESC;

--** List all the cities west of Chicago, ordered from west to east 
SELECT * FROM north_american_cities
WHERE Longitude < (
    SELECT Longitude
    FROM north_american_cities
    WHERE City = 'Chicago'
)
ORDER BY Longitude;

--List the two largest cities in Mexico (by population)
SELECT * FROM north_american_cities
WHERE Country = "Mexico"
ORDER BY Population DESC
LIMIT 2;

-- List the third and fourth largest cities (by population) in the United States and their population 
SELECT * FROM north_american_cities
WHERE Country = "United States"
ORDER BY Population DESC
LIMIT 2 OFFSET 2;
