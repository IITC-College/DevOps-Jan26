# Tasks – while Loops

Practice `while` loops: condition, counter, accumulation, and input inside a loop. Create each file, run it, and check the output.

Run scripts with: `python3 script_name.py`

---

## Task 1 – Simple while with counter (`while_count.py`)

- Create `while_count.py`.
- Assign `0` to a variable `count`. While `count < 5`, print `count`, then add 1 to `count` (e.g. `count += 1`). Run the script.

**Expected output:**
```
0
1
2
3
4
```

---

## Task 2 – Print 1 to N (`while_one_to_n.py`)

- Create `while_one_to_n.py`.
- Ask for a positive integer `n` with `input()` and convert to `int`. Use a variable `i = 1`. While `i <= n`, print `i`, then do `i += 1`. Run and enter e.g. 4.

**Expected output (if you enter 4):**
```
Enter n: 4
1
2
3
4
```

---

## Task 3 – Sum 1 to N (`while_sum.py`)

- Create `while_sum.py`.
- Read an integer `n` (e.g. 5). Use a loop: variable `i = 1`, variable `total = 0`. While `i <= n`, add `i` to `total`, then `i += 1`. After the loop, print `total` (should be 1+2+3+4+5 = 15 for n=5).

**Expected output (n = 5):**
```
Enter n: 5
15
```

---

## Task 4 – Countdown (`while_countdown.py`)

- Create `while_countdown.py`.
- Assign `5` to a variable. While it is greater than 0, print the variable, then subtract 1. After the loop print `"Done"` (or "Go!").

**Expected output:**
```
5
4
3
2
1
Done
```

---

## Task 5 – Input until valid (`while_input_valid.py`)

- Create `while_input_valid.py`.
- Ask for a number between 1 and 10. If the user enters something outside that range, ask again (use a `while` loop). When they enter a valid number, print it and exit the loop. Use a variable to store the number and another or the same for “valid” (e.g. keep looping while not valid).

**Expected output (example – user types 0, then 15, then 7):**
```
Enter a number (1-10): 0
Enter a number (1-10): 15
Enter a number (1-10): 7
You chose 7
```

---

## Task 6 – Multiply by 2 until >= 100 (`while_double.py`)

- Create `while_double.py`.
- Start with `value = 1`. While `value < 100`, print `value`, then do `value *= 2`. After the loop print the final value. Run and see 1, 2, 4, 8, 16, 32, 64 then exit.

**Expected output:**
```
1
2
4
8
16
32
64
128
```

---

## Task 7 – Sum of entered numbers (stop at 0) (`while_sum_input.py`)

- Create `while_sum_input.py`.
- Use a variable `total = 0`. In a loop, read a number with `input()` (convert to int). If the number is 0, break out of the loop (or use `while True` and break when 0). Otherwise add it to `total`. After the loop print the total. Test by entering e.g. 10, 20, 30, 0.

**Expected output (example – 10, 20, 30, 0):**
```
Enter a number (0 to stop): 10
Enter a number (0 to stop): 20
Enter a number (0 to stop): 30
Enter a number (0 to stop): 0
Total: 60
```

---

## Task 8 – Print even numbers up to N (`while_evens.py`)

- Create `while_evens.py`.
- Read an integer `n`. Use a variable `i = 0` (or 2). While `i <= n`, if `i` is even (e.g. `i % 2 == 0`), print `i`. Then `i += 1`. Run with n=8 to get 0, 2, 4, 6, 8 (or 2, 4, 6, 8 if you start at 2 and go by 2).

**Expected output (n = 8, evens 0 to 8):**
```
Enter n: 8
0
2
4
6
8
```

---

## Task 9 – Reverse countdown with input (`while_countdown_input.py`)

- Create `while_countdown_input.py`.
- Read a positive integer `n`. Use a variable equal to `n`. While it is >= 0, print it, then subtract 1. So for n=3 you get 3, 2, 1, 0. After the loop print "Done".

**Expected output (n = 3):**
```
Start from: 3
3
2
1
0
Done
```

---

## Task 10 – Loop until user says "quit" (`while_quit.py`)

- Create `while_quit.py`.
- Use a variable `word = ""`. While `word` is not equal to `"quit"` (or `"exit"`), ask for a word with `input()`, store in `word`, and if it’s not "quit" print something like "You said: ...". When the user types "quit", exit the loop and print "Bye".

**Expected output (example – user types hello, then bye, then quit):**
```
Enter a word (quit to exit): hello
You said: hello
Enter a word (quit to exit): bye
You said: bye
Enter a word (quit to exit): quit
Bye
```

---

## Done

You’ve used: `while` with a counter, with input, accumulation (sum), countdown, doubling, validation loop, and loop until a sentinel value ("quit" or 0).
