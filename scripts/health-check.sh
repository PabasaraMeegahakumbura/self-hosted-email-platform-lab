#!/usr/bin/env bash
set -uo pipefail

# Read-only host and Docker Compose health summary.
# Run from the directory containing compose.yaml/docker-compose.yml.
# This script does not restart, update or delete anything.

echo "== Timestamp =="
date --iso-8601=seconds

echo
echo "== Host =="
hostnamectl 2>/dev/null || hostname
uptime

echo
echo "== Memory =="
free -h

echo
echo "== Filesystems =="
df -h
df -i

echo
echo "== Failed systemd units =="
systemctl --failed --no-pager 2>/dev/null || true

echo
echo "== Docker Compose services =="
docker compose ps

echo
echo "== Container resource snapshot =="
docker stats --no-stream

echo
echo "Health summary completed. Review output before sharing because hostnames and service data may be sensitive."
