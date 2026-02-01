#!/bin/bash
################################################################################
# Setup Environment Script for Lab 8: Ownership and Groups
#
# This script prepares the lab environment by:
# - Creating demo users and groups
# - Setting up file ownership for exercises
# - Ensuring all files have correct permissions
#
# This script MUST be run by the instructor with sudo before students start.
#
# Usage: sudo ./setup_environment.sh
################################################################################

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Setting up Lab 8: Ownership and Groups             ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if running with sudo
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}[ERROR]${NC} Please run this script with sudo:"
    echo "  sudo ./setup_environment.sh"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Identify the student user (who ran sudo)
STUDENT_USER="${SUDO_USER:-$(whoami)}"

# If somehow we're running as root directly, try to get a user
if [ "$STUDENT_USER" = "root" ]; then
    echo -e "${YELLOW}[WARN]${NC} Running as root directly. Please run with: sudo -u <student_user> ./setup_environment.sh"
    echo "Or specify student username: STUDENT_USER=<username> sudo ./setup_environment.sh"
    read -p "Enter student username (or press Enter to use 'student'): " input_user
    STUDENT_USER="${input_user:-student}"
fi

echo -e "${GREEN}[INFO]${NC} Student user: ${STUDENT_USER}"
echo ""

################################################################################
# Step 0: Create directory structure and ensure lab files exist (if missing)
################################################################################

echo -e "${GREEN}[STEP 0]${NC} Creating directory structure and ensuring lab files exist..."

mkdir -p data/files data/secrets
mkdir -p projects/web_app projects/database projects/shared_team
mkdir -p clues/level1 clues/level2 clues/level3
mkdir -p scripts

touch data/files/root_file.txt data/files/user_file.txt data/files/group_file.txt
touch data/secrets/tips.txt
touch projects/web_app/config.json projects/web_app/deploy.sh projects/web_app/README.md
touch projects/database/backup.sql projects/database/config.conf
touch projects/shared_team/team_notes.txt projects/shared_team/project_plan.md
touch scripts/check_owner.sh scripts/test_access.sh
touch clues/level1/clue1.txt clues/level1/clue2.txt clues/level1/clue3.txt
touch clues/level2/clue1.txt clues/level2/clue2.txt clues/level2/clue3.txt
touch clues/level3/clue1.txt clues/level3/clue2.txt clues/level3/clue3.txt
touch README.md start_here.txt

echo -e "  ${GREEN}✓${NC} Directories and files ready"

################################################################################
# Step 1: Create developers group
################################################################################

echo -e "${GREEN}[STEP 1]${NC} Creating developers group..."

if getent group developers > /dev/null 2>&1; then
    echo -e "  ${BLUE}✓${NC} Group 'developers' already exists"
else
    groupadd developers
    echo -e "  ${GREEN}✓${NC} Group 'developers' created"
fi

################################################################################
# Step 2: Add student user to developers group
################################################################################

echo -e "${GREEN}[STEP 2]${NC} Adding student user to developers group..."

# Check if user exists
if ! id "$STUDENT_USER" &>/dev/null; then
    echo -e "  ${YELLOW}[WARN]${NC} User '$STUDENT_USER' does not exist. Creating user..."
    useradd -m -s /bin/bash "$STUDENT_USER" 2>/dev/null || {
        echo -e "  ${RED}[ERROR]${NC} Failed to create user '$STUDENT_USER'"
        echo "  Please create the user manually or specify a different username"
        exit 1
    }
    echo -e "  ${GREEN}✓${NC} User '$STUDENT_USER' created"
fi

# Check if user is already in developers group
if id -nG "$STUDENT_USER" | grep -qw developers; then
    echo -e "  ${BLUE}✓${NC} User '$STUDENT_USER' is already in 'developers' group"
else
    usermod -aG developers "$STUDENT_USER"
    echo -e "  ${GREEN}✓${NC} User '$STUDENT_USER' added to 'developers' group"
    echo -e "  ${YELLOW}[NOTE]${NC} User may need to log out and back in for group changes to take effect"
fi

################################################################################
# Step 3: Verify service users exist
################################################################################

echo -e "${GREEN}[STEP 3]${NC} Verifying service users..."

# Check for www-data
if id www-data &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} User 'www-data' exists"
else
    echo -e "  ${YELLOW}[WARN]${NC} User 'www-data' does not exist"
    echo "  This is common on non-Debian/Ubuntu systems"
    echo "  Creating www-data user and group..."
    useradd -r -s /bin/false www-data 2>/dev/null || {
        echo -e "  ${YELLOW}[WARN]${NC} Could not create www-data. Lab exercises may need adjustment."
    }
fi

# Check for mysql
if id mysql &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} User 'mysql' exists"
else
    echo -e "  ${YELLOW}[WARN]${NC} User 'mysql' does not exist"
    echo "  This is normal if MySQL/MariaDB is not installed"
    echo "  Creating mysql user and group..."
    useradd -r -s /bin/false mysql 2>/dev/null || {
        echo -e "  ${YELLOW}[WARN]${NC} Could not create mysql. Lab exercises may need adjustment."
    }
fi

################################################################################
# Step 4: Set file ownership and permissions
################################################################################

echo ""
echo -e "${GREEN}[STEP 4]${NC} Setting file ownership and permissions..."

# data/files/ directory
echo "  Setting ownership for data/files/..."

if [ -f "data/files/root_file.txt" ]; then
    chown root:root data/files/root_file.txt
    chmod 600 data/files/root_file.txt
    echo -e "    ${GREEN}✓${NC} root_file.txt → root:root (600)"
fi

if [ -f "data/files/user_file.txt" ]; then
    chown "$STUDENT_USER:$STUDENT_USER" data/files/user_file.txt
    chmod 644 data/files/user_file.txt
    echo -e "    ${GREEN}✓${NC} user_file.txt → $STUDENT_USER:$STUDENT_USER (644)"
fi

if [ -f "data/files/group_file.txt" ]; then
    chown "$STUDENT_USER:developers" data/files/group_file.txt
    chmod 664 data/files/group_file.txt
    echo -e "    ${GREEN}✓${NC} group_file.txt → $STUDENT_USER:developers (664)"
fi

# projects/web_app/ directory
echo "  Setting ownership for projects/web_app/..."

if [ -f "projects/web_app/config.json" ]; then
    chown www-data:www-data projects/web_app/config.json
    chmod 644 projects/web_app/config.json
    echo -e "    ${GREEN}✓${NC} config.json → www-data:www-data (644)"
fi

if [ -f "projects/web_app/deploy.sh" ]; then
    chown www-data:www-data projects/web_app/deploy.sh
    chmod 755 projects/web_app/deploy.sh
    echo -e "    ${GREEN}✓${NC} deploy.sh → www-data:www-data (755)"
fi

if [ -f "projects/web_app/README.md" ]; then
    chown www-data:www-data projects/web_app/README.md
    chmod 644 projects/web_app/README.md
    echo -e "    ${GREEN}✓${NC} README.md → www-data:www-data (644)"
fi

# projects/database/ directory
echo "  Setting ownership for projects/database/..."

if [ -f "projects/database/backup.sql" ]; then
    chown mysql:mysql projects/database/backup.sql
    chmod 640 projects/database/backup.sql
    echo -e "    ${GREEN}✓${NC} backup.sql → mysql:mysql (640)"
fi

if [ -f "projects/database/config.conf" ]; then
    chown mysql:mysql projects/database/config.conf
    chmod 600 projects/database/config.conf
    echo -e "    ${GREEN}✓${NC} config.conf → mysql:mysql (600)"
fi

# projects/shared_team/ directory
echo "  Setting ownership for projects/shared_team/..."

if [ -f "projects/shared_team/team_notes.txt" ]; then
    chown "$STUDENT_USER:developers" projects/shared_team/team_notes.txt
    chmod 664 projects/shared_team/team_notes.txt
    echo -e "    ${GREEN}✓${NC} team_notes.txt → $STUDENT_USER:developers (664)"
fi

if [ -f "projects/shared_team/project_plan.md" ]; then
    chown "$STUDENT_USER:developers" projects/shared_team/project_plan.md
    chmod 664 projects/shared_team/project_plan.md
    echo -e "    ${GREEN}✓${NC} project_plan.md → $STUDENT_USER:developers (664)"
fi

# Set permissions for other files
echo "  Setting permissions for other files..."

# Clue files (readable by all)
find clues -type f -name "*.txt" -exec chmod 644 {} \; 2>/dev/null || true

# Documentation
chmod 644 README.md 2>/dev/null || true
chmod 644 start_here.txt 2>/dev/null || true

# Scripts (owned by root so Level 2 clue 3 chown exercise has clear before/after)
if [ -f "scripts/check_owner.sh" ]; then
    chown root:root scripts/check_owner.sh
    chmod 755 scripts/check_owner.sh
fi
if [ -f "scripts/test_access.sh" ]; then
    chown root:root scripts/test_access.sh
    chmod 755 scripts/test_access.sh
fi

# Secrets
if [ -f "data/secrets/tips.txt" ]; then
    chmod 644 data/secrets/tips.txt
fi

################################################################################
# Summary
################################################################################

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  Environment Setup Complete!                          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Summary:${NC}"
echo "  • Group 'developers' created/verified"
echo "  • User '$STUDENT_USER' added to 'developers' group"
echo "  • Service users (www-data, mysql) verified/created"
echo "  • File ownership configured for all exercises"
echo ""
echo -e "${YELLOW}Important Notes:${NC}"
echo "  1. Student user '$STUDENT_USER' may need to log out and back in"
echo "     for group membership to take effect (or run: newgrp developers)"
echo ""
echo "  2. To verify group membership, student should run:"
echo "     groups"
echo ""
echo "  3. If www-data or mysql users were created, they are system users"
echo "     (no login shell) which is correct for service accounts"
echo ""
echo -e "${GREEN}Lab is ready for students!${NC}"
echo ""