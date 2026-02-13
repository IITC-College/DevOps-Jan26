#!/usr/bin/env bash
# Build tar.gz archives for all Python labs (for GitHub release).
# Run from repo root: ./Python/build_release.sh
# Creates Python/python_lab_NN_name.tar.gz for each lab.

set -e
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT/Python"

LABS=(
  01_print_basics 02_literals 03_operators 04_variables 05_comments
  06_shortcuts 07_type_casting 08_input 09_string_methods 10_comparison_operators
  11_conditions 12_conditions_intermediate 13_while_loops 14_for_loops 15_break_continue
  16_logical_operators 17_combined_real_world 18_lists 19_lists_methods 20_lists_variables_copies
  21_in_notin_combined 22_lists_2d_3d 23_lists_intermediate 24_functions_basics 25_parameters
  26_return 27_list_as_argument 28_scopes
)

for lab in "${LABS[@]}"; do
  if [ -d "$lab" ]; then
    arc="python_lab_${lab}.tar.gz"
    tar -czf "$arc" -C . "$lab"
    echo "Created $arc"
  fi
done

echo "Done. Upload with: gh release create v1.0-python-labs Python/python_lab_*.tar.gz --title 'Python Labs v1.0' --notes '...'"
