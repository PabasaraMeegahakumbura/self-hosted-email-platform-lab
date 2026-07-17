# Mailcow

## Status

**Implemented and functionally tested.**

Completed areas:

- Docker Compose deployment;
- administrator and domain-administrator workflows;
- domain and mailbox creation;
- webmail access;
- internal delivery;
- Gmail inbound and outbound delivery;
- public DNS authentication records;
- component backup generation;
- Zstandard archive integrity validation.

## Guide map

1. [Installation](01-installation.md)
2. [Administration](02-administration.md)
3. [Command reference](03-command-reference.md)
4. [Backup and recovery](04-backup-and-recovery.md)
5. [Troubleshooting](05-troubleshooting.md)

## Main components

| Component | Purpose |
|---|---|
| Postfix | SMTP transport and queue |
| Dovecot | IMAP and mailbox delivery |
| SOGo | Webmail/groupware |
| Rspamd | Spam policy and message analysis |
| MariaDB | Platform configuration/state |
| Redis | Cache and temporary state |
| ACME service | Certificate automation |
| Nginx | Web/reverse-proxy layer |

Component names can vary by release. Always use `docker compose ps` before referencing a service in automation.
