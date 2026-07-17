# Mailcow Backup and Recovery

## Backup creation

Use the Mailcow-supported backup helper from the project directory and an explicit backup location. Review the current official options before running it.

A typical interactive start is:

```bash
cd /opt/mailcow-dockerized
export MAILCOW_BACKUP_LOCATION=/mnt/mailcow-backups
./helper-scripts/backup_and_restore.sh backup all
```

The resulting set may include archives for cryptographic/configuration data, MariaDB, Postfix, Redis, Rspamd and mailbox data.

## Inspect the backup set

```bash
find /mnt/mailcow-backups -maxdepth 2 -type f -name '*.tar.zst' -printf '%p %s bytes\n'
du -sh /mnt/mailcow-backups/*
```

## Integrity test completed in this lab

```bash
zstd --test --verbose /mnt/mailcow-backups/<backup-set>/*.tar.zst
```

All reported component archives passed the Zstandard test.

## Important boundary

This proves archive readability. It does not prove a complete recovery. A trusted recovery requires an isolated restore followed by functional validation.

## Restore-drill plan

1. Create an isolated VM.
2. Prevent accidental external mail delivery.
3. Install a compatible Mailcow baseline.
4. Copy one known backup set.
5. start a timer.
6. run the official restore workflow.
7. inspect containers and logs.
8. verify administrator login.
9. verify domains and mailboxes.
10. confirm sample historical messages.
11. test internal delivery.
12. record achieved RTO and available recovery point.
13. securely remove the temporary environment.

## Recovery evidence

Record:

- backup timestamp;
- backup component list;
- archive test result;
- restore start/end time;
- missing/manual dependencies;
- login/mailbox checks;
- mail-flow result;
- final RTO/RPO conclusion.
