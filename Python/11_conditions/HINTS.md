# Hints – if, elif, else (Conditions)

Use if you’re stuck.

---

## Part 1 – if only

**1.1** `ok = True` then:
```python
if ok:
    print("Yes")
```
Indent the body with 4 spaces (or one tab; stay consistent).

**1.2** `if 5 > 3:` then on the next line (indented) `print("Five is greater than three")`.

**1.3** `x = 10` then `if x > 5:` and indented `print("x is greater than 5")`.

---

## Part 2 – if / else

**2.1** `n = 7` then:
```python
if n % 2 == 0:
    print("Even")
else:
    print("Odd")
```

**2.2** `age = 15` then `if age >= 18:` print `"Adult"` else print `"Minor"`.

**2.3** `n = int(input("Number: "))` then `if n > 0:` print `"Positive"` else print `"Not positive"`.

---

## Part 3 – if / elif / else

**3.1** `score = 85` then:
```python
if score >= 90:
    print("A")
elif score >= 70:
    print("B")
else:
    print("C")
```
Only one branch runs; `elif` is checked only if the previous `if`/`elif` was False.

**3.2** `n = 3` then `if n == 1:` ... `elif n == 2:` ... `elif n == 3:` ... `else:` ...

**3.3** `temp = 25` then `if temp < 0:` ... `elif temp < 20:` ... `elif temp < 30:` ... `else:` ...

---

## Part 4 – Nested and combined

**4.1** Outer: `if x > 5:` then inside (more indent) `if y > 0:` print one thing, `else:` print another. Outer `else:` for `x <= 5`.

**4.2** `if name == "Alice":` ... `else:` ... Use `==` for comparison.

**4.3** `if age >= 18 and has_ticket:` ... `else:` ... Both conditions must be true for the first branch.

---

## Syntax reminders

- **Colon** after the condition: `if x > 0:` not `if x > 0`.
- **Indentation** defines the block. Same level = same block. Use 4 spaces consistently.
- **elif** = “else if”; only one of the if/elif/else chain runs.

---

## Common errors

| Error | Check |
|-------|--------|
| **IndentationError** | Body of if/elif/else must be indented. Same block = same indent. |
| **SyntaxError** | Colon at end of `if`/`elif`/`else` line. |
| **NameError** | Variable used in condition must be defined first. |
