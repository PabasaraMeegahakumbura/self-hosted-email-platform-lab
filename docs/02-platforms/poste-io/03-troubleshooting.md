# Poste.io Troubleshooting

## Initial triage

```bash
date --iso-8601=seconds
uptime
free -h
df -h
docker ps -a --filter name=poste
docker stats poste --no-stream
docker logs --since=30m poste
ss -lntup
```

## UI unavailable

- confirm container state;
- check ports 80/443;
- inspect certificate and container logs;
- check disk capacity;
- check whether another web service owns the ports.

## Incoming mail failure

```bash
dig +short MX example.com
dig +short A mail.example.com
openssl s_client -starttls smtp -connect mail.example.com:25 -servername mail.example.com
docker logs --tail=300 poste
```

Check recipient existence, firewall/provider restrictions, filtering and DNS propagation.

## Outbound rejection

Review the exact remote response. Check:

```bash
dig -x 203.0.113.10
dig +short TXT example.com
dig +short TXT selector._domainkey.example.com
dig +short TXT _dmarc.example.com
```

Then investigate PTR/rDNS, SPF/DKIM/DMARC alignment, IP reputation, account compromise and rate limits.

## Authentication failure

Confirm the mailbox is active, the client uses the correct hostname/port/TLS mode and the server time is correct. Review logs without publishing user addresses or message content.

## Data-volume risk

```bash
docker inspect poste --format '{{json .Mounts}}'
df -h
du -xhd1 /opt/poste/data 2>/dev/null | sort -h
```

Do not remove the data directory or container volume during diagnosis.
