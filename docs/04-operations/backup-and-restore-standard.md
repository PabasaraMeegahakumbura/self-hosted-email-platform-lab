# Backup and Restore Standard

## Backup requirements

A usable backup policy defines:

- included data/configuration;
- frequency;
- retention;
- storage location;
- encryption;
- access;
- integrity validation;
- restore process;
- RTO/RPO owner.

## 3-2-1 approach

- at least three copies;
- at least two storage systems;
- at least one copy outside the primary server/project boundary.

## Integrity check

For Zstandard archives:

```bash
zstd --test --verbose /absolute/path/to/backup-set/*.tar.zst
```

## Restore acceptance

A restore is not complete until:

- platform starts without critical error;
- administrator login works;
- domains/mailboxes exist;
- sample historical messages are visible;
- user authentication works;
- internal delivery works;
- required configuration/keys exist;
- measured recovery time is recorded.

## Safe test environment

Keep the restored environment isolated from production DNS and prevent accidental external mail transmission.
