# Hints – Type Casting (המרת טיפוסים)

Use if you’re stuck.

---

## Part 1 – int()

**1.1** `s = "42"`, `n = int(s)`, then `print(n)` and `print(n + 8)`.

**1.2** `x = 3.9`, then `print(int(x))`. int() truncates toward zero (3.9 → 3).

**1.3** `a = "10"`, `b = "3"`, then `print(int(a) + int(b))`.

---

## Part 2 – float()

**2.1** `s = "3.14"`, `x = float(s)`, then `print(x)` and `print(x * 2)`.

**2.2** `n = 5`, then `print(float(n))`.

**2.3** `s = "10"`, then `print(float(s) / 4)`.

---

## Part 3 – str()

**3.1** `n = 100`, `s = str(n)`, then `print(s)` and `print(s + " items")`.

**3.2** `price = 2.5`, `s = str(price)`, then e.g. `print("Price: " + s)`.

**3.3** `n = 7`, then `print("Result: " + str(n))`. You can’t do `"Result: " + n` when n is int; use str(n).

---

## Part 4 – bool()

**4.1** `print(bool(0))`, `print(bool(1))`, `print(bool(-5))`.

**4.2** `print(bool(""))`, `print(bool("hello"))`.

---

## Part 5 – Mixed

**5.1** `s = "100"`, `n = int(s)`, `f = float(n)`, then `print(f)`.

**5.2** `age = 25`, `height = 1.75`, then e.g. `print("Age: " + str(age))` and `print("Height: " + str(height))`.

---

## Summary

- **int(x)** – from string or float to integer (float is truncated).
- **float(x)** – from string or int to float.
- **str(x)** – from any type to string (for printing or concatenation).
- **bool(x)** – truthy/falsy (0, "" → False; non-zero, non-empty → True).

---

## Common errors

| Error | Check |
|-------|--------|
| **ValueError** (int/float) | String doesn’t represent a number (e.g. int("3.14") or int("abc")). |
| **TypeError: can only concatenate str with str** | Use str(number) when building "text" + number. |
| **TypeError: unsupported operand** | Don’t mix string and number in + for addition; cast one type. |
