#!/usr/bin/env bash
set -uo pipefail

# Run from /opt/mailcow-dockerized or another Mailcow Compose directory.
date --iso-8601=seconds
docker compose config --services
docker compose ps --all
docker stats --no-stream
docker compose logs --since=15m --tail=200

echo "Read-only Compose health check completed."
