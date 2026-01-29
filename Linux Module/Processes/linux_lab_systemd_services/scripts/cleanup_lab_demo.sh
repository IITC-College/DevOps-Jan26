#!/bin/bash
# Stop and remove user-level lab-demo service.
USER_UNIT_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"
UNIT_FILE="$USER_UNIT_DIR/lab-demo.service"

systemctl --user stop lab-demo 2>/dev/null || true
rm -f "$UNIT_FILE"
systemctl --user daemon-reload 2>/dev/null || true
echo "Lab demo service removed."
