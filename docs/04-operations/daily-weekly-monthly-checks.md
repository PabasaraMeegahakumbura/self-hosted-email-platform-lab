# Daily, Weekly and Monthly Checks

## Daily

```bash
date --iso-8601=seconds
uptime
free -h
df -h
df -i
systemctl --failed --no-pager
docker ps
```

Also check public availability, failed/restarting containers, queue growth, security alerts and the latest backup.

## Weekly

- review recurring service errors;
- check TLS expiry;
- review login failures;
- review outbound volume, bounces and rejects;
- compare backup size with previous runs;
- verify public DNS;
- review available security/platform updates.

## Monthly

- perform approved updates;
- review storage growth and quotas;
- review administrator/domain-administrator accounts;
- disable inactive users;
- test a backup archive;
- review monitoring thresholds;
- compare cloud cost with budget;
- update runbooks after incidents.

## Quarterly

- perform an isolated restore drill;
- review RTO/RPO;
- review access and recovery contacts;
- test incident escalation;
- review architecture and capacity assumptions.
