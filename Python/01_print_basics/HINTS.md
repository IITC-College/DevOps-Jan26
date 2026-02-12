# Hints – Print, sep, and end

Use these hints if you get stuck. They guide you without giving the full solution.

---

## Task 1 – Welcome script

- **Create/run:** Create `welcome.py` in the lab folder. Run with: `python3 welcome.py` (or `python welcome.py` on some Windows setups).
- **Syntax:** `print("Welcome to Python!")` — the message must be in quotes.
- **Shebang:** The first line can be `#!/usr/bin/env python3`; it tells the system which interpreter to use if you run `./welcome.py` on Linux/Mac.

---

## Task 2 – sep

- **Multiple arguments:** `print("Alice", ",", "Smith")` — by default Python puts a space between each argument. To remove spaces, add `sep=""` so the call becomes `print("Alice", ",", "Smith", sep="")`.
- **Named parameter:** `sep` is a *keyword* argument: `print("Python", "is", "fun", sep="-")`. The order is: positional arguments first, then `sep=...`.

---

## Task 3 – end

- **No newline:** `print("Loading", end="")` — the default for `end` is `"\n"`. Using `end=""` means “print nothing after the last argument,” so the next `print()` continues on the same line.
- **Space instead of newline:** `print("Hello", end=" ")` then `print("World")` — the first line ends with a space, so “World” appears on the same line.

---

## Task 4 – sep and end together

- **Both in one call:** You can use both: `print("Name", "Alice", sep=": ", end="\n")`. Here `sep` goes between "Name" and "Alice"; `end` is what comes after "Alice".
- **Period at end:** Use `end=".\n"` to print a period and then a newline.

---

## Task 5 – Status line

- **Header:** One way: `print("[STATUS]", "System ready.", sep=" ")`. You can also use a single string: `print("[STATUS] System ready.")`.
- **Key-value:** Same idea as Task 4: `print("Time", "14:30", sep=": ")`.

---

## General tips

- **Editor:** Use any text editor; save files with a `.py` extension. Avoid rich-text editors that might add formatting.
- **Running:** From the folder containing your script, run `python3 script_name.py`. If you get “command not found,” try `python script_name.py`.
- **Quotes:** Use either single `'...'` or double `"..."` for strings; be consistent.

---

## Common errors

| Error | What to check |
|-------|----------------|
| **SyntaxError** (e.g. invalid syntax) | Missing or extra quotes, commas, or parentheses in `print(...)`. |
| **NameError: name 'X' is not defined** | You used a word without quotes; if it’s text, put it in quotes so it’s a string. |
| **IndentationError** | Python is sensitive to indentation; don’t mix tabs and spaces. Use spaces (e.g. 4) for consistency. |
| **Nothing happens / wrong output** | Confirm you saved the file and are running the correct file. Check that `sep` and `end` are spelled correctly and passed as keyword arguments. |
