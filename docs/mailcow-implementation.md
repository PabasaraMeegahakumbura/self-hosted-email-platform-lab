# Mailcow Implementation Record

## Objective

Deploy a self-hosted Mailcow environment, configure real mail-domain functions and confirm that the system could exchange messages both internally and with Gmail.

## Host preparation

The platform was installed on an Ubuntu Linux VM with Docker and Docker Compose. Before treating the application as healthy, I checked the host, service state, storage and exposed ports.

Typical validation commands included:

```bash
hostnamectl
cat /etc/os-release
df -h
free -h
docker --version
docker compose version
docker compose ps
```

No production credentials or real host identifiers are included here.

## Deployment

Mailcow was deployed using its Docker Compose project. The generated configuration defined the mail hostname and service options, after which the containers were started and inspected.

```bash
cd /opt/mailcow-dockerized
docker compose pull
docker compose up -d
docker compose ps
```

The stack included services for SMTP, IMAP, webmail/groupware, administration, database, cache, spam filtering, certificate management and supporting functions.

## Administration roles

One useful part of the exercise was understanding the difference between the two administration levels.

### Global administrator

The global administrator controls the platform as a whole. Responsibilities include creating domains, setting platform-level limits, managing domain administrators and reviewing broader configuration.

### Domain administrator

A domain administrator operates only within delegated domains and limits. This role is suitable when a customer or internal team should manage its own mailboxes and aliases without receiving access to the whole mail platform.

Testing these roles helped me understand how delegation should work in a multi-domain service.

## Domain and mailbox configuration

The practical workflow was:

1. Add the mail domain.
2. Confirm domain limits and settings.
3. Generate/publish DKIM information.
4. Create mailboxes and aliases.
5. Sign in as a normal mailbox user.
6. Test internal delivery.
7. Test external inbound and outbound delivery.
8. Review logs and queue behavior if a message was delayed.

## Mail-flow validation

I confirmed:

- mailbox-to-mailbox delivery inside the platform;
- outbound delivery from Mailcow to Gmail;
- inbound delivery from Gmail to Mailcow;
- webmail login and normal mailbox use.

This was more meaningful than relying only on a DNS checker because it exercised the full path: DNS, SMTP, filtering, mailbox delivery and the user interface.

## Service inspection

During troubleshooting and validation, the following views were important:

```bash
docker compose ps
docker compose logs --tail=200 postfix-mailcow
docker compose logs --tail=200 dovecot-mailcow
docker compose logs --tail=200 rspamd-mailcow
docker stats --no-stream
```

Container names can change with the project/version, so the running compose service list should be checked before using a name in automation.

## Backup

The Mailcow backup process generated separate compressed archives for important component groups, including:

- cryptographic/configuration material;
- MariaDB;
- Postfix-related data;
- Redis;
- Rspamd;
- mailbox data and other selected components.

The resulting Zstandard archives were checked using:

```bash
zstd --test --verbose /path/to/backup-set/*.tar.zst
```

The reported files passed the integrity test. This confirms that the archives can be decompressed and are not obviously corrupted.

It does **not** confirm that every account, message and service can be restored correctly. The next recovery task is a full restore on an isolated VM.

## What I would improve before production sign-off

- restrict and document administrative access;
- establish controlled update and rollback windows;
- alert on certificate expiry, disk growth and stale backups;
- monitor SMTP/IMAP/HTTPS and mail-queue conditions;
- perform the isolated restore drill;
- define incident severity and response ownership;
- record RTO/RPO with management;
- review relay, abuse, rate and reputation controls;
- measure actual cloud cost and storage growth.

## Result

The Mailcow implementation reached a strong functional lab state: platform services were operating, administration roles were understood, domains and mailboxes were created, public DNS was configured, Gmail mail flow worked and a component backup set passed archive integrity checks.

I intentionally describe it as a production-style lab rather than a fully production-approved service because restore testing and final operational controls are still pending.
