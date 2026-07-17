# Mailcow Command Reference

Run Compose commands from the Mailcow project directory.

## Navigation and version

```bash
cd /opt/mailcow-dockerized
pwd
git status
git log -1 --oneline
docker compose version
docker compose config --services
```

## Service health - read-only

```bash
docker compose ps
docker compose ps --all
docker stats --no-stream
docker compose top
docker compose images
```

## Logs - read-only

```bash
docker compose logs --tail=200
docker compose logs --since=30m
docker compose logs --tail=200 postfix-mailcow
docker compose logs --tail=200 dovecot-mailcow
docker compose logs --tail=200 rspamd-mailcow
docker compose logs --tail=200 nginx-mailcow
```

Confirm the service names with `docker compose config --services`.

## Host networking - read-only

```bash
ss -lntup
ip address show
ip route
resolvectl status
curl -Iks https://mail.example.com/
openssl s_client -starttls smtp -connect mail.example.com:587 -servername mail.example.com
openssl s_client -connect mail.example.com:993 -servername mail.example.com
```

## DNS - read-only

```bash
dig +short A mail.example.com
dig +short MX example.com
dig +short TXT example.com
dig +short TXT selector._domainkey.example.com
dig +short TXT _dmarc.example.com
dig -x 203.0.113.10
```

## Host capacity - read-only

```bash
uptime
free -h
df -h
df -i
du -xhd1 /var/lib/docker 2>/dev/null | sort -h
systemctl --failed --no-pager
journalctl -p err --since today --no-pager
```

## Controlled state changes

Only after confirming impact:

```bash
docker compose pull
docker compose up -d
docker compose restart <service>
docker compose stop
docker compose start
```

Do not run `docker compose down -v`, prune commands or manual volume deletion during routine troubleshooting.

## Evidence capture

```bash
date --iso-8601=seconds
docker compose ps
docker stats --no-stream
df -h
```

Redact hostnames, IPs, email addresses, message IDs and tokens before publishing output.
