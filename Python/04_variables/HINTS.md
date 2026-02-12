# Hints – Variables

Use if you’re stuck.

---

**1** `answer = 42` then `print(answer)`.

**2** `name = "Alice"` (or your name in quotes) then `print(name)`.

**3** `x = 10`, `print(x)`, then `x = 20`, `print(x)`. Reassign by using `=` again.

**4** `a = 3`, `b = 5`, then `print(a, b)`.

**5** `x = 10`, `y = 3`, then `print(x + y)` and `print(x - y)`.

**6** `quotient = 100 // 7`, `remainder = 100 % 7`, then print both.

**7** `n = 7`, `print(n)`, then `n = n + 1` (or `n = n * 2`), `print(n)`.

**8** `a = 2`, `b = 3`, `c = 4`, then `print(a * b + c)` and `print(a * (b + c))`.

**9** `label = "Count"`, `value = 5`, then e.g. `print(label, value, sep=": ")`.

**10** `price = 3.5`, `quantity = 2`, then `print(price * quantity)`.

**11** `original = 100`, `copy = original`, print both. Then `original = 200`, print both again. Only `original` changes.

**12** `msg = "Done!"` then `print(msg, msg, msg, sep=" ")`.

---

## Naming

- Use letters, digits, underscores (e.g. `my_value`, `x1`). No spaces.
- Start with a letter or underscore. Prefer `snake_case` for multi-word names.

---

## Common errors

| Error | Check |
|-------|--------|
| **NameError: name 'x' is not defined** | Variable used before it’s assigned, or typo in the name. |
| **NameError** after assignment | Spelling and case must match exactly (e.g. `Answer` vs `answer`). |
| **TypeError** (e.g. str + int) | Can’t add string and number with `+`. Use `print(a, b)` or convert (e.g. `str(n)`). |
