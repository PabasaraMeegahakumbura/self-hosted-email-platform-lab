# Evidence Guide

Only sanitized evidence should be published.

## Suitable evidence

- cropped `docker compose ps` showing healthy services;
- DNS queries using a lab/example domain;
- redacted webmail send/receive result;
- redacted SPF/DKIM/DMARC header results;
- backup file list with sensitive paths removed;
- Zstandard integrity result;
- architecture diagrams.

## Remove before publishing

- real email addresses;
- passwords/tokens;
- private/public IPs that should remain confidential;
- session cookies;
- DKIM private keys;
- message bodies and IDs;
- customer/domain names;
- backup contents;
- cloud project IDs where disclosure is not intended.

Raw screenshots should remain outside Git. Add only reviewed copies.
