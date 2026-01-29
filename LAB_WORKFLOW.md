# Lab Development & Deployment Workflow

## Overview
This document describes the complete, automated workflow for creating and deploying Linux CLI labs to GitHub. Follow this process for all future labs.

---

## 📋 Prerequisites

### Required Tools
- Git installed and configured
- GitHub CLI (`gh`) installed and authenticated
- Bash shell access
- Text editor

### Repository Structure
```
DevOps-Jan26/                    ← Main repository
├── LAB_WORKFLOW.md              ← This file
├── LAB_DESIGN_SPEC.md           ← Design principles
├── create_and_deploy_lab.sh     ← Automation script
│
└── [Module Name]/               ← Module directory
    ├── [lab_name]/              ← Lab content
    ├── [lab_name].tar.gz        ← Distribution archive
    └── STUDENT_COMMAND.txt      ← Download instructions
```

---

## 🔄 Complete Workflow

### Phase 1: Design (Manual)

1. **Define Learning Objectives**
   - Which commands to teach?
   - What skills to develop?
   - Expected duration?

2. **Choose Theme & Context**
   - Real-world scenario
   - Student-relevant context
   - Engaging narrative (optional)

3. **Plan Information Distribution**
   - What information to hide?
   - Where to place clues?
   - How to combine multiple sources?

**Output**: Design notes (use `LAB_DESIGN_SPEC.md` as guide)

---

### Phase 2: Create Lab Structure (Automated)

Use the automation script or create manually:

```bash
# Manual structure creation
mkdir -p lab_name/{clues/{level1,level2,level3},data/{logs,archives,secrets},projects,hidden,.answers}
```

**Required Files**:
- `README.md` - Lab overview and instructions (must include direct entry command: `cd clues/level1 && cat clue1.txt`)
- `clues/levelN/clueN.txt` - Progressive challenges (each must end with clear "NEXT STEP")
- Data files (logs, configs, secrets)
- `.answers/solutions.txt` - Complete solutions

**Labs with setup scripts**: Place scripts in `scripts/` at lab root. In clue files, reference scripts with paths **relative to the clue location** (e.g., from `clues/level1/` use `../../scripts/setup_1_1.sh`). See `LAB_DESIGN_SPEC.md` → "Labs with Setup Scripts". **Scripts must have Unix line endings (LF)** – if edited on Windows, run `sed -i 's/\r$//' scripts/*.sh` (or the fix in Phase 5) before packaging, or students will get `cannot execute: required file not found`.

---

### Phase 3: Create Content (Manual)

#### 3.1 Write Entry Point
- Labs use **direct entry**: no start_here.txt. Students start at the first clue.
- README must contain the first command: `cd clues/level1 && cat clue1.txt`
- Students extract the lab, then run that command (or `cd clues/level1` and `cat clue1.txt`).

#### 3.1b Write Clue Navigation
- **Every clue** must end with a "NEXT STEP" section: exact command(s) to reach the next clue (e.g., `cat clue2.txt` or `cd ../level2` then `cat clue1.txt`).
- **Script paths**: If the lab has setup scripts, use paths relative to the clue directory (e.g., `sudo ../../scripts/setup_X_Y.sh` from `clues/levelX/`).

#### 3.1c Design for Progression (Not Repetition)

**Critical**: Each clue must teach a **distinct** skill. Don't repeat the same command/concept.

**Before writing clues**:
1. List the concepts/skills to teach (one per clue)
2. Ensure each is DIFFERENT
3. Plan how each builds on the previous

**Example** (Processes lab):
- Level 1, Clue 1: Basic listing → See many processes exist
- Level 1, Clue 2: Filtering → Find specific process by name
- Level 1, Clue 3: Ownership → Compare user vs system processes

**Anti-pattern** (avoid):
- Clue 1: Use ps aux
- Clue 2: Use ps aux again
- Clue 3: Use ps aux one more time

#### 3.2 Write Clues (Progressive Difficulty)

**Use this template for consistent, effective clues**:

```
================================================================================
                    LEVEL X - CLUE Y
                    [Clear Title - The Concept Being Taught]
================================================================================

* SETUP: Run first (from this folder):  ../../scripts/setup_X_Y.sh
  (Optional - only for labs with per-clue scripts)

--------------------------------------------------------------------------------
WHAT YOU'RE DOING
--------------------------------------------------------------------------------
[2-3 sentences: Brief context - what concept this teaches, why it matters.
Not a lecture - just enough context to understand the goal.]

--------------------------------------------------------------------------------
INSTRUCTIONS
--------------------------------------------------------------------------------
1. [Task-oriented instruction - WHAT to do]. Hint: [command to try].

2. [Next task]. Hint: [another command or approach].

3. [Final step - usually document findings or observations].

--------------------------------------------------------------------------------
CLEANUP (run when done with this clue):  ../../scripts/cleanup_X_Y.sh
(Optional - only for labs with per-clue cleanup)
--------------------------------------------------------------------------------
    NEXT STEP:  cat clue2.txt  (or cd ../level2 && cat clue1.txt)
================================================================================
```

**Content Balance**:
- **Not too verbose**: Avoid walls of text - students won't read them
- **Not too terse**: Don't just give commands - provide task context
- **Task-oriented**: Focus on WHAT to do, provide command hints
- **Progressive**: Each clue teaches something NEW

**Difficulty Levels**:

**Level 1** - Basic navigation and reading
```
- Clear paths provided
- Single commands
- Direct outcomes
- Heavy use of hints
```

**Level 2** - Searching and managing
```
- Partial hints
- 2-3 command sequences
- Some exploration needed
- Less hand-holding
```

**Level 3** - Synthesis and problem-solving
```
- Minimal guidance
- Multiple steps
- Combine all learned skills
- Students must plan approach
```

#### 3.3 Create Data Files

**Log Files**:
- Realistic timestamps
- Mix INFO/WARNING/ERROR
- Hide clues in normal entries
- 20-50 lines each

**Configuration Files**:
- Use real formats (YAML, JSON, ENV)
- Include comments with hints
- Professional structure

**Project Files**:
- Represent real tech stacks
- Multiple languages
- READMEs with setup info
- Working config syntax

#### 3.4 Hide Information
- Scatter clues across files
- Use hidden files (`.filename`)
- Embed in comments
- Split answers into parts

#### 3.5 Write Solutions
**File**: `.answers/solutions.txt`
- Complete answer list
- File locations
- Commands used
- Expected outputs

---

### Phase 4: Test Lab (Critical)

```bash
# Navigate to lab directory
cd lab_name

# Follow student path exactly (README direct entry)
cd clues/level1 && cat clue1.txt
# Execute each clue step-by-step
# At end of each clue, follow the "NEXT STEP" literally
# Verify all files exist
# Confirm all commands work
# Check all answers are findable
```

**Checklist**:

#### Content & Learning
- [ ] **Each clue teaches a DISTINCT concept** (not repetitive)
- [ ] All paths in clues are correct
- [ ] All grep patterns have matches
- [ ] All find targets exist
- [ ] Hidden files are properly hidden
- [ ] Solutions are complete and accurate
- [ ] Clue content balanced (not too verbose, not too terse)
- [ ] Progressive difficulty (Level 1 < Level 2 < Level 3)

#### Navigation & Flow
- [ ] End-to-end flow is smooth
- [ ] **Each clue ends with clear "NEXT STEP"** (exact command to next clue or level)
- [ ] **Navigation tested**: Each clue → next clue transition works when followed literally
- [ ] First clue is accessible via README direct entry command

#### Scripts & Technical (for labs with setup/cleanup)
- [ ] **Scripts have Unix line endings (LF)** - verified with `file script.sh` (should show "LF" not "CRLF")
- [ ] **Scripts have execute permissions** - verified with `ls -la scripts/` (should show `-rwxr-xr-x`)
- [ ] **Script paths in clues work from clue location** (e.g., `../../scripts/setup_1_1.sh` from `clues/level1/`)
- [ ] Setup scripts are idempotent (safe to run twice)
- [ ] Cleanup scripts handle missing PIDs gracefully
- [ ] **If using dummy processes**:
  - [ ] CPU eaters throttled with sleep (~0.1s) - not pegging at 100%
  - [ ] RAM eaters use small, fixed amounts (~10MB)
  - [ ] Processes easily identifiable by name
  - [ ] Each clue uses unique PID files
- [ ] Archive created with `--mode='a+x'` to preserve execute permissions
- [ ] Tested extraction and script execution on clean Linux VM

---

### Phase 5: Package Lab (Automated)

#### 5.1 Fix Script Line Endings (CRITICAL for labs with scripts)

```bash
# Navigate to lab directory
cd lab_name/scripts/

# Fix line endings (MUST be LF, not CRLF)
# Option 1: Using sed
sed -i 's/\r$//' *.sh

# Option 2: Using dos2unix (if available)
dos2unix *.sh

# Set execute permissions
chmod +x *.sh

# Verify
ls -la
```

**Why this matters**: Scripts edited on Windows (or in some editors) get CRLF line endings. The shebang is then read as `#!/bin/bash\r`, so Linux looks for an interpreter named `/bin/bash\r` and fails with **`cannot execute: required file not found`**. Always fix line endings before packaging.

#### 5.2 Create Archive with Correct Permissions

```bash
# Navigate to parent directory
cd ..

# Create archive with preserved execute permissions
tar --mode='a+x' -czf lab_name.tar.gz lab_name/

# Verify archive
tar -tzf lab_name.tar.gz | head
```

**Important**: Use `--mode='a+x'` to ensure scripts remain executable after extraction.

**Result**: `lab_name.tar.gz` ready for distribution

---

### Phase 6: Deploy to GitHub (Automated)

#### 6.1 Verify Repository Location
```bash
# CRITICAL: Must be in main repository root
cd /path/to/DevOps-Jan26

# Verify git repository
git status
git remote -v
```

#### 6.2 Add and Commit
```bash
# Add module directory
git add "Module Name/"

# Commit with descriptive message
git commit -m "Add [Lab Name] - [Brief Description]

- Progressive difficulty (3 levels)
- [Number] files
- Commands: [list key commands]
- Duration: [estimated time]"
```

#### 6.3 Push to GitHub
```bash
git push -u origin main
```

#### 6.4 Create Release
```bash
gh release create v[X.Y] \
  "Module Name/lab_name.tar.gz" \
  --title "[Lab Name] v[X.Y]" \
  --notes "Lab description here

## Download Instructions

\`\`\`bash
curl -L .../lab_name.tar.gz | tar -xz && cd lab_name && cd clues/level1 && cat clue1.txt
\`\`\`

## What's Included
- List features
- Learning objectives
- Estimated duration" \
  --repo IITC-College/DevOps-Jan26
```

---

### Phase 7: Document Distribution

Create `STUDENT_COMMAND.txt`:
```
========================================================
              Student Download Command
========================================================

Copy and paste this command:

curl -L https://github.com/IITC-College/DevOps-Jan26/releases/download/v[X.Y]/lab_name.tar.gz | tar -xz && cd lab_name && cd clues/level1 && cat clue1.txt

========================================================

Repository: https://github.com/IITC-College/DevOps-Jan26
Release: https://github.com/IITC-College/DevOps-Jan26/releases/tag/v[X.Y]

========================================================
```

---

## 🤖 Automated Workflow Script

For fully automated deployment, use:

```bash
./create_and_deploy_lab.sh "Lab Name" "Module Name" "v1.0" "Brief description"
```

This script handles:
- ✅ Archive creation
- ✅ Git add/commit/push
- ✅ GitHub release creation
- ✅ Student command generation

---

## 📝 Best Practices

### Repository Organization
```
DevOps-Jan26/
├── Linux Module/
│   ├── linux_scavenger_hunt/
│   ├── linux_scavenger_hunt.tar.gz
│   └── STUDENT_COMMAND.txt
│
├── Docker Module/
│   ├── docker_basics_lab/
│   ├── docker_basics_lab.tar.gz
│   └── STUDENT_COMMAND.txt
│
└── Kubernetes Module/
    ├── k8s_deployment_lab/
    ├── k8s_deployment_lab.tar.gz
    └── STUDENT_COMMAND.txt
```

### Version Numbering
- `v1.0` - Initial release
- `v1.1` - Minor fixes/updates
- `v2.0` - Major content changes

### Release Naming
- Format: `[Lab Name] v[X.Y] - [One-line Description]`
- Example: `Linux Lab v1.0 - File System Scavenger Hunt`

### Commit Messages
```
Add [Lab Name] - [Brief Description]

- [Number] files
- [Difficulty] levels
- Commands covered: [list]
- Estimated duration: [time]
```

---

## 🔧 Troubleshooting

### Wrong Repository Location
**Problem**: Git repository in subdirectory instead of root

**Solution**:
```bash
# Remove incorrect git repo
cd wrong_directory
rm -rf .git

# Work from correct root
cd /path/to/DevOps-Jan26
git add .
git commit -m "Your message"
git push
```

### Release Already Exists
**Problem**: Tag/release version conflict

**Solution**:
```bash
# Delete existing release
gh release delete v1.0 --yes --repo IITC-College/DevOps-Jan26

# Create new release
gh release create v1.0 [files...] --repo IITC-College/DevOps-Jan26
```

### Archive Issues
**Problem**: tar.gz doesn't extract properly

**Solution**:
```bash
# Recreate with correct options (preserve permissions)
tar --mode='a+x' -czf lab_name.tar.gz lab_name/

# Test extraction
tar -tzf lab_name.tar.gz
```

### Script Execution Errors on Linux
**Problem**: `bash: ../../scripts/setup_1_1.sh: cannot execute: required file not found` (or "bad interpreter") when students run setup/cleanup scripts.

**Root Cause**: Scripts have Windows line endings (CRLF). The shebang `#!/bin/bash` becomes `#!/bin/bash\r`, so the kernel looks for `/bin/bash\r` and fails.

**Solution**:
```bash
# Fix line endings (run from lab_name/scripts/ or lab root)
cd lab_name/scripts/
sed -i 's/\r$//' *.sh
# Or from lab root: for f in scripts/*.sh; do sed -i 's/\r$//' "$f"; done

# Set execute permissions
chmod +x *.sh

# Verify fix
file setup_1_1.sh
# Should show: "Bourne-Again shell script, ASCII text executable"
# NOT: "... with CRLF line terminators"

# Recreate archive
cd ../..
tar --mode='a+x' -czf lab_name.tar.gz lab_name/

# Update release
gh release upload tag-name lab_name.tar.gz --clobber
```

**Prevention**: Always run line-ending fix and permission check before packaging

---

## 📊 Quality Gates

Before deployment, verify:

### Content Quality
- [ ] All learning objectives covered
- [ ] Progressive difficulty maintained
- [ ] Real-world relevance
- [ ] Engaging and clear

### Technical Quality
- [ ] All files present
- [ ] Correct file structure
- [ ] Archive extracts properly
- [ ] No binary files

### Testing Quality
- [ ] End-to-end tested
- [ ] All commands work
- [ ] All answers findable
- [ ] Completion time verified

### Documentation Quality
- [ ] README.md clear and contains direct entry command (`cd clues/level1 && cat clue1.txt`)
- [ ] Solutions complete and match clues exactly
- [ ] Download command tested
- [ ] **Navigation**: Every clue has "NEXT STEP"; transitions tested
- [ ] **Script paths** (if applicable): All setup script paths in clues are relative to clue location (e.g., `../../scripts/setup_X_Y.sh`)
- [ ] **Each clue is distinct**: No repetitive content or commands

### Scripts & Packaging (if applicable)
- [ ] All scripts use Unix line endings (LF)
- [ ] All scripts have execute permissions
- [ ] Archive created with `--mode='a+x'`
- [ ] Tested on clean Linux VM (not just dev machine)
- [ ] If using dummy processes: Safe (throttled CPU, limited RAM)

---

## 🎯 Success Criteria

A successfully deployed lab should have:

1. **Clear Entry Point**: Students know where to start (README direct entry: `cd clues/level1 && cat clue1.txt`) and each clue ends with clear "NEXT STEP"
2. **Progressive Flow**: Each step builds on previous
3. **Complete Documentation**: README, solutions, commands
4. **Working Distribution**: One-command download works
5. **GitHub Integration**: Release created, file attached
6. **Student Instructions**: Clear command provided

---

## 📚 Reference Documents

- **Design Principles**: See `LAB_DESIGN_SPEC.md`
- **Automation Script**: See `create_and_deploy_lab.sh`
- **Example Lab**: See `Linux Module/linux_scavenger_hunt/`

---

## 🔄 Quick Reference

### Complete Workflow (One-liner)
```bash
# Design → Create → Test → Package → Deploy
./create_and_deploy_lab.sh "Lab Name" "Module Name" "v1.0" "Description"
```

### Manual Workflow Steps
```bash
# 1. Create structure
mkdir -p lab_name/{clues,data,projects,hidden,.answers}

# 2. Create content (manual)

# 3. Test (manual)

# 4. Package
tar -czf lab_name.tar.gz lab_name/

# 5. Deploy
cd /path/to/repo-root
git add "Module Name/"
git commit -m "Add lab"
git push
gh release create vX.Y "Module Name/lab_name.tar.gz" --title "..." --notes "..."
```

---

**Version**: 1.1  
**Created**: 2026-01-26  
**Last Updated**: 2026-01-29  
**Repository**: https://github.com/IITC-College/DevOps-Jan26
