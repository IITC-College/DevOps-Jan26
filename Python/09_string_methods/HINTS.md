# Hints – String Operations: Concatenation, Repetition, str()

Use if you’re stuck.

---

## Part 1 – Concatenation

**1.1** `a = "Hello"`, `b = "World"`, then `print(a + " " + b)` or `print(a, b)` (no +). For concatenation use `a + " " + b`.

**1.2** e.g. `first = "John"`, `last = "Doe"`, then `print(first + " " + last)`.

**1.3** `a = "Py"`, `b = "thon"`, `word = a + b`, then `print(word)`.

**1.4** `s = "Hello"`, `s += "!"`, `s += " World"`, then `print(s)`.

---

## Part 2 – Repetition

**2.1** `print("a" * 5)`.

**2.2** `s = "-"`, then `print(s * 10)`.

**2.3** `print("=" * 3 + " Hi " + "=" * 3)`. Order: repeat, then concatenate.

**2.4** `n = 4`, `c = "*"`, then `print(c * n)`. The number must be the second operand: `string * number`.

---

## Part 3 – str()

**3.1** `n = 42`, then `print("Answer: " + str(n))`. Without str() you get TypeError (str + int).

**3.2** `x = 3.14`, then `print("Pi is " + str(x))`.

**3.3** `n = 5`, then `print("You have " + str(n) + " items.")`.

**3.4** e.g. `line = "-" * 3 + " Count: " + str(10) + " " + "-" * 3`, then `print(line)`.

---

## Reminders

- **Concatenation:** `"a" + "b"` → `"ab"`. Only strings; for numbers use str().
- **Repetition:** `"x" * 3` → `"xxx"`. Order is string * integer (not integer * string in older Python for strings; in 3.x both work but string * int is the usual).
- **str(x)** turns a number (or other type) into a string so you can use `+` with other strings.

---

## Common errors

| Error | Check |
|-------|--------|
| **TypeError: can only concatenate str with str** | You used `"text" + number`. Use `"text" + str(number)`. |
| **TypeError** with * | For string repetition use string * int (e.g. `"a" * 5`). |
