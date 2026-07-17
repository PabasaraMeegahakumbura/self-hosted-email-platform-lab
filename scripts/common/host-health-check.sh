#!/usr/bin/env bash
set -uo pipefail

# Read-only Linux host health summary.
date --iso-8601=seconds
hostnamectl 2>/dev/null || hostname
uptime
free -h
df -h
df -i
systemctl --failed --no-pager 2>/dev/null || true
ss -lntup
docker ps -a 2>/dev/null || true
docker stats --no-stream 2>/dev/null || true

echo "Review and redact output before sharing."
