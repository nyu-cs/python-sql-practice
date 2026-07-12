# Week 02 - SQL: JOINs, NULL, Expressions, and Aliases

## 1. INNER JOIN

`INNER JOIN` is used to combine rows from two tables when the rows have matching values.

Basic format:

```sql
SELECT column, another_table_column
FROM mytable
INNER JOIN another_table
    ON mytable.id = another_table.id
WHERE condition
ORDER BY column ASC
LIMIT num_limit OFFSET num_offset;
```

Example:

```sql
FROM movies
JOIN boxoffice
    ON movies.id = boxoffice.movie_id
```


---

## 2. `JOIN` and `INNER JOIN`

You may see:

```sql
JOIN
```

instead of:

```sql
INNER JOIN
```

In many SQL queries, these two are equivalent.

Example:

```sql
SELECT title, rating
FROM movies
JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
```

is the same as:

```sql
SELECT title, rating
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
```

---

## 3. Why INNER JOIN May Not Be Enough

`INNER JOIN` only keeps rows that exist in both tables.

If data is incomplete or asymmetric, some rows may disappear from the result.

For example:

* A building exists in the `buildings` table.
* But no employee works in that building.
* If we use `INNER JOIN`, that building may not appear in the result.

In this case, we may need:

* `LEFT JOIN`
* `RIGHT JOIN`
* `FULL JOIN`

---

## 4. LEFT JOIN, RIGHT JOIN, and FULL JOIN

Basic format:

```sql
SELECT column, another_column
FROM mytable
LEFT JOIN another_table
    ON mytable.id = another_table.matching_id
WHERE condition
ORDER BY column ASC
LIMIT num_limit OFFSET num_offset;
```

### LEFT JOIN

`LEFT JOIN` keeps all rows from the left table.

If there is no matching row in the right table, the right table columns will contain `NULL`.

---

### RIGHT JOIN

`RIGHT JOIN` keeps all rows from the right table.

If there is no matching row in the left table, the left table columns will contain `NULL`.


---

### FULL JOIN

`FULL JOIN` keeps all rows from both tables.

If one side has no matching row, the missing side will contain `NULL`.

---

## 5. OUTER JOIN

You may see:

```sql
LEFT OUTER JOIN
RIGHT OUTER JOIN
FULL OUTER JOIN
```

These are equivalent to:

```sql
LEFT JOIN
RIGHT JOIN
FULL JOIN
```


---

## 6. NULL Values

`NULL` means missing or unknown data.

It is different from:

* `0`
* empty string `''`
* `False`


---

## 7. Why NULL Is Useful

Sometimes a database may use default values such as:

| Data type               | Possible default |
| ----------------------- | ---------------- |
| number                  | `0`              |
| text                    | `''`             |
| unknown / missing value | `NULL`           |

Using `NULL` can be better than using `0` when the data is genuinely missing.

Example:

If a salary is unknown, storing it as `0` may affect average salary calculations.


---

## 8. Checking NULL with `IS NULL`

use:

```sql
column IS NULL
```

or:

```sql
column IS NOT NULL
```

Basic format:

```sql
SELECT column, another_column
FROM mytable
WHERE column IS NULL;
```

Example:

```sql
SELECT *
FROM employees
WHERE building IS NULL;
```


---

## 9. Expressions in SELECT

SQL can calculate new values during a query.

Example:

```sql
SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;
```

ex:

```sql
domestic_sales + international_sales
```


---

## 10. Aliases with AS

`AS` gives a column or expression a new name.

Example:

```sql
SELECT col_expression AS expr_description
FROM mytable;
```

Example:

```sql
SELECT domestic_sales + international_sales AS combined_sales
FROM boxoffice;
```


---

## 11. Why Aliases Are Useful

Without alias:

```sql
SELECT domestic_sales + international_sales
FROM boxoffice;
```

The output column name may be long or unclear.

With alias:

```sql
SELECT domestic_sales + international_sales AS combined_sales
FROM boxoffice;
```

The result column is easier to understand.


---

## 12. Alias for Tables

Tables can also have aliases.

Example:

```sql
SELECT column AS better_column_name
FROM a_long_widgets_table_name AS mywidgets
INNER JOIN widget_sales
    ON mywidgets.id = widget_sales.widget_id;
```


Example:

```sql
SELECT m.title, b.rating
FROM movies AS m
JOIN boxoffice AS b
    ON m.id = b.movie_id;
```

Here:

* `m` means `movies`
* `b` means `boxoffice`

---

## 13. Example: Find Buildings with No Employees

Problem:

Find the names of the buildings that hold no employees.

```sql
SELECT DISTINCT building_name
FROM buildings
LEFT JOIN employees
    ON buildings.building_name = employees.building
WHERE employees.role IS NULL;
```

Explanation:

* `LEFT JOIN` keeps all rows from `buildings`.
* If a building has no matching employee, the employee columns become `NULL`.
* `WHERE employees.role IS NULL` keeps only buildings with no matching employees.


---

## 14. Example: Combined Movie Sales in Millions

Problem:

List all movies and their combined sales in millions of dollars.

```sql
SELECT title,
       (domestic_sales + international_sales) / 1000000.0 AS combined_sales_millions
FROM movies
JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
```

Explanation:

```sql
domestic_sales + international_sales
```

calculates total sales.

```sql
/ 1000000.0
```

converts dollars into millions of dollars.


Use `1000000.0` instead of `1000000` to avoid integer division issues in some SQL systems.

---

## 15. Example: Movie Ratings in Percent

Problem:

List all movies and their ratings in percent.

```sql
SELECT title,
       rating * 10 AS rating_percent
FROM movies
JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
```

Explanation:

In this table, `rating` is usually out of 10.

Example:

```text
8.3
```

means:

```text
83%
```

So we multiply by `10`.


## 16. Common JOIN Query Pattern

A useful JOIN query template:

```sql
SELECT table1.column,
       table2.another_column
FROM table1
JOIN table2
    ON table1.id = table2.table1_id
WHERE condition
ORDER BY table1.column ASC
LIMIT number OFFSET number;
```

With aliases:

```sql
SELECT m.title,
       b.rating
FROM movies AS m
JOIN boxoffice AS b
    ON m.id = b.movie_id
WHERE b.rating > 8
ORDER BY b.rating DESC;
```

---

## 18. Key Takeaways

* `JOIN` combines data from multiple tables.
* `JOIN` usually means `INNER JOIN`.
* `INNER JOIN` only keeps matched rows.
* `LEFT JOIN` keeps all rows from the left table.
* `RIGHT JOIN` keeps all rows from the right table.
* `FULL JOIN` keeps all rows from both tables.
* Missing unmatched values appear as `NULL`.
* Use `IS NULL` and `IS NOT NULL` to check NULL values.
* SQL expressions can calculate new values inside a query.
* Use `AS` to give columns, expressions, or tables clearer names.
* For strings, use quotes.
* For equality comparison in standard SQL, use `=`, not `==`.
* Use `%` to check remainders, such as even or odd years.
