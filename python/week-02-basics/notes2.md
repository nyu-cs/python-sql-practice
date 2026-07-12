# Week 02 - 2.Python: Lists and Loops

## 1. Lists 

A list is an ordered collection of values.

Example:

```python
planets = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune']
```


---

## 2. List Indexing 

Python lists use zero-based indexing.

That means the first element is at index `0`.

```python
planets[0]
```

returns:

```text
'Mercury'
```

### Negative Indexing 

Negative indices count from the end of the list.

```python
planets[-1]
```

returns the last element.

```python
planets[-2]
```

returns the second last element.


---

## 3. List Slicing 

Slicing is used to get part of a list.

Basic format:

```python
list[start:end]
```

The range includes `start`, but excludes `end`. `[start, end)`

### Examples

```python
planets[0:3]
```

Returns elements from index `0` to index `2`.

```python
planets[:3]
```

Same as `planets[0:3]`. It starts from the beginning and excludes index `3`.

```python
planets[3:]
```

Starts from index `3` and goes to the end.

```python
planets[1:-1]
```

Returns all planets except the first and last.

```python
planets[-3:]
```

Returns the last three elements.

---

## 4. Updating Lists

Lists are mutable, meaning they can be changed.

Example:

```python
planets[:3] = ['Mur', 'Vee', 'Ur']
```

This replaces the first three elements of the list.

---

## 5. Useful List Functions and Methods

### `sorted()`

`sorted()` returns a sorted version of a list. But not modify original list.

```python
sorted(planets)
```

For strings, it sorts alphabetically.

---

### `sum()`

`sum()` adds up numeric values in a list.

```python
primes = [2, 3, 5, 7]
sum(primes)
```

Output:

```text
17
```

---

### `append()`

`append()` adds an item to the end of a list.

```python
planets.append('Pluto')
```

Using `help()`:

```python
help(planets.append)
```

Output summary:

```text
append(object, /)
    Append object to the end of the list.
```


---

### `pop()`

`pop()` removes and returns the last element of a list.

```python
last_planet = planets.pop()
```

---

### `index()`

`index()` returns the index of an element.

```python
planets.index('Earth')
```

Output:

```text
2
```
planets[2]

---

### `in`

Use `in` to check whether an element exists in a list.

```python
'Earth' in planets
```

Output:

```text
True
```


---

### `count()`

`count()` counts how many times an element appears in a list.

```python
meals.count('rice')
```


---

## 6. Methods 
Objects in Python can have methods.

Example:

```python
x = 12
help(x.bit_length)
```

Output summary:

```text
bit_length()
    Number of bits necessary to represent self in binary.
```


---

## 7. Tuples 

A tuple is similar to a list, but it cannot be changed.

Example:

```python
coordinates = (1, 2, 3)
```

---

## 8. Swapping Variables 

Python allows easy variable swapping.

```python
a = 1
b = 0

a, b = b, a

print(a, b)
```

Output:

```text
0 1
```



---

## 9. Example: Fashionably Late

Problem:

A guest is fashionably late if they arrive after at least half of the guests, but they are not the final guest.

```python
def fashionably_late(arrivals, name):
    order = arrivals.index(name)
    return order >= len(arrivals) / 2 and order != len(arrivals) - 1
```

Explanation:

```python
order = arrivals.index(name)
```

finds the guest's arrival position.

```python
order >= len(arrivals) / 2
```

checks whether the guest arrived in the second half.

```python
order != len(arrivals) - 1
```

checks that the guest was not the last person.



---

# Part 2 - Loops 

## 10. `range()`

`range(i)` creates a sequence from `0` to `i - 1`.

```python
range(5)
```

represents:

```text
0, 1, 2, 3, 4
```


---

## 11. `for` Loops

A `for` loop repeats code for each item in a sequence.

```python
for i in range(5):
    print(i)
```

Output:

```text
0
1
2
3
4
```


---

## 12. `while` Loops

A `while` loop repeats code while a condition is true.

```python
i = 0

while i < 5:
    print(i)
    i += 1
```

Output:

```text
0
1
2
3
4
```


---

## 13. List Comprehensions 

List comprehensions create lists in a concise way.

Basic format:

```python
new_list = [expression for item in iterable]
```

Example:

```python
squares = [n**2 for n in range(10)]
```

Output:

```text
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```


---

## 14. List Comprehensions with Conditions

You can add an `if` condition.

```python
short_planets = [planet for planet in planets if len(planet) < 6]
```

Output:

```text
['Venus', 'Earth', 'Mars']
```


---

## 15. Transforming Values in List Comprehensions

The expression can also transform each value.

```python
loud_short_planets = [planet.upper() + '!' for planet in planets if len(planet) < 6]
```

Output:

```text
['VENUS!', 'EARTH!', 'MARS!']
```


---

## 16. Repeating a Constant in a List Comprehension

The expression does not have to use the variable.

```python
[32 for planet in planets]
```

Output:

```text
[32, 32, 32, 32, 32, 32, 32, 32]
```


---

## 17. Counting with List Comprehensions

### Version 1: using `len()`

```python
def count_negatives(nums):
    return len([num for num in nums if num < 0])
```

Explanation:

* create a list of all negative numbers
* count the length of that list

---

### Version 2: using Boolean arithmetic

```python
def count_negatives(nums):
    return sum([num < 0 for num in nums])
```

Explanation:

`num < 0` returns `True` or `False`.

In Python:

```python
True == 1
False == 0
```

So:

```python
sum([True, False, True])
```

returns:

```text
2
```


---

## 18. `any()`

`any()` returns `True` if at least one element in an iterable is true.

```python
any(iterable)
```

Example:

```python
def has_lucky_number(nums):
    return any([num % 7 == 0 for num in nums])
```


Example:

```python
print(any([False, False, True]))
print(any([False, False, False]))
```

Output:

```text
True
False
```

---

## 19. Example: Elementwise Greater Than

Problem:

Return a list with the same length as `L`, where each value is `True` if the original value is greater than `thresh`.

```python
def elementwise_greater_than(L, thresh):
    """Return a list with the same length as L, where the value at index i is
    True if L[i] is greater than thresh, and False otherwise.

    >>> elementwise_greater_than([1, 2, 3, 4], 2)
    [False, False, True, True]
    """
    return [l > thresh for l in L]
```

Example:

```python
elementwise_greater_than([1, 2, 3, 4], 2)
```

Output:

```text
[False, False, True, True]
```


---

## 20. Example: Boring Menu

Problem:

Given a list of meals served over some period of time, return `True` if the same meal has ever been served two days in a row (Two continuous days).

```python
def menu_is_boring(meals):
    """Return True if the same meal has ever been served two days in a row,
    and False otherwise.
    """
    return any([meals[i] == meals[i+1] for i in range(len(meals)-1)])
```

Explanation:

```python
range(len(meals)-1)
```

allows us to compare each element with the next one.

```python
meals[i] == meals[i+1]
```

checks whether two neighbouring meals are the same.

---

## 21. Example: Slot Machine Average Payout

Problem:

Each slot machine play costs `1`.

`play_slot_machine()` returns:

* `0` most of the time
* `1.5` occasionally as a prize

Net profit per play:

```python
-1 + play_slot_machine()
```

Function:

```python
def estimate_average_slot_payout(n_runs):
    """Run the slot machine n_runs times and return the average net profit per run."""
    cost = sum([-1 + play_slot_machine() for i in range(n_runs)])
    return cost / n_runs
```

Explanation:

```python
[-1 + play_slot_machine() for i in range(n_runs)]
```

runs the slot machine `n_runs` times and records the net profit for each run.

```python
sum(...)
```

adds all net profits.

```python
cost / n_runs
```

returns the average net profit per run.


---

## 22. Common Patterns

### Pattern 1: Loop through indices

```python
for i in range(len(items)):
    print(items[i])
```

Use this when you need the index.

---

### Pattern 2: Loop through values directly

```python
for item in items:
    print(item)
```

Use this when you only need the value.

---

### Pattern 3: Compare neighbouring elements

```python
for i in range(len(items) - 1):
    if items[i] == items[i + 1]:
        print("Repeated neighbours")
```

Useful for problems like checking consecutive repeated meals.

---

### Pattern 4: Create a transformed list

```python
new_list = [x * 2 for x in nums]
```

---

### Pattern 5: Filter a list

```python
small_nums = [x for x in nums if x < 10]
```

---

### Pattern 6: Count conditions

```python
count = sum([x < 0 for x in nums])
```

---

### Pattern 7: Check if any condition is true

```python
has_match = any([x == target for x in nums])
```

---

## 23. Key Takeaways

* Lists are ordered collections.
* Python list indices start from `0`.
* Negative indices count from the end.
* Slicing uses `[start:end]`, including `start` but excluding `end`.
* Lists are mutable and can be changed.
* `append()` adds an item to the end.
* `pop()` removes and returns the last item.
* `index()` finds the index of an item.
* `in` checks whether an item exists in a list.
* `count()` counts how many times an item appears.
* Tuples are similar to lists but cannot be changed.
* `range(i)` means `[0, i)`.
* `for` loops repeat over a sequence.
* `while` loops repeat while a condition is true.
* List comprehensions are concise ways to create lists.
* `any()` checks whether at least one condition is true.
* Boolean values can be summed because `True` acts like `1` and `False` acts like `0`.
* To check consecutive repeated elements, compare `items[i]` with `items[i+1]`.
