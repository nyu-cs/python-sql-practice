-- Find the domestic and international sales for each movie 
SELECT * FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

--Show the sales numbers for each movie that did better internationally rather than domestically 
SELECT * FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE domestic_sales < international_sales;

--List all the movies by their ratings in descending order
SELECT * FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;

--Find the list of all buildings that have employees
SELECT DISTINCT building
FROM employees;

--Find the list of all buildings and their capacity
SELECT *
FROM buildings;

--List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT building_name, capacity, role
FROM buildings
LEFT JOIN Employees
    ON buildings.building_name = employees.building;