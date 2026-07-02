# Week 01 - SQL Basics: SELECT, WHERE, DISTINCT, ORDER BY, LIMIT

## 1. What is SQL?

SQL, or Structured Query Language, is a language used to query, manipulate, and transform data stored in relational databases.

SQL is widely used because it allows both technical and non-technical users to retrieve and analyse structured data from databases in a clear and readable way.


---

## 2. Relational Databases 

A relational database is made up of related tables.

Each table is similar to an Excel spreadsheet. It has:

* columns: the attributes or features of the data
* rows: individual records
* table name: the name of the dataset

Example table:

| Id | Make/Model        | Wheels | Doors | Type       |
| -: | ----------------- | -----: | ----: | ---------- |
|  1 | Ford Focus        |      4 |     4 | Sedan      |
|  2 | Tesla Roadster    |      4 |     2 | Sports     |
|  3 | Kawasaki Ninja    |      2 |     0 | Motorcycle |
|  4 | McLaren Formula 1 |      4 |     0 | Race       |
|  5 | Tesla S           |      4 |     4 | Sedan      |

---

## 3. Basic SELECT Query

The `SELECT` statement is used to choose which columns to return from a table.

Basic format:

```sql
SELECT column, another_column
FROM mytable;
```

Example:

```sql
SELECT title, year
FROM movies;
```

This returns only the `title` and `year` columns from the `movies` table.

---

## 4. SELECT All Columns

To return all columns from a table, use `*`.

```sql
SELECT *
FROM mytable;
```

Example:

```sql
SELECT *
FROM movies;
```

---

## 5. Filtering Rows with WHERE

The `WHERE` clause is used to filter rows based on conditions.

Basic format:

```sql
SELECT column, another_column
FROM mytable
WHERE condition;
```

Example:

```sql
SELECT title, year
FROM movies
WHERE year > 2000;
```

This returns movies released after 2000.

---

## 6. Multiple Conditions: AND / OR

Use `AND` when all conditions must be true.

```sql
SELECT title, year
FROM movies
WHERE year >= 2000 AND year <= 2010;
```

Use `OR` when at least one condition can be true.

```sql
SELECT title, year
FROM movies
WHERE year < 2000 OR year > 2010;
```



---

## 7. Numeric Operators 

Common numeric comparison operators:

| Operator                  | Meaning                   | Example                          |
| ------------------------- | ------------------------- | -------------------------------- |
| `=`                       | equal to                  | `year = 2003`                    |
| `!=`                      | not equal to              | `year != 2003`                   |
| `<`                       | less than                 | `year < 2000`                    |
| `<=`                      | less than or equal to     | `year <= 2000`                   |
| `>`                       | greater than              | `year > 2000`                    |
| `>=`                      | greater than or equal to  | `year >= 2000`                   |
| `BETWEEN ... AND ...`     | within a range, inclusive | `year BETWEEN 2000 AND 2010`     |
| `NOT BETWEEN ... AND ...` | outside a range           | `year NOT BETWEEN 2000 AND 2010` |
| `IN (...)`                | exists in a list          | `year IN (2001, 2003, 2005)`     |
| `NOT IN (...)`            | does not exist in a list  | `year NOT IN (2001, 2003, 2005)` |

Example:

```sql
SELECT title, year
FROM movies
WHERE year BETWEEN 2000 AND 2010;
```

---

## 8. String Conditions

Text values should be wrapped in quotes.

In many SQL systems, single quotes are the standard style:

```sql
WHERE country = 'Canada';
```

SQLBolt also accepts double quotes in many examples:

```sql
WHERE country = "Canada";
```

For long-term habit, using single quotes for strings is safer.

Common string operators:

| Operator       | Meaning                  | Example                               |
| -------------- | ------------------------ | ------------------------------------- |
| `=`            | exact match              | `city = 'Chicago'`                    |
| `!=` or `<>`   | not equal to             | `city != 'Chicago'`                   |
| `LIKE`         | pattern matching         | `city LIKE 'New%'`                    |
| `NOT LIKE`     | does not match pattern   | `city NOT LIKE 'New%'`                |
| `%`            | zero or more characters  | `city LIKE '%York%'`                  |
| `_`            | exactly one character    | `city LIKE 'A_'`                      |
| `IN (...)`     | exists in a list         | `country IN ('Canada', 'Mexico')`     |
| `NOT IN (...)` | does not exist in a list | `country NOT IN ('Canada', 'Mexico')` |

Examples:

```sql
SELECT *
FROM north_american_cities
WHERE country = 'Canada';
```

```sql
SELECT *
FROM north_american_cities
WHERE city LIKE '%York%';
```
---

## 9. DISTINCT: Removing Duplicates

Query results can contain duplicate values.

Use `DISTINCT` to remove duplicates.

Basic format:

```sql
SELECT DISTINCT column
FROM mytable;
```

Example:

```sql
SELECT DISTINCT director
FROM movies
ORDER BY director ASC;
```

This lists all Pixar movie directors alphabetically without duplicates.

---

## 10. ORDER BY: Sorting Results

Use `ORDER BY` to sort query results.

Basic format:

```sql
SELECT column, another_column
FROM mytable
WHERE condition
ORDER BY column ASC;
```

`ASC` means ascending order.

`DESC` means descending order.

If not specified, SQL usually sorts in ascending order by default.

Examples:

```sql
SELECT *
FROM movies
ORDER BY title ASC;
```

```sql
SELECT *
FROM movies
ORDER BY year DESC;
```


---

## 11. LIMIT and OFFSET

`LIMIT` controls how many rows are returned.

`OFFSET` controls how many rows to skip before returning results.

Basic format:

```sql
SELECT column, another_column
FROM mytable
WHERE condition
ORDER BY column ASC
LIMIT num_limit OFFSET num_offset;
```

Example: list the first five Pixar movies alphabetically.

```sql
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 5;
```

Example: list the next five Pixar movies alphabetically.

```sql
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;
```

---

## 12. Representative Practice Queries

### List all directors of Pixar movies alphabetically, without duplicates

```sql
SELECT DISTINCT director
FROM movies
ORDER BY director ASC;
```

---

### List the last four Pixar movies released, from most recent to least recent

```sql
SELECT *
FROM movies
ORDER BY year DESC
LIMIT 4;
```

---

### List the first five Pixar movies sorted alphabetically

```sql
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 5;
```

---

### List the next five Pixar movies sorted alphabetically

```sql
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;
```

---

### List all Canadian cities and their populations

```sql
SELECT *
FROM north_american_cities
WHERE country = 'Canada';
```

---

### Order all cities in the United States by latitude from north to south

```sql
SELECT *
FROM north_american_cities
WHERE country = 'United States'
ORDER BY latitude DESC;
```

Explanation:

Higher latitude means further north, so `ORDER BY latitude DESC` sorts from north to south.

---

### List all cities west of Chicago, ordered from west to east

Using a subquery:

```sql
SELECT *
FROM north_american_cities
WHERE longitude < (
    SELECT longitude
    FROM north_american_cities
    WHERE city = 'Chicago'
)
ORDER BY longitude ASC;
```

Explanation:

In North America, longitude values are usually negative.

A smaller longitude means further west.

Example:

| City        |   Longitude |
| ----------- | ----------: |
| Los Angeles | around -118 |
| Chicago     |  around -87 |
| New York    |  around -74 |

So cities west of Chicago have longitude less than Chicago's longitude.

---

### List the two largest cities in Mexico by population

```sql
SELECT *
FROM north_american_cities
WHERE country = 'Mexico'
ORDER BY population DESC
LIMIT 2;
```

---

### List the third and fourth largest cities in the United States by population

```sql
SELECT *
FROM north_american_cities
WHERE country = 'United States'
ORDER BY population DESC
LIMIT 2 OFFSET 2;
```

Explanation:

* `ORDER BY population DESC` sorts from largest to smallest.
* `OFFSET 2` skips the first two largest cities.
* `LIMIT 2` returns the next two cities, which are the third and fourth largest.

---

## 13. Useful SQL Query Template

A useful basic query structure:

```sql
SELECT DISTINCT column, another_column
FROM mytable
WHERE condition
ORDER BY column ASC
LIMIT number OFFSET number;
```

Not every query needs every part.

Common order:

```sql
SELECT
FROM
WHERE
ORDER BY
LIMIT
OFFSET
```

---

## 14. Key Takeaways

* `SELECT` chooses columns.
* `FROM` chooses the table.
* `WHERE` filters rows.
* `AND` means all conditions must be true.
* `OR` means at least one condition must be true.
* `DISTINCT` removes duplicate results.
* `ORDER BY` sorts results.
* `ASC` means ascending order.
* `DESC` means descending order.
* `LIMIT` controls how many rows are returned.
* `OFFSET` skips a number of rows.
* Text values should be written in quotes.
* Single quotes are the standard style for strings in SQL.
