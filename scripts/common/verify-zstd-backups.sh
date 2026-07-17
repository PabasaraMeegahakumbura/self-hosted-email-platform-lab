#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /absolute/path/to/backup-set" >&2
  exit 2
fi

backup_dir="$1"
[[ "$backup_dir" == /* ]] || { echo "Use an absolute path." >&2; exit 2; }
[[ -d "$backup_dir" ]] || { echo "Directory not found." >&2; exit 1; }

shopt -s nullglob
archives=("$backup_dir"/*.tar.zst)
(( ${#archives[@]} > 0 )) || { echo "No .tar.zst files found." >&2; exit 1; }

zstd --test --verbose "${archives[@]}"
echo "Integrity check passed. A full restore drill is still required."
