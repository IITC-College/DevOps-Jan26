# Hints – Intermediate Conditions (Input + Variables)

Use if you’re stuck. Try to write the condition logic yourself first.

---

## Part 1 – One input, variables

**1.1** `age = int(input("Enter your age: "))` then if/elif/else with age < 13, age < 20, age < 65, else. Order matters: check smallest range first (child) then teen, then adult, then senior.

**1.2** `n = float(input("Enter a number: "))` then if n > 0, elif n < 0, else (zero).

**1.3** `n = int(input("Enter a number: "))` then if n % 2 == 0 print "Even" else "Odd". Use str(n) in the message: `print(str(n) + " is Odd")`.

**1.4** `score = int(input("Enter score (0-100): "))` then if score >= 90, elif score >= 80, etc. Print score and letter in one message.

---

## Part 2 – Two inputs

**2.1** `a = int(input("First number: "))`, `b = int(input("Second number: "))`. Then if a > b print a, elif b > a print b, else "Equal".

**2.2** Read two ints. `if a > 0 and b > 0:` both positive. `elif a < 0 and b < 0:` both negative. Else mixed.

**2.3** `a = int(input(...))`, `b = int(input(...))`. Condition: `a >= 1 and a <= 10 and b >= 1 and b <= 10`.

**2.4** `user = input("Username: ")`, `pwd = input("Password: ")`. Then `if user == "admin" and pwd == "secret":` (or your chosen pair).

---

## Part 3 – and / or

**3.1** `age = int(input("Age: "))`, `answer = input("Do you have a ticket? (yes/no): ")`. Then `if age >= 18 and answer.lower() == "yes":`. Use `.lower()` so "Yes" or "YES" also match.

**3.2** `age = int(input("Age: "))`, `amount = float(input("Purchase amount: "))`. Then `if age >= 65 or amount >= 100:`.

**3.3** `a = float(input("Side a: "))`, same for b, c. Valid if: `a > 0 and b > 0 and c > 0 and a+b>c and b+c>a and a+c>b`.

**3.4** `choice = int(input("Choose 1-4: "))` then if choice == 1, elif choice == 2, elif choice == 3, elif choice == 4, else invalid.

---

## Part 4 – Nested and more logic

**4.1** `temp = float(input("Temperature: "))`, `unit = input("Unit (C/F): ")`. If unit == "C": inside that block, if temp < 0 / elif temp < 20 / else. Elif unit == "F": similar with 32 and 68. Else unknown unit.

**4.2** `year = int(input("Year: "))`. Leap: `(year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)`. Store in a variable like `is_leap = ...` then if is_leap print "Leap year" else "Not leap year".

**4.3** `a, b, c` from input. Then: if a <= b and a <= c: smallest is a. Elif b <= a and b <= c: smallest is b. Else smallest is c. Print the smallest.

**4.4** `password = input("Password: ")`, `length = len(password)`. Then if length < 6, elif length > 12, else length OK. Optionally compare password to a secret string.

---

## Part 5 – Multi-step

**5.1** `weight = float(input("Weight (kg): "))`, `height = float(input("Height (m): "))`. Then `bmi = weight / (height ** 2)`. Then if bmi < 18.5, elif bmi < 25, etc. Print bmi and category (round bmi if you like: `round(bmi, 1)`).

**5.2** `day = int(input("Day (1-7): "))`. Then if day == 1 print "Monday", elif day == 2 "Tuesday", ... else "Invalid". Or use a variable `day_name` and set it in each branch, then print once.

**5.3** `a = int(input("First: "))`, `b = int(input("Second: "))`. If a < b: print "Ascending", then print a+b. Elif a > b: print "Descending", then print a-b. Else: print "Equal", then print a*b.

---

## Reminders

- **input() returns a string.** Use `int()` or `float()` for numbers.
- **Variable for input:** `x = int(input("Prompt: "))` then use `x` in conditions.
- **and / or:** Both conditions with `and` must be true; with `or`, at least one.
- **Nested if:** Indent again inside an if block for the inner if/elif/else.

---

## Common errors

| Error | Check |
|-------|--------|
| **ValueError** | User typed non-numeric; use int()/float() only when input is numeric (or add error handling later). |
| **IndentationError** | Nested blocks need more indent. All lines in the same block must align. |
| Wrong branch runs | Order of elif matters (e.g. check score >= 90 before score >= 80). |
