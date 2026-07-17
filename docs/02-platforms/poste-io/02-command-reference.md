# Poste.io Command Reference

## Container state

```bash
docker ps --filter name=poste
docker inspect poste
docker stats poste --no-stream
docker logs --tail=200 poste
docker logs --since=30m poste
```

## Host and ports

```bash
uptime
free -h
df -h
df -i
ss -lntup
systemctl --failed --no-pager
```

## TLS and protocols

```bash
openssl s_client -connect mail.example.com:443 -servername mail.example.com
openssl s_client -starttls smtp -connect mail.example.com:587 -servername mail.example.com
openssl s_client -connect mail.example.com:993 -servername mail.example.com
```

## Controlled lifecycle

```bash
docker stop poste
docker start poste
docker restart poste
```

Do not delete/recreate the container until the persistent `/data` mapping and backup status have been verified.

## Image/update review

```bash
docker inspect poste --format '{{.Config.Image}}'
docker image ls
docker logs --tail=100 poste
```

Follow the current vendor-supported update procedure rather than automatically pulling `latest` in production.
