# Linux Lab - Debug Mindset: 4-Step Debug Flow

Welcome to your Linux debugging methodology lab!

## Installation Instructions

### Method 1: Download with curl (Recommended)

```bash
curl -L -o lab.tar.gz https://github.com/IITC-College/DevOps-Jan26/releases/download/v2.9/linux_lab11_debug_mindset.tar.gz
tar -xzf lab.tar.gz
cd linux_lab11_debug_mindset
```

> **Note:** If you get "not in gzip format" or a tiny download, the release may not exist or the repo may be private. Use `gh release download v2.9 --pattern 'linux_lab11_debug_mindset.tar.gz' --repo IITC-College/DevOps-Jan26` (after `gh auth login`) or ask the instructor.

## Instructor Setup (Required Before Lab)

**IMPORTANT**: Before students start, run:

```bash
sudo ./setup_lab.sh
```

This script creates the lab structure (if missing) and sets up deliberately broken scenarios: read failure, script without execute, directory without write, ownership mismatch (root), hidden file, and mixed issues. Students use the 4-step process to fix them.

## Lab Objective

Learn a systematic way to debug Linux problems:

- **4 steps**: OBSERVE (the error) → INSPECT (pwd, ls -l, whoami) → DIAGNOSE (root cause) → RESOLVE (fix, verify)
- **Evidence-based**: Decide from inspection, not guessing
- **Fix root causes**: Not workarounds

## Important: What This Lab IS

- ✅ Systematic debugging (4 steps on every problem)
- ✅ Reading error messages and gathering evidence
- ✅ Fixing root causes with chmod, chown, correct paths

## Important: What This Lab Is NOT

- ❌ Trying random commands until something works
- ❌ Guessing; use the 4 steps

## How to Start?

1. Open `start_here.txt`
2. Follow the instructions
3. Go to clues/level1 and work through each clue in order

```bash
cat start_here.txt
```

## Exercise List

### Level 1: Single-Issue Debugging
- Exercise 1: Permission denied on file read
- Exercise 2: Script won't execute
- Exercise 3: Can't create file in directory

### Level 2: Ownership and Path Issues
- Exercise 1: Ownership mismatch
- Exercise 2: Lost in wrong directory
- Exercise 3: Hidden file access

### Level 3: Complex Scenarios
- Exercise 1: Chain of issues (fix multiple problems in sequence)
- Exercise 2: Nested directory permissions
- Exercise 3: Complete debug challenge (fix everything in scenario6)

## Commands You'll Use

- **INSPECT**: pwd, ls -l, ls -la, ls -ld, whoami, id, file &lt;name&gt;
- **RESOLVE**: chmod, sudo chown, cd (correct path)

## Important Tips

1. Follow the 4 steps on every problem
2. OBSERVE first – read the error
3. INSPECT second – gather evidence before changing anything
4. RESOLVE last – fix, then verify

## Safety Rules

- Work in the lab directory only
- Use the 4 steps; don't guess
- Verify each fix (try the command again)

## Lab Submission

Create `my_answers.txt` in the lab directory. For each exercise (or in the final challenge), note what you OBSERVED, INSPECTED, DIAGNOSED, and how you RESOLVED. Add a short reflection on the 4-step process.

## Help

If you get stuck: re-read the current clue; use pwd and ls -l to see where you are and what permissions things have; follow the 4 steps. Optional reference: `data/logs/debug_methodology.txt` and `data/secrets/tips.txt`.

## Good Luck!

Use the 4 steps on every problem: OBSERVE → INSPECT → DIAGNOSE → RESOLVE.

---

**Linux Course - Day 2**  
**Debug Mindset: 4-Step Debug Flow Lab**  
**Version**: v2.9
