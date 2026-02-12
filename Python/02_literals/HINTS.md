# Hints – Literals and Data Types

Use if you’re stuck. Don’t read ahead if you want to figure it out yourself.

---

## 1. Strings

**1.1** Use `print("Hello")` and `print('World')` in the same file.

**1.2** Put `\n` inside the string for a newline; put `\t` for a tab. Example: `"Line one\nLine two"`.

**1.3** Start with `"""` or `'''`, type two or three lines, then close with the same quote. No need to use `\n` inside.

---

## 2. Integers

**2.1** Just print numbers: `print(42)`, `print(-7)`, `print(0)`.

**2.2** Use a variable: `n = 1_000_000` then `print(n)`. For the sum, `print(1_000 + 500)`.

**2.3** Use `print(10 + 3)`, `print(10 - 3)`, etc. `//` is integer division (result is int).

---

## 3. Floats

**3.1** Print decimals: `print(3.14)`, `print(-0.5)`, `print(2.0)`.

**3.2** Use `1e3` (means 1 × 10³), `1e-2` (1 × 10⁻²). Print them to see the float value.

**3.3** `/` always gives a float; `//` gives an int. Try `print(10 / 4)` and `print(10 // 4)`.

---

## 4. Octal

**4.1** Use the prefix `0o` (digit zero + letter o): `x = 0o10` then `print(x)`. Same for `0o755`.

**4.2** `oct(255)` returns a string like `"0o377"`. Print that string.

**4.3** Store `0o12` in a variable; printing the variable shows decimal. Passing it to `oct()` shows octal again.

---

## 5. Hexadecimal

**5.1** Use the prefix `0x`: `print(0xFF)`, `print(0x1A)`.

**5.2** `hex(255)` returns `"0xff"`. Print the result of `hex(255)` and `hex(16)`.

**5.3** e.g. `r = 0xFF`, then `print(r)` and `print(hex(r))`.

---

## 6. Booleans

**6.1** `True` and `False` are capitalized. Use `print(True)` and `print(False)`.

**6.2** Comparisons return booleans: `print(3 > 2)` gives `True`. Use `==` for equality, `<=` for less-or-equal.

**6.3** `bool(0)` is `False`, `bool(1)` is `True`. Empty string `""` is falsy; non-empty `"hello"` is truthy.

---

## General

- Save every file as `.py` and run with `python3 script_name.py`.
- Octal: `0o` (zero-oh), not `0` alone. Hex: `0x` (zero-x).
- In Python 3, `print` is a function: `print(value)`.

---

## Common errors

| Error | Check |
|-------|--------|
| **SyntaxError** | Quotes and parentheses matched? No typo in `True`/`False` (capital T/F)? |
| **NameError** | String in quotes? Number not in quotes when you want a number? |
| **Invalid octal** | Using `0` alone (e.g. `0755`) – use `0o755` in Python 3. |
