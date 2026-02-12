# Hints – Comparison Operators

Use if you’re stuck.

---

## Part 1 – == and !=

**1.1** `print(5 == 5)` then `print(5 == 3)`. Use two equal signs for equality.

**1.2** `print(10 != 3)` then `print(7 != 7)`. `!=` means not equal.

**1.3** `a = 100`, `b = 100`, `print(a == b)`. Then `c = 50`, `print(a != c)`.

---

## Part 2 – < and >

**2.1** `print(3 < 5)`, `print(3 > 5)`, `print(5 > 5)`. For “greater than or equal” use `>=`.

**2.2** `x = 10`, `y = 20`, then `print(x < y)` and `print(y < x)`.

---

## Part 3 – <= and >=

**3.1** `print(4 <= 4)` (true: 4 is equal to 4). `print(4 <= 5)` (true). `print(4 >= 4)` (true). `print(3 >= 5)` (false).

**3.2** `n = 7`, then `print(n <= 10)`, `print(n <= 7)`, `print(n <= 5)`.

---

## Part 4 – Mix and strings

**4.1** Four prints: `print(10 == 10)`, `print(10 != 9)`, `print(10 < 20)`, `print(10 >= 10)`.

**4.2** `print("apple" < "banana")`, `print("abc" == "abc")`, `print("abc" != "ABC")`. String comparison is character-by-character (lexicographic); uppercase and lowercase differ.

**4.3** `result = 5 >= 3`, `print(result)`, then `result = 1 == 0`, `print(result)`.

---

## Summary

| Operator | Meaning |
|----------|--------|
| `==` | equal |
| `!=` | not equal |
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal |
| `>=` | greater than or equal |

All return `True` or `False`. Use `==` for equality (one `=` is assignment).

---

## Common errors

| Error | Check |
|-------|--------|
| **SyntaxError** | Using one `=` for comparison: use `==` for “equal”. |
| **TypeError** | Comparing incompatible types (e.g. string with int) may raise an error; compare numbers with numbers, or strings with strings. |
