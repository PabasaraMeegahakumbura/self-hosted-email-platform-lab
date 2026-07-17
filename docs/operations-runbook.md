# Operations Runbook

## Daily checks

- confirm host and public service availability;
- check for failed or restarting containers;
- inspect disk and inode usage;
- review mail-queue growth;
- confirm the latest backup completed;
- investigate security or delivery alerts.

```bash
uptime
df -h
df -i
free -h
docker compose ps
docker stats --no-stream
```

## Weekly checks

- review operating-system and platform updates;
- review recent container logs for repeating errors;
- check TLS expiry;
- examine unusual login activity;
- review outbound volume, bounces and rejects;
- confirm backup size/trend;
- verify DNS records still match the intended architecture.

## Monthly checks

- perform a controlled platform update if approved;
- review mailbox/storage growth;
- review administrator and domain-administrator accounts;
- confirm inactive users are disabled;
- test a backup archive;
- review monitoring thresholds and false alerts;
- compare cloud costs with budget;
- update the runbook after incidents or architecture changes.

## Incident triage

### 1. Confirm scope

- one user, one domain or all users?
- webmail only, or SMTP/IMAP as well?
- inbound, outbound or both?
- internal mail working?
- recent deployment, DNS, firewall or certificate change?

### 2. Check the host

```bash
uptime
free -h
df -h
systemctl --failed
docker compose ps
```

### 3. Check services and logs

```bash
docker compose logs --since=30m
docker stats --no-stream
```

Use service-specific logs after identifying the affected path. Avoid publishing raw logs because they may contain personal data.

### 4. Check the mail path

- DNS resolution;
- TCP connectivity;
- TLS handshake;
- SMTP response;
- authentication;
- queue state;
- filtering/rejection reason;
- Dovecot/mailbox delivery;
- webmail/IMAP access.

### 5. Communicate

Record:

- start time;
- impact;
- affected services/users;
- actions taken;
- current workaround;
- next update time;
- final cause and prevention action.

## Common scenarios

### Web UI unavailable

Check VM reachability, disk, container state, reverse proxy/TLS service and recent updates.

### Gmail cannot deliver inbound

Check MX, A/AAAA, public SMTP reachability, TLS, filtering decisions and recipient existence.

### Outbound mail delayed

Check queue size, DNS resolution, remote SMTP responses, PTR/rDNS, reputation, rate limits and authentication abuse.

### User cannot log in

Confirm the correct interface, mailbox status, password/reset state, domain status, client protocol/port and authentication logs.

### Backup job failed

Check target mount, free space, permissions, process output, archive size and whether a partial set was left behind. Do not delete the last known good backup while troubleshooting.

## Escalation evidence

Provide sanitized:

- timestamp and timezone;
- affected service/domain scope;
- relevant error text;
- platform version;
- recent change;
- health and capacity summary;
- steps already tried;
- whether a safe backup exists.

## Recovery decision

Move from repair to restore when:

- data integrity is uncertain;
- required state is missing/corrupted;
- repair time is likely to exceed the agreed RTO;
- a known good recovery point exists;
- the incident owner approves the recovery plan.

The production runbook should name the person authorized to make this decision.
