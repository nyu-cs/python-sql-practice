# Week 02 - 1.Python: Booleans and Conditionals

## 1. Boolean Values

Boolean values only have two possible values:

```python
True
False
```

Example:

```python
x = True
print(x)
print(type(x))
```

Output:

```text
True
<class 'bool'>
```

---

## 2. Comparison Operations 

Comparison operations return Boolean values.

| Operation | Meaning                         |
| --------- | ------------------------------- |
| `a == b`  | a is equal to b                 |
| `a != b`  | a is not equal to b             |
| `a < b`   | a is less than b                |
| `a > b`   | a is greater than b             |
| `a <= b`  | a is less than or equal to b    |
| `a >= b`  | a is greater than or equal to b |

Examples:

```python
print(3 == 3)
print(3 != 4)
print(2 < 5)
print(10 >= 8)
```

Output:

```text
True
True
True
True
```

---

## 3. Boolean Operators: `and`, `or`, `not`

Python has three common Boolean operators:

| Operator | Meaning                        |
| -------- | ------------------------------ |
| `and`    | both sides must be True        |
| `or`     | at least one side must be True |
| `not`    | reverses True/False            |

Examples:

```python
print(True and True)
print(True and False)
print(True or False)
print(not True)
```

Output:

```text
True
False
True
False
```


---

## 4. Operator Precedence: `and` Before `or`

In Python, `and` is evaluated before `or`.

Example:

```python
True or True and False
```

This is interpreted as:

```python
True or (True and False)
```

Result:

```text
True
```

If Python evaluated it from left to right, it would be different:

```python
(True or True) and False
```

Result:

```text
False
```


Recommended:

```python
result = True or (True and False)
```

---

## 5. `if`, `elif`, and `else`

Conditional statements allow Python to run different code depending on conditions.

Example:

```python
def inspect(x):
    if x == 0:
        print(x, "is zero")
    elif x > 0:
        print(x, "is positive")
    elif x < 0:
        print(x, "is negative")
    else:
        print(x, "is unlike anything I've ever seen...")
```

Calling the function:

```python
inspect(0)
inspect(-15)
```

Output:

```text
0 is zero
-15 is negative
```

---

## 6. Truthy and Falsey Values

Python can convert many values to Boolean values using `bool()`.

Example:

```python
print(bool(1))
print(bool(0))
print(bool("asf"))
print(bool(""))
```

Output:

```text
True
False
True
False
```

Rules:

| Value                     | Boolean result |
| ------------------------- | -------------- |
| non-zero numbers          | `True`         |
| `0`                       | `False`        |
| non-empty strings         | `True`         |
| empty string `""`         | `False`        |
| non-empty lists/sequences | `True`         |
| empty lists/sequences     | `False`        |


These are often called:

* `truthy`
* `falsey`

---

## 7. Conditional Expressions

A conditional expression lets us write a simple `if/else` expression in one line.

Longer version:

```python
if total_candies == 1:
    print("Splitting 1 candy")
else:
    print("Splitting", total_candies, "candies")
```

Shorter version:

```python
print("Splitting", total_candies, "candy" if total_candies == 1 else "candies")
```

---

## 8. Boolean Logic Bug Example: Weather Function

Original logic:

* I am prepared if I have an umbrella.
* Or if the rain is not too heavy and I have a hood.
* Otherwise, I am still fine unless it is raining and it is a workday.

Buggy function:

```python
def prepared_for_weather(have_umbrella, rain_level, have_hood, is_workday):
    return have_umbrella or rain_level < 5 and have_hood or not rain_level > 0 and is_workday
```

Because `not`, `and`, and `or` have different priorities, Python reads the last part as:

```python
(not (rain_level > 0)) and is_workday
```

But the intended logic is closer to:

```python
not (rain_level > 0 and is_workday)
```

Failing test case:

```python
have_umbrella = False
rain_level = 0.0
have_hood = False
is_workday = False
```

In this case:

* It is not raining.
* It is not a workday.
* So we should be prepared.

But the buggy function returns `False`.

Corrected version with clearer parentheses:

```python
def prepared_for_weather(have_umbrella, rain_level, have_hood, is_workday):
    return (
        have_umbrella
        or (rain_level < 5 and have_hood)
        or not (rain_level > 0 and is_workday)
    )
```



---

## 9. Returning Boolean Values Directly

Long version:

```python
def is_negative(number):
    if number < 0:
        return True
    else:
        return False
```

Shorter version:

```python
def concise_is_negative(number):
    return number < 0
```


---

## 10. Using `not`

Example: plain hot dog with no toppings.

```python
def wants_plain_hotdog(ketchup, mustard, onion):
    """Return whether the customer wants a plain hot dog with no toppings."""
    return not ketchup and not mustard and not onion
```

Another equivalent version:

```python
def wants_plain_hotdog(ketchup, mustard, onion):
    return not (ketchup or mustard or onion)
```


---

## 11. Exclusive Or: Exactly One Sauce

The customer wants either ketchup or mustard, but not both.

```python
def exactly_one_sauce(ketchup, mustard, onion):
    """Return whether the customer wants either ketchup or mustard, but not both."""
    return ketchup and not mustard or mustard and not ketchup
```

Clearer version with parentheses:

```python
def exactly_one_sauce(ketchup, mustard, onion):
    return (ketchup and not mustard) or (mustard and not ketchup)
```

---

## 12. Counting Boolean Values

Booleans can behave like integers in Python:

```python
True == 1
False == 0
```

Example: exactly one topping.

```python
def exactly_one_topping(ketchup, mustard, onion):
    """Return whether the customer wants exactly one of the three available toppings."""
    return int(ketchup) + int(mustard) + int(onion) == 1
```

Because Python can add Boolean values directly, this also works:

```python
def exactly_one_topping(ketchup, mustard, onion):
    return (ketchup + mustard + onion) == 1
```


---

## 13. Blackjack Example: `should_hit`

Game rules:

* The player starts with two face-up cards.
* The dealer has one face-up card.
* The player can ask for another card, called `hit`.
* If the player's total exceeds 21, the player busts and loses immediately.
* The dealer draws cards until:

  * the dealer busts, or
  * the dealer total is at least 17.
* If the player's total is greater than the dealer's final total, the player wins.
* Otherwise, the dealer wins, including ties.

Function:

```python
def should_hit(dealer_total, player_total, player_low_aces, player_high_aces):
    """Return True if the player should hit, or False if the player should stay.

    Aces can count as high aces with value 11 if doing so does not make the hand exceed 21.
    Otherwise, aces are counted as low aces with value 1.

    Example:
    A hand {A, A, A, 7} is counted as 11 + 1 + 1 + 7 = 20,
    so player_total=20, player_low_aces=2, player_high_aces=1.
    """

    # Soft hand: the player has a high ace.
    # Example: A + 6 = soft 17.
    # Soft hands have lower bust risk because the ace can change from 11 to 1.
    if player_high_aces > 0:
        if player_total <= 17:
            return True

        # Soft 18, such as A + 7.
        # If the dealer's visible card is strong, hitting can be reasonable.
        if player_total == 18:
            return dealer_total >= 9

        # Soft 19, 20, 21 usually stay.
        return False

    # Hard hand: no high ace, so bust risk is higher.
    if player_total <= 11:
        return True

    # Hard 12:
    # Dealer 4, 5, 6 is weak, so stay.
    # Otherwise hit.
    if player_total == 12:
        return dealer_total < 4 or dealer_total > 6

    # Hard 13 to 16:
    # If dealer has 2 to 6, dealer may bust, so stay.
    # If dealer has 7 or higher, hit.
    if 13 <= player_total <= 16:
        return dealer_total >= 7

    # 17 or higher usually stay.
    return False
```


| Player hand             | Strategy                                          |
| ----------------------- | ------------------------------------------------- |
| Soft hand with high ace | Can be more aggressive because bust risk is lower |
| Hard total ≤ 11         | Hit                                               |
| Hard 12                 | Hit unless dealer has 4, 5, or 6                  |
| Hard 13–16              | Stay if dealer has 2–6, hit if dealer has 7+      |
| Hard 17+                | Stay                                              |
| Soft 18                 | Hit if dealer has 9, 10, or 11                    |
| Soft 19+                | Stay                                              |

This is not a perfect blackjack strategy, but it is a reasonable rule-based strategy for the Kaggle exercise.

---

## 14. Key Takeaways

* `bool` values are either `True` or `False`.
* Comparison operations return Boolean values.
* `and`, `or`, and `not` are used to combine Boolean logic.
* `and` has higher priority than `or`.
* Use parentheses to make complex logic clear.
* `if`, `elif`, and `else` allow different code paths.
* Empty or zero values are usually `False`.
* Non-empty or non-zero values are usually `True`.
* Boolean expressions can often be returned directly.
* `True` behaves like `1`, and `False` behaves like `0` in arithmetic.
* Complex condition-based functions should be written clearly, even if they are longer.
