# UCS/Nubus Troubleshooting

## Identity-first triage

When an application login fails, determine whether the problem is:

- one user or all users;
- one application or the whole platform;
- authentication, authorization or application availability;
- DNS/time/certificate related;
- caused by a recent user/group or application change.

## Read-only checks

```bash
date
timedatectl
hostname --fqdn
getent hosts "$(hostname --fqdn)"
systemctl --failed --no-pager
journalctl -p err --since today --no-pager
df -h
free -h
ss -lntup
```

## DNS/time symptoms

Directory and authentication systems are sensitive to correct DNS and time. Check resolution in both directions and confirm the configured time source.

## Application unavailable

- check host capacity;
- check the application's service/container status;
- review platform and application logs;
- verify dependent identity/DNS/database services;
- check certificates;
- identify the last change.

## User-specific failure

- verify account status;
- verify group/role membership;
- compare with a working test user;
- confirm the change has propagated;
- avoid resetting unrelated platform services.

## Escalation evidence

Provide sanitized timestamps, affected identities/applications, error text, recent changes, platform version and the read-only checks already completed.
