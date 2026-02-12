# Hints – input() and Using What You’ve Learned

Use if you’re stuck.

---

## Part 1 – Basics

**1.1** `name = input()` then `print(name)`. The script waits until you press Enter.

**1.2** `city = input("Enter your city: ")` then e.g. `print("City:", city)` or `print("City", city, sep=": ")`.

**1.3** `first = input("First name: ")`, `last = input("Last name: ")`, then e.g. `print("Hello,", first, last)` or use `sep=" "`.

---

## Part 2 – Types

**2.1** `input()` always returns a string. `print(x + x)` with `x = "5"` gives `"55"`.

**2.2** `s = input("Enter a number: ")`, `n = int(s)`, then `print(n + 10)`. You can also do `n = int(input("Enter a number: "))`.

**2.3** `s = input("Enter a number: ")`, `x = float(s)`, then `print(x * 2)`.

---

## Part 3 – Variables and operators

**3.1** Read two strings, convert both: `a = int(input("First number: "))`, `b = int(input("Second number: "))`, then `print(a + b)`.

**3.2** `n = int(input("Enter a number: "))`, then print `n`, `n + 5`, `n * 2` (or use a variable and `+=`, `*=`).

**3.3** Two numbers, then `print(a + b)`, `print(a - b)`, `print(a * b)`, `print(a / b)` (use variables).

---

## Part 4 – Print and comments

**4.1** `age = input("Enter your age: ")` then `print("Age", age, sep=": ")`.

**4.2** `name = input("Name: ")`, `age = input("Age: ")`, then one line: `print("Name:", name, ", Age:", age, sep="")` or `print("Name:", name, "Age:", age, sep=": ")` — adjust to get "Name: Alice, Age: 20".

**4.3** Top: `# Adds 1 to the number you enter.` Then read, convert to int, store, print variable + 1.

---

## Part 5 – Practical

**5.1** `price = float(input("Price: "))`, `quantity = int(input("Quantity: "))`, then `total = price * quantity`, `print("Total:", total)`.

**5.2** `a = int(input("Dividend: "))`, `b = int(input("Divisor: "))`, then `print("Remainder:", a % b)`.

**5.3** `name = input("Your name: ")`, `num = input("Your number: ")` (or convert to int if you want). Then one print: `print("Hello,", name, "! Your number is", num, ".")` — watch spaces, or use `sep=""` and add spaces inside strings.

---

## Common errors

| Error | Check |
|-------|--------|
| **ValueError: invalid literal for int()** | User typed something that isn’t an integer (e.g. "abc" or "3.5"). Use a number or add error handling later. |
| **ValueError** for float() | Same idea: input must look like a number. |
| **TypeError** (e.g. str + int) | You didn’t convert: `input()` returns a string. Use `int()` or `float()` before doing math. |
| Script “does nothing” | It’s waiting for input. Type in the terminal and press Enter. |

---

## Reminder

- `input()` returns a **string**. For math, use `int()` or `float()`.
- You can nest: `n = int(input("Number: "))` to read and convert in one line.
