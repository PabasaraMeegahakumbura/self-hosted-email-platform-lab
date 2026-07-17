# Backup and Recovery

## Backup goal

The backup process must protect enough state to rebuild the platform after data corruption, configuration damage or loss of the primary VM.

For Mailcow, the component backup included compressed archives for areas such as:

- configuration and cryptographic material;
- MariaDB;
- Postfix-related data;
- Redis;
- Rspamd;
- mailbox data and other selected components.

## Integrity validation completed

The generated files used the `.tar.zst` format. I tested the entire set with Zstandard:

```bash
zstd --test --verbose /mnt/mailcow-backups/<backup-set>/*.tar.zst
```

The reported archives passed the test. This provides evidence that Zstandard can read and decompress the files without detecting archive corruption.

## What this does not prove

An archive test does not confirm:

- that every required component was selected;
- that the files are from the intended point in time;
- that database and mailbox state are logically consistent;
- that encryption/secrets are usable;
- that accounts and messages restore correctly;
- that DNS, IP and TLS dependencies are documented;
- that the service meets its required recovery time.

For that reason, the recovery status is recorded as **integrity-checked but not yet fully restore-tested**.

## Recommended backup pattern

A practical production plan should follow a 3-2-1 style approach:

- maintain at least three copies of important data;
- store them on at least two different media/storage systems;
- keep at least one copy outside the primary server/project/failure boundary.

Example layers:

1. application-aware Mailcow backup;
2. cloud disk snapshot or machine-level recovery point;
3. separate-project or separate-provider backup copy.

A snapshot is useful but should not replace application-aware backups.

## Planned restore drill

### Preparation

1. Create an isolated test VM with no live production mail routing.
2. Match the supported OS, Docker and Mailcow requirements.
3. Copy one known backup set to the test environment.
4. record the backup timestamp and start the recovery timer.
5. block or redirect outbound mail to prevent accidental external delivery.

### Restore

1. Install the supported Mailcow version/workflow.
2. run the official restore process for the selected backup set;
3. review restore output for missing components or errors;
4. start the containers;
5. verify database, cache, configuration and mail storage;
6. keep the environment isolated from production DNS.

### Functional validation

- administrator login;
- domain and mailbox presence;
- sample historical message visibility;
- mailbox authentication;
- internal delivery between test accounts;
- webmail and IMAP access;
- queue and container health;
- DKIM/configuration presence;
- logs free from critical restore errors.

### Close-out

- record the achieved recovery time;
- compare it with the target RTO;
- confirm the available recovery point against the RPO;
- document every manual dependency;
- destroy or securely clean the temporary restored environment after evidence is captured.

## Suggested retention example

The actual policy must be approved by the business. A starting example is:

- daily backups retained for 7-14 days;
- weekly backups retained for 4-8 weeks;
- monthly recovery points retained according to legal/business need;
- periodic immutable or protected copy;
- quarterly restore exercise.

Retention should not be extended blindly because cost, privacy, deletion obligations and breach exposure also grow with stored data.
