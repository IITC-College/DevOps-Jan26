# Hints – Shortcut (Compound) Assignment

Use if you’re stuck.

---

**1** `n = 10`, `print(n)`, then `n += 3`, `print(n)`.

**2** `total = 20`, `print(total)`, then `total -= 7`, `print(total)`.

**3** `count = 0`, then `count += 1` and `print(count)`, then `count += 1` and `print(count)`. In Python there is no `count++`.

**4** `x = 5`, then `x -= 1`, `print(x)`, then `x -= 1`, `print(x)`. In Python there is no `x--`.

**5** `factor = 4`, `print(factor)`, then `factor *= 5`, `print(factor)`.

**6** `value = 100.0`, `print(value)`, then `value /= 4`, `print(value)`.

**7** `n = 17`, then `n //= 5`, `print(n)`.

**8** `n = 17`, then `n %= 5`, `print(n)`.

**9** e.g. `x = 10`, `x += 2`, `print(x)`, `x -= 1`, `print(x)`, `x *= 2`, `print(x)`.

**10** `s = "Hello"`, `s += "!"`, `print(s)`, `s += " World"`, `print(s)`. For strings only `+=` makes sense (concatenate and assign). There is no `-=` for strings.

---

## Reminder

- `x += 1` is the same as `x = x + 1`. Same idea for `-=`, `*=`, `/=`, `//=`, `%=`.
- Python does **not** have `++` or `--`. Use `x += 1` and `x -= 1`.

---

## Common errors

| Error | Check |
|-------|--------|
| **SyntaxError** | No space inside the operator: use `+=` not `+ =`. |
| **TypeError** (e.g. unsupported operand) | e.g. `s -= "x"` — strings don’t support `-=`. Use `+=` for string concatenation only. |
