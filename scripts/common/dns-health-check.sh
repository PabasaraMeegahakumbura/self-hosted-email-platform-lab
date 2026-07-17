#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 example.com mail.example.com selector" >&2
  exit 2
fi

domain="$1"
mail_host="$2"
selector="$3"

echo "A: $mail_host"
dig +short A "$mail_host"
echo "MX: $domain"
dig +short MX "$domain"
echo "SPF/TXT: $domain"
dig +short TXT "$domain"
echo "DKIM: $selector._domainkey.$domain"
dig +short TXT "$selector._domainkey.$domain"
echo "DMARC: _dmarc.$domain"
dig +short TXT "_dmarc.$domain"
