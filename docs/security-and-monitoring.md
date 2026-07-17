# Security and Monitoring Baseline

## Security approach

Email is a high-value target because compromised accounts can be used for fraud, password resets, spam and access to business conversations. Security therefore covers the host, containers, administration, user authentication, DNS, mail policy and backup data.

## Host and network controls

- keep Ubuntu and Docker security updates controlled and current;
- expose only required ports;
- restrict SSH and administration access;
- use SSH keys and remove unused accounts;
- review firewall rules after changes;
- synchronize time correctly;
- monitor disk capacity and inode use;
- protect backup locations with separate credentials and permissions;
- avoid running unrelated public services on the mail host.

## Application controls

- replace default administrator credentials immediately;
- use unique strong secrets;
- enable MFA where the selected platform supports it;
- delegate domain administration rather than sharing global access;
- review aliases, forwards and privileged accounts;
- disable unused mailboxes promptly;
- configure submission/authentication rate controls;
- test that the server is not an open relay;
- maintain a controlled update and rollback process.

## DNS and delivery controls

- publish accurate SPF;
- rotate and protect DKIM keys;
- roll out DMARC using reports before enforcement;
- maintain PTR/rDNS alignment;
- monitor blocklists and delivery failures;
- investigate sudden queue growth or unusual outbound volume;
- protect DNS-provider accounts with MFA and least privilege.

## Monitoring targets

| Area | What to observe | Example alert condition |
|---|---|---|
| Host availability | VM reachability and uptime | Host unreachable |
| HTTPS/webmail | Status, latency and certificate | Failed check or certificate nearing expiry |
| SMTP | Connection and banner/STARTTLS | Port unavailable or handshake failure |
| IMAP | Connection and TLS | Port unavailable or authentication service issue |
| Containers | Running/healthy state and restarts | Unhealthy or restart loop |
| CPU and memory | Sustained load, memory and swap | Sustained saturation |
| Disk | Capacity, inodes and growth | Warning at 70-75%, critical before exhaustion |
| Mail queue | Queue size and oldest message | Growth or long-held messages |
| Backups | Last success, age, size and integrity | Missing/stale/abnormally small backup |
| Authentication | Failed logins and unusual sources | Brute-force pattern |
| Delivery | Bounces, rejects and reputation | Sudden increase |

## Useful read-only checks

```bash
uptime
free -h
df -h
df -i
ss -lntup
docker compose ps
docker stats --no-stream
docker compose logs --since=30m
```

Logs can contain addresses, message identifiers and other sensitive information. Public evidence should be redacted carefully rather than copied directly.

## Alert ownership

An alert without an owner is only a notification. Each production alert should define:

- severity;
- responder;
- response expectation;
- first diagnostic steps;
- escalation path;
- safe remediation boundary;
- communication method;
- closure evidence.

## Update safety

Before a major platform update:

1. read the release notes;
2. confirm version and OS prerequisites;
3. take and verify a fresh backup;
4. check current health and free space;
5. schedule a maintenance window;
6. update using the supported method;
7. validate containers, login, mail flow and logs;
8. record the change and rollback decision point.
