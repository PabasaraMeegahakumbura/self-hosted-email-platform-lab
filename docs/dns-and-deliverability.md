# DNS, Authentication and Deliverability

## Why this work matters

A mail server can be running perfectly and still fail as a service if its DNS and sender identity are wrong. I treated DNS validation as part of the application, not a separate registrar task.

## Required records

### Mail host address

```dns
mail.example.com. 300 IN A 203.0.113.10
```

The address above is from the documentation-only TEST-NET range.

When Cloudflare hosts the zone, the mail-host record is normally set to **DNS only**. Standard Cloudflare web proxying does not proxy SMTP or IMAP.

### MX

```dns
example.com. 300 IN MX 10 mail.example.com.
```

The MX target should be a hostname, not an IP address.

### SPF

```dns
example.com. 300 IN TXT "v=spf1 mx -all"
```

The final policy must reflect every legitimate sender. A strict `-all` should not be used until all required services have been identified.

### DKIM

```dns
selector._domainkey.example.com. 300 IN TXT "v=DKIM1; k=rsa; p=PUBLIC_KEY_MATERIAL"
```

Only the public key is published. Private DKIM keys must never be placed in GitHub, tickets or screenshots.

### DMARC

A safe rollout can begin with monitoring:

```dns
_dmarc.example.com. 300 IN TXT "v=DMARC1; p=none; rua=mailto:dmarc@example.com"
```

After reports are reviewed and legitimate sources align, the policy can be moved toward quarantine or reject.

### PTR/rDNS

The sending public IP should normally reverse-resolve to the mail hostname, and that hostname should resolve forward to the same IP. PTR configuration is usually performed by the cloud or hosting provider, not inside Cloudflare DNS.

## Validation commands

Linux:

```bash
dig +short MX example.com
dig +short TXT example.com
dig +short TXT selector._domainkey.example.com
dig +short A mail.example.com
dig -x 203.0.113.10
```

PowerShell:

```powershell
Resolve-DnsName example.com -Type MX
Resolve-DnsName example.com -Type TXT
Resolve-DnsName selector._domainkey.example.com -Type TXT
Resolve-DnsName mail.example.com -Type A
```

TLS and SMTP visibility:

```bash
openssl s_client -connect mail.example.com:465 -servername mail.example.com
openssl s_client -starttls smtp -connect mail.example.com:587 -servername mail.example.com
```

## Delivery test matrix

| Test | Purpose |
|---|---|
| Local user A to local user B | Validates internal routing and mailbox delivery |
| Local user to Gmail | Validates outbound routing, authentication and remote acceptance |
| Gmail to local user | Validates MX, inbound SMTP, filtering and mailbox delivery |
| Reply in both directions | Confirms the normal conversation path |
| Attachment test | Checks realistic message handling and limits |
| Header review | Confirms SPF, DKIM and DMARC results seen by the recipient |

## Deliverability lessons

Passing SPF, DKIM and DMARC is necessary, but it is not a guarantee that a message will reach the inbox. Reputation also depends on:

- IP and domain history;
- PTR/rDNS;
- complaint and bounce rates;
- sending patterns;
- compromised-account prevention;
- message content;
- remote-provider policy;
- blocklists and throttling.

A production operator therefore needs mail-queue monitoring, abuse detection and a documented response process, not only correct DNS records.
