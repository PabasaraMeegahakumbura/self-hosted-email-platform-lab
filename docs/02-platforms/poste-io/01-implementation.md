# Poste.io Implementation

## Host prerequisites

Before deployment, verify:

```bash
hostnamectl
cat /etc/os-release
free -h
df -h
ss -lntup
docker --version
```

Confirm a static public IP, valid mail hostname, forward DNS, PTR/rDNS control and required firewall access.

## Container deployment pattern

The exact image tag, ports and volume path must be checked against the current Poste.io documentation. A sanitized pattern is:

```bash
sudo mkdir -p /opt/poste/data
sudo chmod 700 /opt/poste/data

docker run -d \
  --name poste \
  --restart unless-stopped \
  -p 25:25 \
  -p 80:80 \
  -p 443:443 \
  -p 465:465 \
  -p 587:587 \
  -p 993:993 \
  -v /opt/poste/data:/data \
  analogic/poste.io
```

This is a reference pattern, not a command to copy blindly. Check port requirements, IPv6, antispam/antivirus options and the current supported image before use.

## Completed configuration flow

1. Access the administration UI.
2. set the mail hostname.
3. add the mail domain.
4. create mailbox users.
5. publish MX and SPF.
6. publish the DKIM record shown by the platform.
7. add DMARC monitoring policy.
8. confirm PTR/rDNS.
9. log in to webmail.
10. test external inbound/outbound delivery.
11. review message headers and delivery status.

## Validation

```bash
docker ps --filter name=poste
docker logs --tail=200 poste
curl -Iks https://mail.example.com/
```

```powershell
Resolve-DnsName example.com -Type MX
Resolve-DnsName example.com -Type TXT
Resolve-DnsName selector._domainkey.example.com -Type TXT
```

## Production gaps to close

- confirm edition/licensing requirements;
- document supported backup and restore;
- alert on service, certificate, storage and backup health;
- define update/rollback process;
- test recovery;
- define support ownership and escalation.
