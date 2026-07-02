# Week 01 - Python Basics: Hello, Python


## 1. Checking Types with `type()`

The `type()` function shows the data type of a value or variable.

```python
type(spam_amount)
```

Output:

```text
int
```


| Type    | Meaning                          |
| ------- | -------------------------------- |
| `int`   | integer                    |
| `float` | decimal number              |
| `str`   | string 字符串                       |
| `bool`  | Boolean value, `True` or `False` |

---

## 2. Arithmetic Operators 

Python can be used like a calculator.

| Operator | Name               | Description                             | Example             |
| -------- | ------------------ | --------------------------------------- | ------------------- |
| `a + b`  | Addition         | Sum of `a` and `b`                      | `1 + 2`             |
| `a - b`  | Subtraction      | Difference between `a` and `b`          | `5 - 3`             |
| `a * b`  | Multiplication   | Product of `a` and `b`                  | `4 * 2`             |
| `a / b`  | True division  | Quotient of `a` and `b`, keeps decimals | `5 / 2` gives `2.5` |
| `a // b` | Floor division  | Quotient without the fractional part    | `5 // 2` gives `2`  |
| `a % b`  | Modulus          | Remainder after division                | `5 % 2` gives `1`   |
| `a ** b` | Exponentiation  | `a` raised to the power of `b`          | `2 ** 3` gives `8`  |
| `-a`     | Negation         | The negative value of `a`               | `-5`                |

Examples:

```python
print(5 / 2)
print(5 // 2)
print(5 % 2)
print(2 ** 3)
```

Output:

```text
2.5
2
1
8
```

---

## 3. Useful Built-in Functions 

### `min()` and `max()`

`min()` returns the smallest value.

`max()` returns the largest value.

```python
print(min(1, 2, 3))
print(max(1, 2, 3))
```

Output:

```text
1
3
```

---

### `abs()`

`abs()` returns the absolute value.

```python
print(abs(32))
print(abs(-32))
```

Output:

```text
32
32
```


---

## 4. Type Conversion 类型转换

Python can convert values from one type to another.

### Convert to float

```python
print(float(10))
```

Output:

```text
10.0
```

### Convert to int

```python
print(int(3.33))
```

Output:

```text
3
```

Note:

`int(3.33)` does not round the number. It removes the decimal part.

### Convert string to int

```python
print(int('807') + 1)
```

Output:

```text
808
```

---

## 5. Strings and Multiplication 字符串与乘法

Python allows multiplying a string by an integer.

```python
viking_song = "Spam " * 4
print(viking_song)
```

Output:

```text
Spam Spam Spam Spam 
```

---

## 6. Kaggle Notebook Shortcuts

In Kaggle notebooks, you can use keyboard shortcuts to create new code cells.

| Shortcut  | Meaning                            |
| --------- | ---------------------------------- |
| `Esc + A` | Add a new cell above 格 |
| `Esc + B` | Add a new cell below 


---

## 7. Key Takeaways

* Variables store values.
* Variables can be updated using their current value.
* `print()` displays output.
* `type()` checks the type of a value.
* Python uses indentation for code blocks.
* Strings can be repeated using `*`.
* `int`, `float`, `str`, and `bool` are common data types.
* `int()` and `float()` can convert values to numbers.
* `//` gives floor division.
* `%` gives the remainder.
* `**` is used for exponentiation.
