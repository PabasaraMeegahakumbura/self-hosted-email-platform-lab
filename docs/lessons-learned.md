# Lessons Learned

## 1. A mail server is a system, not a single application

The user sees an inbox, but the operator sees DNS, SMTP, IMAP, TLS, filtering, databases, cache, storage, identity, networking and reputation. Troubleshooting improved once I followed the complete message path instead of checking only the web interface.

## 2. Administration design matters

The difference between global and domain administration is important for multi-domain hosting. Delegation reduces risk only when limits and responsibilities are clearly understood.

## 3. DNS is part of the deployment

MX, SPF, DKIM, DMARC and PTR/rDNS affect whether the service can participate reliably on the public internet. Publishing a record is not enough; it must be queried externally and checked against the actual sending path.

## 4. “Running” is not the same as healthy

A green container list does not prove user authentication, delivery, storage safety or recovery. Functional tests and operational checks are required.

## 5. Backup integrity is only one checkpoint

The Zstandard tests were valuable because they detected archive-level corruption. The remaining truth test is a full isolated restore.

## 6. Simplicity moves responsibility; it does not remove it

Poste.io provides a simpler initial experience. Mailcow exposes more components. Open-Xchange would require more integration. In every case someone still owns security, updates, DNS, monitoring and recovery.

## 7. Open source and professional support are different decisions

A zero software licence fee does not provide a service-level agreement. Management needs to decide whether internal capability is sufficient or commercial support/managed operations are justified.

## 8. Honest scope strengthens a portfolio

This repository distinguishes completed implementation, evaluation, research and planned work. That is more credible than presenting a proposed architecture as a finished production system.

## Next engineering work

The highest-value next task is the isolated Mailcow restore drill. After that, I would implement monitoring and alerts, conduct a controlled update/rollback exercise, and then capture sanitized evidence for the final portfolio page.
