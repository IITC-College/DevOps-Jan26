# Linux Lab – systemd and Services

A hands-on lab for basic reading and management of services with systemctl: status, start, stop, restart.

## How This Lab Works

- **Level 1:** No scripts. You read status of system services (active, inactive, failed) and learn the rule: **status first** before changing anything.
- **Level 2–3:** You use a **user-level** demo service (`lab-demo`). Run the SETUP script before Level 2 clue 1; run CLEANUP when done with Level 2 (or at the end of Level 3). Level 3 uses the same service (SETUP again if you ran CLEANUP).

Example (you are in `clues/level2/`):

```bash
../../scripts/setup_lab_demo.sh    # BEFORE: install and start lab-demo service
cat clue1.txt                       # READ: the clue and do the exercise
# ... do clues 2 and 3 ...
../../scripts/cleanup_lab_demo.sh  # AFTER: stop and remove lab-demo
```

## Direct Entry

This lab has no start_here.txt. Start directly at the first clue:

```bash
cd clues/level1 && cat clue1.txt
```

(After extracting the lab, run `cd linux_lab_systemd_services` first.)

## Prerequisites

- Linux system with systemd (standard on most distributions)
- **User-level systemctl:** `systemctl --user` requires a user session with D-Bus (normal on graphical or SSH login). If `systemctl --user` fails, your instructor may use a system-wide demo service and sudo instead.
- Recommended: complete "Process vs Service" lab first (concepts)

## Duration

45–50 minutes

## Learning Objectives

After this lab you will be able to:

- Use **systemctl status** to read service state (active, inactive, failed) and explain what you see.
- Use **systemctl start** and **systemctl stop** (with a user service) and relate state changes to status output.
- Use **systemctl restart** and know that **"status first"** is the rule before restarting.
- Distinguish **service running** (unit active) vs **process running** (Main PID present).
- Explain when **restart** is a reasonable fix vs when it is not (and that status tells you why).

## Lab Structure

- **Level 1:** systemctl status – read output (active/inactive/failed); rule: status first.
- **Level 2:** start and stop – hands-on with lab-demo (user service); process vs service.
- **Level 3:** restart; when restart helps vs when it doesn’t; "service not working" → read status.

Each clue ends with a **NEXT STEP** pointing to the next clue.

## Tips

Optional hints are in `data/secrets/tips.txt`.

## Version

- **Version:** 1.0  
- **Repository:** https://github.com/IITC-College/DevOps-Jan26
