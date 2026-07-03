# Week 02 - Python: Functions and Getting Help

## 1. `help()` Function

The `help()` function shows information about a function, including:

* what the function does
* what arguments it takes
* optional parameters
* documentation written by the programmer

Basic format:

```python
help(function_name)
```

Example:

```python
help(print)
```

---

## 2. Defining a Function with `def`

A function is a reusable block of code.

Basic format:

```python
def function_name(parameter1, parameter2):
    # code
    return result
```

Example:

```python
def least_difference(a, b, c):
    """Return the smallest difference between any two numbers
    among a, b and c.
    
    >>> least_difference(1, 5, -5)
    4
    """
    diff1 = abs(a - b)
    diff2 = abs(b - c)
    diff3 = abs(a - c)
    return min(diff1, diff2, diff3)
```

Example call:

```python
least_difference(1, 5, -5)
```

Output:

```text
4
```

---

## 3. Docstrings 

A docstring is a description written inside a function.

It is usually written using triple quotes:

```python
"""
description
"""
```

Example:

```python
def least_difference(a, b, c):
    """Return the smallest difference between any two numbers
    among a, b and c.
    """
    diff1 = abs(a - b)
    diff2 = abs(b - c)
    diff3 = abs(a - c)
    return min(diff1, diff2, diff3)
```

When we call:

```python
help(least_difference)
```

Python shows the docstring:

```text
Help on function least_difference in module __main__:

least_difference(a, b, c)
    Return the smallest difference between any two numbers
    among a, b and c.
```

---

## 4. Example: `help(print)`

When running:

```python
help(print)
```

Python shows:

```text
print(value, ..., sep=' ', end='\n', file=sys.stdout, flush=False)
```

Important parameters:

| Parameter         | Meaning                                         |
| ----------------- | ----------------------------------------------- |
| `value, ...`      | values to print                                 |
| `sep=' '`         | separator between values, default is a space    |
| `end='\n'`        | what to print at the end, default is a new line |
| `file=sys.stdout` | where to print the output                       |
| `flush=False`     | whether to forcibly flush the output stream     |

Example:

```python
print("Hello", "Python")
```

Output:

```text
Hello Python
```

Because the default `sep` is a space.

Example using `sep`:

```python
print("Hello", "Python", sep="-")
```

Output:

```text
Hello-Python
```

Example using `end`:

```python
print("Hello", end=" ")
print("Python")
```

Output:

```text
Hello Python
```



---

## 5. `round()` Function

The `round()` function rounds a number.

Basic format:

```python
round(number, ndigits=None)
```

Examples:

```python
round(3.14159, 2)
```

Output:

```text
3.14
```

If `ndigits` is omitted or `None`, the result is an integer:

```python
round(3.14159)
```

Output:

```text
3
```

---

## 6. Negative `ndigits` in `round()`

`ndigits` can be negative.

* `ndigits=-1` rounds to the nearest 10
* `ndigits=-2` rounds to the nearest 100
* `ndigits=-3` rounds to the nearest 1000

Examples:

```python
print(round(1234, -1))
print(round(1234, -2))
print(round(1234, -3))
```

Output:

```text
1230
1200
1000
```


Example:

```python
weekly_income = 687
print(round(weekly_income, -2))
```

Output:

```text
700
```

This can be useful when estimating income, spending, or savings.

---

## 7. Functions Can Be Used as Arguments

Some functions can take another function as an argument.

Example:

```python
def mod_5(x):
    """Return the remainder of x after dividing by 5"""
    return x % 5
```

This function returns the remainder after dividing `x` by 5.

Examples:

```python
print(mod_5(100))
print(mod_5(51))
print(mod_5(14))
```

Output:

```text
0
1
4
```

---

## 8. `max()` with `key`

The `max()` function normally returns the largest value.

Example:

```python
max(100, 51, 14)
```

Output:

```text
100
```

But `max()` can also use a `key` function.

Example:

```python
def mod_5(x):
    """Return the remainder of x after dividing by 5"""
    return x % 5

print(
    'Which number is biggest?',
    max(100, 51, 14),
    'Which number is the biggest modulo 5?',
    max(100, 51, 14, key=mod_5),
    sep='\n',
)
```

Output:

```text
Which number is biggest?
100
Which number is the biggest modulo 5?
14
```

Explanation:

| Number | `number % 5` |
| -----: | -----------: |
|    100 |            0 |
|     51 |            1 |
|     14 |            4 |

`max(100, 51, 14, key=mod_5)` does not compare the original numbers directly.

It compares the result of:

```python
mod_5(number)
```

So the largest modulo 5 value is `4`, which belongs to `14`.


```python
max(100, 51, 14)
```

returns:

```text
100
```

But:

```python
max(100, 51, 14, key=mod_5)
```

returns:

```text
14
```

---

## 9. Useful Pattern: Function + `key`

The `key` parameter is useful when the comparison rule is not the original value.

Examples:

```python
names = ["Li", "Liosa", "Alexander"]

print(max(names, key=len))
```

Output:

```text
Alexander
```

Explanation:

`key=len` means compare the length of each string, not alphabetical order.

---

## 10. Key Takeaways

* `help(function)` shows how a function works.
* `def` defines a new function.
* Parameters are values passed into a function.
* `return` sends a result back from the function.
* Docstrings explain what a function does.
* Triple quotes `""" """` are commonly used for docstrings.
* `print()` has useful optional parameters like `sep` and `end`.
* `round(number, ndigits)` can round numbers.
* Negative `ndigits` can round to tens, hundreds, thousands, etc.
* Functions can be passed as arguments to other functions.
* `key=` changes how functions like `max()` compare values.
