#!/bin/bash
################################################################################
# Lab 11: Debug Mindset - Unified Setup (run once after download)
#
# This script prepares the lab by:
# - Creating directory structure and files (if missing)
# - Setting deliberately broken scenarios for students to debug
# - Setting root ownership for scenario4 (ownership mismatch exercise)
#
# Run with sudo once after extracting the lab, before reading instructions.
#
# Usage: sudo ./setup_lab.sh
################################################################################

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Lab 11: Debug Mindset - Setup                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}This script must be run with sudo (needed for scenario4 ownership).${NC}"
    echo "  sudo ./setup_lab.sh"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# --- Create structure and files (idempotent) ---
echo -e "${GREEN}[1/3]${NC} Creating directories and files (if missing)..."

mkdir -p broken_scenarios/scenario1_read_failure broken_scenarios/scenario2_script_broken
mkdir -p broken_scenarios/scenario3_cant_write broken_scenarios/scenario4_ownership_mess
mkdir -p broken_scenarios/scenario5_lost_path
mkdir -p broken_scenarios/scenario6_mixed_issues/deep/nested/path
mkdir -p data/logs data/secrets
mkdir -p clues/level1 clues/level2 clues/level3
mkdir -p .answers

touch broken_scenarios/scenario1_read_failure/secret.txt
touch broken_scenarios/scenario2_script_broken/deploy.sh
touch broken_scenarios/scenario3_cant_write/README.txt
touch broken_scenarios/scenario4_ownership_mess/important.txt
touch broken_scenarios/scenario5_lost_path/.config broken_scenarios/scenario5_lost_path/instructions.txt
touch broken_scenarios/scenario6_mixed_issues/data.txt broken_scenarios/scenario6_mixed_issues/README.md
touch broken_scenarios/scenario6_mixed_issues/run_backup.sh
touch broken_scenarios/scenario6_mixed_issues/deep/nested/path/important.txt
touch data/logs/debug_methodology.txt data/secrets/tips.txt
touch clues/level1/clue1.txt clues/level1/clue2.txt clues/level1/clue3.txt
touch clues/level2/clue1.txt clues/level2/clue2.txt clues/level2/clue3.txt
touch clues/level3/clue1.txt clues/level3/clue2.txt clues/level3/clue3.txt
touch README.md start_here.txt
touch .answers/solutions.txt 2>/dev/null || true

echo -e "  ${GREEN}✓${NC} Directories and files ready"

# --- Break scenarios (deliberate) ---
echo ""
echo -e "${GREEN}[2/3]${NC} Setting up broken scenarios..."

chmod 000 broken_scenarios/scenario1_read_failure/secret.txt 2>/dev/null || true
chmod -x broken_scenarios/scenario2_script_broken/deploy.sh 2>/dev/null || true
chmod 555 broken_scenarios/scenario3_cant_write/ 2>/dev/null || true
chown root:root broken_scenarios/scenario4_ownership_mess/important.txt 2>/dev/null || true
chmod 600 broken_scenarios/scenario4_ownership_mess/important.txt 2>/dev/null || true
chmod 000 broken_scenarios/scenario5_lost_path/.config 2>/dev/null || true

chmod -x broken_scenarios/scenario6_mixed_issues/run_backup.sh 2>/dev/null || true
chmod 600 broken_scenarios/scenario6_mixed_issues/data.txt 2>/dev/null || true
chmod 555 broken_scenarios/scenario6_mixed_issues/ 2>/dev/null || true
chmod 644 broken_scenarios/scenario6_mixed_issues/deep/ 2>/dev/null || true
chmod 644 broken_scenarios/scenario6_mixed_issues/deep/nested/ 2>/dev/null || true
chmod 644 broken_scenarios/scenario6_mixed_issues/deep/nested/path/ 2>/dev/null || true
chmod 000 broken_scenarios/scenario6_mixed_issues/README.md 2>/dev/null || true

echo -e "  ${GREEN}✓${NC} Scenario 1: read removed | 2: execute missing | 3: dir write removed"
echo -e "  ${GREEN}✓${NC} Scenario 4: root ownership | 5: hidden file no access | 6: mixed issues"

# --- Ensure scenario4 root ownership (critical) ---
if [ -f "broken_scenarios/scenario4_ownership_mess/important.txt" ]; then
    chown root:root broken_scenarios/scenario4_ownership_mess/important.txt
    chmod 600 broken_scenarios/scenario4_ownership_mess/important.txt
fi

# --- Clues and docs readable ---
echo ""
echo -e "${GREEN}[3/3]${NC} Setting permissions for clues and docs..."
find clues -type f -name "*.txt" -exec chmod 644 {} \; 2>/dev/null || true
chmod 644 README.md start_here.txt 2>/dev/null || true
chmod 644 data/logs/debug_methodology.txt data/secrets/tips.txt 2>/dev/null || true

echo ""
echo -e "${GREEN}✓${NC} Setup complete. You can now run: cat start_here.txt"
echo ""
