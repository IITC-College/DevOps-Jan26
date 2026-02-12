# Tasks – if, elif, else (Conditions)

Practice conditional execution with `if`, `elif`, and `else`. Create each file, run it, and check the output. Change values to see different branches when you want.

Run scripts with: `python3 script_name.py`

---

## Part 1 – if only

### Task 1.1 – Simple if (`if_basic.py`)

- Create `if_basic.py`.
- Assign `True` to a variable (e.g. `ok = True`). Write `if ok:` and in the body (indented) print `"Yes"`. Run the script.

**Expected output:**
```
Yes
```

---

### Task 1.2 – if with comparison (`if_compare.py`)

- Create `if_compare.py`.
- Use `if 5 > 3:` and in the body print a message (e.g. `"Five is greater than three"`). Run the script.

**Expected output (example):**
```
Five is greater than three
```

---

### Task 1.3 – if with variable (`if_var.py`)

- Create `if_var.py`.
- Assign `10` to `x`. Write `if x > 5:` and in the body print `"x is greater than 5"`. Run the script. Then change `x` to `3`, run again; there should be no output.

**Expected output (with x = 10):**
```
x is greater than 5
```

---

## Part 2 – if / else

### Task 2.1 – if else two branches (`if_else_basic.py`)

- Create `if_else_basic.py`.
- Assign `7` to `n`. If `n % 2 == 0`, print `"Even"`. Else print `"Odd"`. Run with 7 (Odd), then try with 8 (Even).

**Expected output (n = 7):**
```
Odd
```

---

### Task 2.2 – if else with comparison (`if_else_compare.py`)

- Create `if_else_compare.py`.
- Assign `15` to `age`. If `age >= 18` print `"Adult"`, else print `"Minor"`. Run and verify. Change `age` to `12` and run again.

**Expected output (age = 15):**
```
Minor
```

---

### Task 2.3 – if else and input (optional) (`if_else_input.py`)

- Create `if_else_input.py`.
- Read one integer with `input()` (and `int()`). If it is positive (e.g. `> 0`) print `"Positive"`, else print `"Not positive"`. Run and type a number.

**Expected output (example – type -3):**
```
Not positive
```

---

## Part 3 – if / elif / else

### Task 3.1 – Three branches (`if_elif_else.py`)

- Create `if_elif_else.py`.
- Assign a number to a variable (e.g. `score = 85`). If `score >= 90` print `"A"`, elif `score >= 70` print `"B"`, else print `"C"`. Run and try different values (e.g. 95, 75, 50).

**Expected output (score = 85):**
```
B
```

---

### Task 3.2 – elif chain (`if_elif_chain.py`)

- Create `if_elif_chain.py`.
- Assign `3` to `n`. If `n == 1` print `"One"`, elif `n == 2` print `"Two"`, elif `n == 3` print `"Three"`, else print `"Other"`. Run. Then change `n` to 2, then to 5, and run again.

**Expected output (n = 3):**
```
Three
```

---

### Task 3.3 – Ranges with elif (`if_elif_ranges.py`)

- Create `if_elif_ranges.py`.
- Use a variable (e.g. `temp = 25`). If `temp < 0` print `"Freezing"`, elif `temp < 20` print `"Cold"`, elif `temp < 30` print `"Warm"`, else print `"Hot"`. Run with different temps.

**Expected output (temp = 25):**
```
Warm
```

---

## Part 4 – Nested and combined

### Task 4.1 – Nested if (`if_nested.py`)

- Create `if_nested.py`.
- Assign `x = 10` and `y = 5`. If `x > 5`: inside that block, if `y > 0` print `"Both positive"`, else print `"x positive, y not"`. Else (outer): print `"x not greater than 5"`. Run and check.

**Expected output:**
```
Both positive
```

---

### Task 4.2 – if with str comparison (`if_string.py`)

- Create `if_string.py`.
- Assign `name = "Alice"`. If `name == "Alice"` print `"Hello, Alice"`, else print `"Hello, stranger"`. Run. Change `name` to `"Bob"` and run again.

**Expected output (name = "Alice"):**
```
Hello, Alice
```

---

### Task 4.3 – Multiple conditions (and) (`if_and.py`)

- Create `if_and.py`.
- Assign `age = 25` and `has_ticket = True`. If `age >= 18 and has_ticket` print `"Allowed"`, else print `"Not allowed"`. Run. Try `has_ticket = False` and see the else branch.

**Expected output (age 25, has_ticket True):**
```
Allowed
```

---

## Done

You’ve used: `if`, `else`, `elif`, indentation for blocks, comparisons and variables in conditions, and (in one task) `and`. Next step: more on `and`/`or`/`not` in a later lab if needed.
