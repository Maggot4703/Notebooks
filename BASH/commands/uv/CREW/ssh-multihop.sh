#!/bin/bash
# ssh-multihop.sh: Multi-hop SSH with agent forwarding
# Usage: ./ssh-multihop.sh

# Variables
JUMP_HOST="user@jumpbox"      # Replace with your jump host (if needed)
TARGET_HOST="me@p48"          # Replace with your target host
TARGET_CMD="hostname"         # Replace with the command you want to run remotely

# Example 1: Direct multi-hop with agent forwarding (one jump)
ssh -A "$JUMP_HOST" ssh -A "$TARGET_HOST" "$TARGET_CMD"

# Example 2: Using ProxyJump (modern OpenSSH, single command)
ssh -A -J "$JUMP_HOST" "$TARGET_HOST" "$TARGET_CMD"

# Example 3: Interactive shell on target via jump
ssh -A -J "$JUMP_HOST" "$TARGET_HOST"

# Notes:
# - Ensure ssh-agent is running and your key is added: eval "$(ssh-agent)" && ssh-add ~/.ssh/id_rsa
# - -A enables agent forwarding.
# - For multiple hops, chain -J: ssh -A -J user@jump1,user@jump2 me@p48
