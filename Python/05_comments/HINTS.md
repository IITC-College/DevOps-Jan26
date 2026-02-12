# Hints – Comments in Python

Use if you’re stuck.

---

**1** Any line (or part of a line) starting with `#` is a comment. Put `# This script prints a greeting.` on its own line, then `print("Hello")` below.

**2** After a line of code you can add a space and `#` and text. Example: `print("Hi")  # say hi`. Everything from `#` to the end of the line is ignored.

**3** Several lines each starting with `#`, then one real line like `print("Ready.")`.

**4** If you write `# print("skipped")`, that line does not run. Next line: `print("running")` with no `#`.

**5** At the very top of the file put `"""This script says done."""` then on the next line `print("Done")`. A string by itself (e.g. a docstring) at the top is not printed.

**6** Start with `"""` then type two or three lines of text then `"""` on the same or next line. Then `print("OK")`. The triple-quoted block is just a string; Python doesn’t print it unless you pass it to `print()`.

**7** e.g. `# Prints the value of x` then `x = 42  # the answer` then `print(x)`.

**8** First version: `# print(2 + 2)` → no output. Second version: remove `#` so you have `print(2 + 2)` → output `4`.

---

## Summary

- **Single-line:** `#` — everything from `#` to the end of that line is a comment.
- **Multi-line / docstring:** `"""..."""` or `'''...'''` — often used at the top of a file or after `def`; if it’s just a string by itself, it doesn’t run as code and isn’t printed unless you `print` it.

---

## Common mistakes

- Putting `#` inside a string: `print("Hello # world")` — the `#` is printed because it’s inside quotes.
- Forgetting to close `"""` — the rest of the file can be treated as one long string and cause odd errors.
