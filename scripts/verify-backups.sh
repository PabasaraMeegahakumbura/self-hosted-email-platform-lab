#!/usr/bin/env bash
set -euo pipefail

# Validates every .tar.zst archive in one explicit backup directory.
# It does not extract, modify or delete archives.

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /absolute/path/to/backup-set" >&2
  exit 2
fi

backup_dir="$1"

if [[ "$backup_dir" != /* ]]; then
  echo "Error: provide an absolute backup directory." >&2
  exit 2
fi

if [[ ! -d "$backup_dir" ]]; then
  echo "Error: directory does not exist: $backup_dir" >&2
  exit 1
fi

shopt -s nullglob
archives=("$backup_dir"/*.tar.zst)

if (( ${#archives[@]} == 0 )); then
  echo "Error: no .tar.zst archives found in $backup_dir" >&2
  exit 1
fi

echo "Testing ${#archives[@]} backup archive(s) in: $backup_dir"
zstd --test --verbose "${archives[@]}"
echo "Archive integrity test completed successfully."
echo "Reminder: an archive test does not replace an isolated restore drill."
