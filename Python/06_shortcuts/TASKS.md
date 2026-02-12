# Tasks – Shortcut (Compound) Assignment Operators

Practice `+=`, `-=`, `*=`, `/=`, `//=`, `%=` and similar. Python does **not** have `++` or `--`; use `x += 1` and `x -= 1` instead. Create each file, run it, and check the output.

Run scripts with: `python3 script_name.py`

---

## Task 1 – += (`shortcut_plus.py`)

- Create `shortcut_plus.py`.
- Assign `10` to a variable `n`. Print `n`.
- Use `n += 3` (same as `n = n + 3`). Print `n`.

**Expected output:**
```
10
13
```

---

## Task 2 – -= (`shortcut_minus.py`)

- Create `shortcut_minus.py`.
- Assign `20` to `total`. Print `total`.
- Use `total -= 7`. Print `total` again.

**Expected output:**
```
20
13
```

---

## Task 3 – “Increment” like ++ (`shortcut_increment.py`)

- Create `shortcut_increment.py`.
- Python has no `++`. Assign `0` to `count`, then use `count += 1` twice (or in a row). Print `count` after each change so you see 1, then 2.

**Expected output:**
```
1
2
```

---

## Task 4 – “Decrement” like -- (`shortcut_decrement.py`)

- Create `shortcut_decrement.py`.
- Python has no `--`. Assign `5` to `x`, then use `x -= 1`. Print `x`. Use `x -= 1` again and print `x`.

**Expected output:**
```
4
3
```

---

## Task 5 – *= (`shortcut_mul.py`)

- Create `shortcut_mul.py`.
- Assign `4` to `factor`. Print `factor`.
- Use `factor *= 5`. Print `factor`.

**Expected output:**
```
4
20
```

---

## Task 6 – /= (`shortcut_div.py`)

- Create `shortcut_div.py`.
- Assign `100.0` to `value`. Print `value`.
- Use `value /= 4`. Print `value`.

**Expected output:**
```
100.0
25.0
```

---

## Task 7 – //= (`shortcut_floordiv.py`)

- Create `shortcut_floordiv.py`.
- Assign `17` to `n`. Use `n //= 5` (same as `n = n // 5`). Print `n`.

**Expected output:**
```
3
```

---

## Task 8 – %= (`shortcut_mod.py`)

- Create `shortcut_mod.py`.
- Assign `17` to `n`. Use `n %= 5`. Print `n`.

**Expected output:**
```
2
```

---

## Task 9 – Several shortcuts in one script (`shortcut_mixed.py`)

- Create `shortcut_mixed.py`.
- Assign `10` to a variable. Use `+= 2`, then `-= 1`, then `*= 2`. Print the variable after each step (or only at the end). Show the final value.

**Expected output (if you print after each step):**
```
12
11
22
```

---

## Task 10 – Shortcut with string? (`shortcut_string.py`)

- Create `shortcut_string.py`.
- Assign `"Hello"` to a variable `s`. Use `s += "!"` (string concatenation). Print `s`. Then use `s += " World"` and print `s`.

**Expected output:**
```
Hello!
Hello! World
```

---

## Done

You’ve used: `+=`, `-=`, `*=`, `/=`, `//=`, `%=`, and that in Python we use `x += 1` / `x -= 1` instead of `++` / `--`. These shortcuts change the variable in place (assign the new value back to the same name).
