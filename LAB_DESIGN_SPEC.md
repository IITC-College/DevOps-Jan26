# Lab Design Specification - File System Scavenger Hunt

## Purpose
This document defines the structure and design principles for creating interactive Linux CLI labs. Use this as a template for future lab development.

---

## Core Design Principles

### 1. Progressive Learning
- Start simple, gradually increase complexity
- Each level builds on previous skills
- Clear progression: Basic → Intermediate → Advanced

### 2. Learning by Doing
- All knowledge comes from exploration, not lectures
- Clues guide but don't give direct answers
- Students must use commands to discover information

### 3. Real-World Simulation
- Use realistic file structures (projects, logs, configs)
- Authentic scenarios (system logs, application files)
- Professional naming conventions

### 4. Hidden Information Pattern
- Information scattered across multiple files
- Students must combine clues from different sources
- Final challenge requires synthesizing all learned skills

---

## Lab Structure Template

```
lab_name/
├── README.md                  # Entry instructions (must include direct entry: cd clues/level1 && cat clue1.txt)
│
├── clues/                     # Guided challenges
│   ├── level1/               # Basic commands (nav, read)
│   │   ├── clue1.txt
│   │   ├── clue2.txt
│   │   └── clue3.txt
│   ├── level2/               # Intermediate (search, manage)
│   │   └── ...
│   └── level3/               # Advanced (combine skills)
│       └── ...
│
├── data/                      # Information sources
│   ├── logs/                 # System/app logs
│   ├── archives/             # Historical data
│   └── secrets/              # Hidden information
│
├── projects/                  # Realistic directories
│   ├── project_alpha/        # Different tech stacks
│   ├── project_beta/         # Various file types
│   └── project_gamma/        # Real configs
│
├── hidden/                    # Hidden files practice
│   └── .hidden_files
│
└── .answers/                  # Instructor solutions
    └── solutions.txt
```

---

## Entry Point and Navigation

### Entry Point: Direct Entry at First Clue

- Labs **do not use start_here.txt**. Students start directly at the first clue.
- The README **must** contain the direct entry command so students can begin immediately:
  ```bash
  cd clues/level1 && cat clue1.txt
  ```
- After extracting the lab, students run that command (or navigate to `clues/level1` and run `cat clue1.txt`).

### Navigation Standardization

**Critical**: Every clue must end with an explicit "Next Step" so students always know where to go.

- **End of each clue**: Include a clear "NEXT STEP" section.
- **Template format**:

```
================================================================================
    NEXT STEP
================================================================================

Once completed, proceed to:
    cat clue2.txt

(If you are in clues/level1/, the next clue is in the same folder.)
================================================================================
```

- **For the last clue in a level** (e.g., clue3.txt in level1):

```
================================================================================
    NEXT STEP
================================================================================

Congratulations! You've completed Level 1!
Proceed to Level 2:
    cd ../level2
    cat clue1.txt

================================================================================
```

- **For the final clue in the lab** (level3/clue3.txt): Congratulate and state that the lab is complete; no further navigation.

### Labs with Setup Scripts

Some labs (e.g., networking, services, processes) use scripts to create controlled lab environments. These can be:
- **Per-clue setup/cleanup** (recommended for process/service labs)
- **Per-level setup** (for simpler labs)
- **One-time setup** (for static environments)

#### Per-Clue Setup/Cleanup Pattern (Recommended for Dynamic Labs)

For labs with dummy processes or changing system states:

**Structure**:
- `scripts/setup_X_Y.sh` - Starts processes/services for clue X-Y
- `scripts/cleanup_X_Y.sh` - Stops processes/services for clue X-Y
- Each clue is isolated with its own PID files (e.g., `.lab_pids_1_1`)

**Benefits**:
- Clues are isolated (no interference between exercises)
- Students can skip clues or repeat them
- Clean state for each exercise
- No processes running when not needed

**Clue Template**:
```
================================================================================
                    LEVEL X - CLUE Y
                    [Clue Title]
================================================================================

* SETUP: Run first (from this folder):  ../../scripts/setup_X_Y.sh

--------------------------------------------------------------------------------
WHAT YOU'RE DOING
--------------------------------------------------------------------------------
[Brief context - what concept/skill this clue teaches, 2-3 sentences max]

--------------------------------------------------------------------------------
INSTRUCTIONS
--------------------------------------------------------------------------------
1. [Task-oriented instruction]. Hint: [command or approach].

2. [Next step]. Hint: [specific command to try].

3. [Final step - usually document findings].

--------------------------------------------------------------------------------
CLEANUP (run when done with this clue):  ../../scripts/cleanup_X_Y.sh
--------------------------------------------------------------------------------
    NEXT STEP:  cat clue2.txt  (or cd ../level2 then cat clue1.txt)
================================================================================
```

**Critical Rules**:
- All script paths must be **relative to clue location** (`../../scripts/` from `clues/levelX/`)
- Setup scripts must be **idempotent** (safe to run multiple times)
- Cleanup scripts must **gracefully handle missing PIDs** (already stopped)
- Each clue uses **unique PID files** (`.lab_pids_X_Y`) for isolation

#### Creating Safe Dummy Processes

For labs that need background processes (CPU/RAM eaters, services):

**CPU-Intensive Process** (throttled to prevent system overload):
```bash
#!/bin/bash
# Dummy CPU eater - throttled with sleep so system stays responsive
while true; do
  :    # busy work
  sleep 0.1   # yield briefly (prevents 100% CPU peg)
done
```

**RAM-Intensive Process** (controlled allocation):
```bash
#!/bin/bash
# Dummy RAM eater - allocates fixed amount, then sleeps
LAB_RAM_CHARS=10000000   # ~10MB (safe for low-RAM VMs)
s=$(printf '%*s' "$LAB_RAM_CHARS" '')
while true; do
  sleep 9999
done
```

**Safety Guidelines**:
- CPU eaters: Always include `sleep 0.1` or similar to prevent 100% pegging
- RAM eaters: Use fixed, small allocations (~10MB) for VM compatibility
- All processes: Must be easy to identify (use descriptive names like `dummy_cpu_eater.sh`)
- Cleanup: Provide reliable stop mechanism (PID files + kill)

---

## File Naming Conventions

### Clue Files
- Format: `clueN.txt` where N is sequential
- Each clue = one focused task
- 3 clues per level (standard)

### Data Files
- Descriptive names: `system.log`, `application.log`
- Realistic extensions: `.log`, `.txt`, `.json`, `.yaml`
- Follow industry standards

### Hidden Files
- Start with dot: `.hidden_info.txt`
- Use in projects and dedicated `hidden/` folder
- Teach real Linux behavior

---

## Content Design Patterns

### Pattern 1: Treasure Hunt
```
Clue → Location → Information → Next Clue
```
**Example**: "Find password in system.log" → grep → password found → "Now search for code"

### Pattern 2: Assembly Challenge
```
Part1 + Part2 + Part3 + Part4 = Complete Answer
```
**Example**: Master Key split across 4 files, student combines them

### Pattern 3: Discovery Learning
```
Hint → Exploration → Discovery → Understanding
```
**Example**: "Files starting with . are hidden" → ls -a → finds files → learns concept

### Pattern 4: Progressive Skills (Per-Clue Progression)

**Critical**: Each clue must teach a **distinct skill** - avoid repetition. Example progression:

**Bad** (repetitive):
- Clue 1: Use `ps aux` to list processes
- Clue 2: Use `ps aux` to find process info
- Clue 3: Use `ps aux` to count your processes

**Good** (progressive):
- Clue 1: Basic listing (`ps`, `ps aux`) - see there are many processes
- Clue 2: Filtering by name (`ps aux | grep bash`) - find specific process
- Clue 3: Comparing ownership (`grep $USER` vs `grep root`) - understand user vs system

**Key Principle**: Each clue introduces a **new concept, tool, or technique** - build on previous skills but don't just repeat them.

---

## Command Coverage Framework

### Level 1: Foundation (30%)
**Focus**: Navigation and Reading
- `pwd`, `cd`, `ls`, `ls -la`
- `cat`, `less`
- Basic `grep` (single file)
- Basic `find` (by name)

### Level 2: Skills (40%)
**Focus**: Searching and Managing
- `grep -r`, `grep -rn`
- `find` with patterns
- `head`, `tail`
- `mkdir`, `mkdir -p`
- `cp`, `mv`

### Level 3: Mastery (30%)
**Focus**: Combining Everything
- Multiple commands in sequence
- Information synthesis
- Problem-solving without explicit instructions

---

## Information Distribution Model

### Scattered Information
- **DON'T**: Put all answers in one place
- **DO**: Distribute across multiple files and directories

### Layered Complexity
```
Layer 1: Direct (grep "word" file)
Layer 2: Search (grep -r "word" directory)
Layer 3: Combine (find + read + search + assemble)
```

### Answer Types
1. **Direct Text**: "The password is X"
2. **Code/Number**: "CODE: 1234"
3. **Hidden in Context**: Line in log file
4. **Assembly Required**: Parts from multiple files

---

## File Content Guidelines

### Log Files
- Realistic timestamps: `[YYYY-MM-DD HH:MM:SS]`
- Mix of INFO, WARNING, ERROR
- Hide clues in normal-looking entries
- 20-50 lines (readable but searchable)

### Configuration Files
- Use real formats: YAML, JSON, ENV
- Include comments with clues
- Professional structure
- Working syntax (even if not executed)

### Project Files
- Represent real tech stacks
- Multiple languages/frameworks
- README files with setup instructions
- Config files with actual parameters

---

## Challenge Design Formula

### Clue Structure (Recommended Format)

Use this structure for clear, practical clues:

```
================================================================================
                    LEVEL X - CLUE Y
                    [Clear Title - What Concept]
================================================================================

* SETUP: Run first (from this folder):  ../../scripts/setup_X_Y.sh
  (Optional - only for labs with per-clue scripts)

--------------------------------------------------------------------------------
WHAT YOU'RE DOING
--------------------------------------------------------------------------------
[2-3 sentences: the concept/skill being learned, why it matters]

--------------------------------------------------------------------------------
INSTRUCTIONS
--------------------------------------------------------------------------------
1. [Task-oriented instruction]. Hint: [command or approach].

2. [Next task]. Hint: [specific command].

3. [Final task - document or observe].

--------------------------------------------------------------------------------
CLEANUP (run when done with this clue):  ../../scripts/cleanup_X_Y.sh
(Optional - only for labs with per-clue cleanup)
--------------------------------------------------------------------------------
    NEXT STEP:  cat clue2.txt
================================================================================
```

**Content Guidelines**:
- **"WHAT YOU'RE DOING"**: Brief context (not a lecture) - why this task matters
- **"INSTRUCTIONS"**: Task-oriented (not command-only) - what to do, not just what to type
- **Hints**: Suggest commands but let students figure out exact usage
- **Balance**: Not too verbose (walls of text) or too terse (just commands)
- **Progressive**: Each clue teaches something NEW, not a repeat

---

## Difficulty Progression

### Easy (Level 1)
- Direct paths given
- Single command solves task
- Clear success indicators

### Medium (Level 2)
- Partial paths given
- 2-3 commands needed
- Some ambiguity

### Hard (Level 3)
- Minimal guidance
- Multiple steps required
- Student must plan approach

---

## Student Experience Flow

```
1. Entry: Extract lab, then cd clues/level1 && cat clue1.txt (see README)
   ↓
2. Read clue1.txt and follow instructions
   ↓
3. Complete clue1 → Read "NEXT STEP" → Go to clue2.txt
   ↓
4. Complete clue2 → Read "NEXT STEP" → Go to clue3.txt
   ↓
5. Complete clue3 → Read "NEXT STEP" → Go to level2/clue1.txt
   ↓
6. Repeat for level2, then level3
   ↓
7. Final clue: Lab complete (or create my_answers.txt per lab)
```

---

## Technical Requirements

### File Format
- Plain text only (`.txt`, `.log`, `.md`)
- UTF-8 encoding
- **Unix line endings (LF)** - CRITICAL for scripts
- No binary files

### Script Requirements (Labs with Setup/Cleanup)

**Line Endings** (critical – avoid "required file not found"):
- **Must use LF (Unix)**, not CRLF (Windows). Editing on Windows or in some editors saves CRLF; the shebang becomes `#!/bin/bash\r`, so Linux looks for `/bin/bash\r` and fails with: `cannot execute: required file not found`.
- **Fix before packaging** – run from lab root:
  ```bash
  cd scripts && for f in *.sh; do sed -i 's/\r$//' "$f"; done && cd ..
  ```
  Or fix one file: `sed -i 's/\r$//' scripts/setup_1_1.sh`. Or use `dos2unix scripts/*.sh` if available.
- **Verify**: `file scripts/setup_1_1.sh` should show "ASCII text executable" or "UTF-8 text executable" and must **not** show "with CRLF line terminators".

**Permissions**:
- All scripts must be executable: `chmod +x scripts/*.sh`
- Archive with preserved permissions: `tar --mode='a+x' -czf lab.tar.gz lab/`

**Shebang**:
- Always include: `#!/bin/bash`
- First line of every script

**Idempotency**:
- Setup scripts must be safe to run multiple times
- Check for existing state before creating (e.g., check PID file exists)
- Don't fail if already set up

**Error Handling**:
- Use `set -e` for critical scripts (exit on error)
- Provide clear error messages
- Cleanup scripts must handle missing resources gracefully

### Size Constraints
- Total lab: < 500KB
- Individual files: < 50KB
- Keep it lightweight and fast

### Compatibility
- Works on any Linux distribution
- No dependencies required (beyond standard utils)
- Pure CLI experience

---

## Distribution Model

### Archive Format
```bash
tar -czf lab_name.tar.gz lab_name/
```

### Download Pattern
```bash
curl -L URL | tar -xz
cd lab_name
cd clues/level1 && cat clue1.txt
```

### Installation Script Template
```bash
#!/bin/bash
# 1. Check prerequisites (curl, tar)
# 2. Download archive
# 3. Extract
# 4. Cleanup
# 5. Show next steps
```

---

## Instructor Materials

### Minimum Required
1. **solutions.txt** - Complete answers with locations
2. **Grading rubric** - Point distribution
3. **Expected time** - For planning

### Optional
- Setup instructions
- Common issues list
- Customization guide

---

## Quality Checklist

Before distributing a lab:

### Content Quality
- [ ] All clues are accurate and achievable
- [ ] **Each clue teaches a DISTINCT skill** (no repetition of same command/concept)
- [ ] Progressive difficulty (Level 1 simpler than Level 3)
- [ ] File paths in clues match actual structure
- [ ] All "find" targets exist
- [ ] All "grep" patterns have matches
- [ ] Hidden files are truly hidden (start with .)
- [ ] Solutions file is complete and matches clues exactly
- [ ] Clue content balanced (not too verbose, not too terse)
- [ ] "WHAT YOU'RE DOING" provides context, "INSTRUCTIONS" are task-oriented with hints

### Navigation & Flow
- [ ] **Each clue ends with a clear "NEXT STEP"** (exact command to next clue or level)
- [ ] **Navigation tested**: Each clue → next clue transition works when followed literally
- [ ] README contains the direct entry command (e.g., `cd clues/level1 && cat clue1.txt`)
- [ ] Tested end-to-end by creator (start to finish)
- [ ] Estimated completion time verified

### Scripts & Technical (for labs with setup/cleanup)
- [ ] **All scripts have Unix line endings (LF)** - not Windows CRLF
- [ ] **All scripts have execute permissions** (`chmod +x`)
- [ ] **All script paths in clues are relative to clue location** (e.g., `../../scripts/setup_X_Y.sh` from clues/levelX/)
- [ ] Setup scripts are idempotent (safe to run multiple times)
- [ ] Cleanup scripts handle missing PIDs gracefully
- [ ] Dummy processes are SAFE:
  - [ ] CPU eaters throttled with sleep (not 100% CPU peg)
  - [ ] RAM eaters use controlled amounts (~10MB max for VM compatibility)
  - [ ] Processes use unique PID files per clue (`.lab_pids_X_Y`)
- [ ] Archive created with preserved permissions: `tar --mode='a+x'`
- [ ] Scripts tested on clean Linux VM (not just dev machine)

---

## Extension Patterns

### Adding Difficulty
- More levels (level4, level5)
- Longer search paths
- More complex grep patterns
- Less explicit hints

### Adding Scope
- More file types
- Different command families
- Permissions challenges (Day 2+)
- Pipes and redirection

### Adding Context
- Story/narrative theme
- Character-based missions
- Company/project scenarios
- Time-sensitive challenges

---

## Replication Template

To create a new lab using this design:

1. **Define Learning Objectives** (Which commands?)
2. **Choose Theme** (Cybersecurity? DevOps? Data?)
3. **Create Structure** (Use template above)
4. **Write Clues** (3 per level, progressive)
5. **Create Data Files** (Logs, configs, secrets)
6. **Hide Information** (Scatter clues)
7. **Test Complete Flow** (Start to finish)
8. **Document Solutions** (Complete answers)

---

## Success Metrics

A well-designed lab should achieve:

- **80%+ completion rate** (most students finish)
- **Minimal support needed** (self-explanatory)
- **1-2 hours duration** (manageable)
- **Positive feedback** (students feel accomplished)
- **Skills transfer** (students use commands later)

---

## Summary

**Key Elements**:
- Progressive structure (3 levels)
- Scattered information (treasure hunt)
- Realistic content (professional files)
- Clear starting point (README with direct entry to first clue: `cd clues/level1 && cat clue1.txt`)
- Explicit "NEXT STEP" at end of every clue
- Script paths relative to clue location when lab uses setup scripts
- Complete solutions (for instructor)

**Core Philosophy**:
> "Students learn by doing. Give them tools, clues, and challenges - not answers."

---

**Version**: 1.1  
**Based on**: Linux Day 1 - File System Scavenger Hunt  
**Last Updated**: 2026-01-29
