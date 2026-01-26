# Quick Start Guide - Lab Automation System

## 🎯 For Instructors: Deploy a New Lab in One Command

### Prerequisites (One-Time Setup)
```bash
# 1. Install GitHub CLI (if not installed)
# Windows: winget install GitHub.cli
# Mac: brew install gh
# Linux: See https://cli.github.com/

# 2. Authenticate with GitHub
gh auth login

# 3. Make script executable (Linux/Mac)
chmod +x create_and_deploy_lab.sh
```

---

## 🚀 Deploy New Lab (Automated)

```bash
# Syntax
./create_and_deploy_lab.sh "lab_name" "Module Name" "v1.0" "Brief Description"

# Example
./create_and_deploy_lab.sh "linux_scavenger_hunt" "Linux Module" "v1.0" "File System Scavenger Hunt"
```

**What it does automatically**:
- ✅ Creates `.tar.gz` archive
- ✅ Commits to git
- ✅ Pushes to GitHub
- ✅ Creates GitHub release
- ✅ Generates student download command
- ✅ Updates documentation

**Result**: Lab ready for students in ~30 seconds!

---

## 📝 Manual Deployment (If Needed)

### Step 1: Create Archive
```bash
cd "Module Name"
tar -czf lab_name.tar.gz lab_name/
cd ..
```

### Step 2: Commit and Push
```bash
git add "Module Name/"
git commit -m "Add lab_name lab"
git push
```

### Step 3: Create Release
```bash
gh release create v1.0 \
  "Module Name/lab_name.tar.gz" \
  --title "Lab Name v1.0 - Description" \
  --notes "Lab description and instructions" \
  --repo IITC-College/DevOps-Jan26
```

### Step 4: Get Download Command
```bash
echo "curl -L https://github.com/IITC-College/DevOps-Jan26/releases/download/v1.0/lab_name.tar.gz | tar -xz && cd lab_name && cat start_here.txt"
```

---

## 📚 For Students: Download a Lab

### One-Line Download
```bash
# Example: Linux Module
curl -L https://github.com/IITC-College/DevOps-Jan26/releases/download/v1.0/linux_scavenger_hunt.tar.gz | tar -xz && cd linux_scavenger_hunt && cat start_here.txt
```

**What this does**:
1. Downloads the lab
2. Extracts all files
3. Navigates into lab directory
4. Shows starting instructions

---

## 🔍 Repository Structure

```
DevOps-Jan26/
├── README.md                     ← Start here (overview)
├── QUICK_START.md                ← You are here (quick commands)
├── LAB_WORKFLOW.md               ← Complete workflow guide
├── LAB_DESIGN_SPEC.md            ← Lab design principles
├── create_and_deploy_lab.sh      ← Automation script
│
└── [Module Name]/
    ├── [lab_name]/               ← Lab content
    │   ├── README.md
    │   ├── start_here.txt
    │   └── ...
    ├── [lab_name].tar.gz         ← Distribution file
    └── STUDENT_COMMAND.txt       ← Download command
```

---

## ⚡ Common Tasks

### Update Existing Lab
```bash
# 1. Make changes in lab directory
cd "Module Name/lab_name"
# ... edit files ...

# 2. Redeploy with new version
cd ../..
./create_and_deploy_lab.sh "lab_name" "Module Name" "v1.1" "Updated: [what changed]"
```

### Check Lab Status
```bash
# View releases
gh release list --repo IITC-College/DevOps-Jan26

# View specific release
gh release view v1.0 --repo IITC-College/DevOps-Jan26
```

### Test Download Command
```bash
# In a test directory
mkdir test && cd test
curl -L https://github.com/IITC-College/DevOps-Jan26/releases/download/v1.0/lab_name.tar.gz | tar -xz
cd lab_name
cat start_here.txt
```

---

## 🐛 Troubleshooting

### "Not authenticated with GitHub CLI"
```bash
gh auth login
# Follow prompts
```

### "Release already exists"
```bash
# Delete and recreate
gh release delete v1.0 --yes --repo IITC-College/DevOps-Jan26
# Then run deployment again
```

### "Git not in repository"
```bash
# Make sure you're in the root directory
cd /path/to/DevOps-Jan26
pwd  # Should show DevOps-Jan26 directory
```

---

## 📖 Need More Details?

- **Complete Workflow**: See [LAB_WORKFLOW.md](LAB_WORKFLOW.md)
- **Design Guide**: See [LAB_DESIGN_SPEC.md](LAB_DESIGN_SPEC.md)
- **Repository Overview**: See [README.md](README.md)

---

## 🎓 Example: Creating Your First Lab

```bash
# 1. Create lab structure
mkdir -p "New Module/my_first_lab"
cd "New Module/my_first_lab"

# 2. Create essential files
echo "Welcome to My Lab!" > start_here.txt
echo "# My First Lab" > README.md
mkdir -p clues/level1 data hidden .answers

# 3. Add content (use your editor)
# ... create clue files, data files, etc ...

# 4. Deploy (from repo root)
cd ../..
./create_and_deploy_lab.sh "my_first_lab" "New Module" "v1.0" "My First Lab"

# 5. Share with students
cat "New Module/STUDENT_COMMAND.txt"
```

---

**Quick Reference Card**:
```bash
# Deploy new lab
./create_and_deploy_lab.sh "name" "module" "v1.0" "desc"

# List releases
gh release list --repo IITC-College/DevOps-Jan26

# Delete release
gh release delete v1.0 --yes --repo IITC-College/DevOps-Jan26

# Test download
curl -L [URL] | tar -xz && cd [lab] && cat start_here.txt
```

---

**Last Updated**: 2026-01-26  
**Repository**: https://github.com/IITC-College/DevOps-Jan26
