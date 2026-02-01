#!/bin/bash
################################################################################
# Lab 6: Permission Encounter - Unified Setup Script
#
# Creates the full lab structure (if missing), sets all file/directory
# permissions for every lab part, and sets ownership of restricted/ to root
# so students get "Permission denied" as intended.
#
# Does NOT create users or groups. Lab works with any user: students run as
# themselves (non-root); files are root-owned and "others" permissions
# determine what students can read. Clues/solutions assume single owner (root).
#
# Run as root (sudo) before students start the lab.
#
# Usage: sudo ./setup_environment.sh
################################################################################

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Lab 6: Permission Encounter - Setup                  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}This script must be run with sudo.${NC}"
    echo "  sudo ./setup_environment.sh"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${GREEN}[1/4] Creating directory structure...${NC}"
mkdir -p data/files data/logs data/secrets
mkdir -p clues/level1 clues/level2 clues/level3
mkdir -p projects/personal_project projects/shared_project projects/team_project
mkdir -p restricted
mkdir -p .answers

echo -e "${GREEN}[2/4] Ensuring all lab files exist (touch if missing)...${NC}"
# data/
touch data/files/public_data.txt data/files/team_notes.txt data/files/private_log.txt
touch data/files/shared_report.txt data/files/readonly_archive.txt data/files/private_notes.txt
touch data/files/report.sh
touch data/logs/system.log
touch data/secrets/tips.txt
# clues
touch clues/level1/clue1.txt clues/level1/clue2.txt clues/level1/clue3.txt
touch clues/level2/clue1.txt clues/level2/clue2.txt clues/level2/clue3.txt
touch clues/level3/clue1.txt clues/level3/clue2.txt clues/level3/clue3.txt
# projects
touch projects/personal_project/my_notes.txt projects/personal_project/my_script.sh
touch projects/personal_project/README.md
touch projects/shared_project/shared_doc.txt
touch projects/team_project/config.json projects/team_project/logs.txt projects/team_project/team_script.sh
# restricted
touch restricted/admin_config.txt restricted/secret_file.txt restricted/backup.tar.gz
# root
touch README.md start_here.txt
touch .answers/solutions.txt 2>/dev/null || true

echo -e "${GREEN}[3/4] Setting directory permissions (755)...${NC}"
chmod 755 data data/files data/logs data/secrets
chmod 755 clues clues/level1 clues/level2 clues/level3
chmod 755 projects projects/personal_project projects/shared_project projects/team_project
chmod 755 restricted
chmod 755 .answers 2>/dev/null || true

echo -e "${GREEN}[4/4] Setting file permissions for all lab parts...${NC}"

# --- data/files/ (Level 1 & 2: ls -l, owners, permission strings) ---
chmod 644 data/files/public_data.txt      # rw-r--r--
chmod 664 data/files/team_notes.txt       # rw-rw-r--
chmod 600 data/files/private_log.txt      # rw-------
chmod 666 data/files/shared_report.txt    # rw-rw-rw-
chmod 444 data/files/readonly_archive.txt # r--r--r--
chmod 600 data/files/private_notes.txt    # rw-------
chmod 755 data/files/report.sh             # rwxr-xr-x

# --- data/logs/ and data/secrets/ (Level 3: detective challenge) ---
chmod 644 data/logs/system.log
chmod 644 data/secrets/tips.txt

# --- projects/personal_project/ (Level 2: decoding permissions) ---
chmod 700 projects/personal_project/my_script.sh  # rwx------
chmod 600 projects/personal_project/my_notes.txt # rw-------
chmod 644 projects/personal_project/README.md     # rw-r--r--

# --- projects/team_project/ ---
chmod 770 projects/team_project/team_script.sh   # rwxrwx---
chmod 660 projects/team_project/config.json      # rw-rw----
chmod 664 projects/team_project/logs.txt         # rw-rw-r--

# --- projects/shared_project/ ---
chmod 664 projects/shared_project/shared_doc.txt # rw-rw-r--

# --- restricted/ (Level 2 & 3: permission denied, root-only) ---
chmod 600 restricted/admin_config.txt   # rw-------
chmod 400 restricted/secret_file.txt    # r--------
chmod 600 restricted/backup.tar.gz      # rw-------
chown -R root:root restricted

# --- clues (all readable) ---
chmod 644 clues/level1/clue1.txt clues/level1/clue2.txt clues/level1/clue3.txt
chmod 644 clues/level2/clue1.txt clues/level2/clue2.txt clues/level2/clue3.txt
chmod 644 clues/level3/clue1.txt clues/level3/clue2.txt clues/level3/clue3.txt

# --- documentation ---
chmod 644 README.md start_here.txt

# --- instructor answers (readable by instructor) ---
[ -f .answers/solutions.txt ] && chmod 644 .answers/solutions.txt

echo ""
echo -e "${GREEN}✓ Setup complete.${NC}"
echo ""
echo -e "${BLUE}Summary:${NC}"
echo "  - Directories created (if missing) and set to 755"
echo "  - All lab files present and permissions set per lab design"
echo "  - restricted/ files owned by root so students get 'Permission denied'"
echo "  - Lab works with any user; no special users/groups required"
echo ""
