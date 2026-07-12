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

--Find the name and role of all employees who have not been assigned to a building
SELECT name, role FROM employees
WHERE building IS NULL;

--Find the names of the buildings that hold no employees
SELECT DISTINCT building_name FROM buildings
LEFT JOIN employees
    ON buildings.building_name = employees.building
WHERE employees.role IS NULL;

--List all movies and their combined sales in millions of dollars
SELECT title,
       (domestic_sales + international_sales) / 1000000 AS combined_sales_millions
FROM movies
JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

--List all movies and their ratings in percent 
SELECT title,
       rating*10 AS rating_percent
FROM movies
JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

--List all movies that were released on even number years 
SELECT title,year
FROM movies
WHERE year % 2 == 0;