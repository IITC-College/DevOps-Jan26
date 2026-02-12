# Hints – Arithmetic Operators and Order of Operations

Use if you’re stuck.

---

## 1. Addition and subtraction

**1.1** `print(20 + 7)`, `print(20 - 7)`, `print(-5 + 3)`.

**1.2** `print(6 * 7)`, `print(-4 * 5)`.

**1.3** One `print()` each for `+`, `-`, and `*` with any numbers.

---

## 2. Division and modulo

**2.1** `/` gives a float; `//` gives the integer quotient. `print(17 / 5)` and `print(17 // 5)`.

**2.2** `print(10 / 3)`, `print(10 // 3)`, `print(-10 // 3)`. In Python, `//` rounds toward minus infinity.

**2.3** `%` is the remainder: `print(17 % 5)`, `print(10 % 3)`, `print(10 % 2)`.

**2.4** Minutes: `73 // 60`. Leftover seconds: `73 % 60`. Print both.

---

## 3. Order of operations (סדר פעולות חשבון)

**3.1** `print(2 + 3 * 4)` → 14. `print((2 + 3) * 4)` → 20.

**3.2** `print(10 - 2 * 3)` → 4. `print((10 - 2) * 3)` → 24.

**3.3** `print(24 / 4 * 2)` → 12.0 (left to right). `print(24 / (4 * 2))` → 3.0.

**3.4** e.g. `print(5 + 3 * 2 - 1)` and `print((5 + 3) * (2 - 1))`. Any two expressions where parentheses change the result are fine.

---

## Order of operations reminder

1. Parentheses `( )`
2. `*` `/` `//` `%` (left to right)
3. `+` `-` (left to right)

---

## Common errors

| Error | Check |
|-------|--------|
| **TypeError** (e.g. unsupported operand) | You might be mixing strings and numbers (e.g. `"5" + 3`). Use numbers: `5 + 3`. |
| **ZeroDivisionError** | Division by zero: `x / 0` or `x % 0`. Avoid dividing by 0. |
