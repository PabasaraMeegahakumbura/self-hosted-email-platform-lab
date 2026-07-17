# Mailcow Troubleshooting

## First rule

Start with read-only checks. Do not restart the whole stack until the failing path is identified.

## Baseline triage

```bash
cd /opt/mailcow-dockerized
date --iso-8601=seconds
uptime
free -h
df -h
df -i
systemctl --failed --no-pager
docker compose ps
docker stats --no-stream
docker compose logs --since=30m
```

## Web interface unavailable

Check:

```bash
docker compose ps
docker compose logs --tail=200 nginx-mailcow
ss -lntup
curl -Iks https://mail.example.com/
openssl s_client -connect mail.example.com:443 -servername mail.example.com
```

Look for disk exhaustion, certificate failure, port conflict, reverse-proxy errors or unhealthy dependencies.

## Incoming mail missing

```bash
dig +short MX example.com
dig +short A mail.example.com
ss -lntup
docker compose logs --tail=200 postfix-mailcow
docker compose logs --tail=200 rspamd-mailcow
docker compose logs --tail=200 dovecot-mailcow
```

Confirm the recipient exists, MX points correctly, TCP/25 is reachable, filtering did not reject the message and mailbox delivery completed.

## Outbound mail delayed

Check Postfix logs/queue through the supported container context. First identify the Postfix container:

```bash
docker compose ps
docker compose logs --tail=300 postfix-mailcow
dig -x 203.0.113.10
dig +short TXT example.com
```

Investigate remote rejection text, PTR/rDNS, SPF/DKIM alignment, reputation, rate limits, authentication abuse and DNS resolution.

## User cannot authenticate

- confirm the correct mailbox address;
- confirm the mailbox/domain is active;
- verify the selected protocol and TLS port;
- inspect Dovecot/SOGo logs;
- check time synchronization;
- reset credentials only with authorization.

```bash
docker compose logs --since=30m dovecot-mailcow
docker compose logs --since=30m sogo-mailcow
timedatectl
```

## Container unhealthy or restarting

```bash
docker compose ps --all
docker inspect <container-name>
docker compose logs --tail=300 <service-name>
docker stats --no-stream
df -h
```

Identify the dependency or resource failure before restarting one service.

## Disk filling

```bash
df -h
df -i
du -xhd1 /var/lib/docker 2>/dev/null | sort -h
docker system df
```

Do not run automated prune or delete mail volumes. Find the source, protect a backup and use a reviewed cleanup/expansion plan.

## Backup failure

Check target mount, permissions, free space, partial files and process output:

```bash
mount | grep /mnt/mailcow-backups
df -h /mnt/mailcow-backups
find /mnt/mailcow-backups -maxdepth 2 -type f -printf '%TY-%Tm-%Td %TH:%TM %s %p\n' | sort
```

Never delete the last known good backup while investigating a new failed set.
