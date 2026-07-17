# Monitoring and Alerting

## Minimum checks

| Target | Signal | Alert |
|---|---|---|
| VM | availability | unreachable |
| HTTPS | status/latency/TLS | failed or certificate expiring |
| SMTP | connect/STARTTLS | unavailable or handshake failure |
| IMAP | connect/TLS | unavailable |
| containers | running/healthy/restarts | unhealthy or restart loop |
| CPU/RAM | sustained use/swap | saturation |
| disk/inodes | capacity and growth | warning before exhaustion |
| mail queue | size/age | growth or old messages |
| backup | last success/age/size | stale, failed or abnormal |
| authentication | failures/source | brute force or unusual pattern |
| delivery | rejects/bounces | sudden increase |

## Read-only inputs

```bash
uptime
free -h
df -h
df -i
ss -lntup
docker stats --no-stream
docker compose ps
docker compose logs --since=30m
```

## Alert design

Every alert should specify:

- severity;
- affected service;
- owner;
- expected response;
- first checks;
- escalation route;
- safe remediation boundary;
- closure evidence.

## Suggested severity

- **Critical:** service unavailable, storage almost full, active compromise, backup/recovery unavailable.
- **High:** mail queue growing, certificate near expiry, repeated container failures.
- **Medium:** capacity trend, repeated user authentication failures, single backup failure with earlier good copy.
- **Low:** informational maintenance or non-urgent hygiene item.
