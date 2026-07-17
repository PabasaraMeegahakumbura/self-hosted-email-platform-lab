# DNS and Deliverability

## Sanitized record pattern

```dns
mail.example.com. 300 IN A 203.0.113.10
example.com. 300 IN MX 10 mail.example.com.
example.com. 300 IN TXT "v=spf1 mx -all"
selector._domainkey.example.com. 300 IN TXT "v=DKIM1; k=rsa; p=PUBLIC_KEY"
_dmarc.example.com. 300 IN TXT "v=DMARC1; p=none; rua=mailto:dmarc@example.com"
```

The address is from TEST-NET and is not a real server.

## Rules

- MX targets a hostname, not an IP.
- Mail host records are normally DNS-only in Cloudflare.
- SPF must include every legitimate sender.
- Publish only the DKIM public key.
- Start DMARC with reporting, then enforce after alignment review.
- Configure PTR/rDNS through the IP provider.
- Forward and reverse DNS should agree.

## Linux checks

```bash
dig +short A mail.example.com
dig +short MX example.com
dig +short TXT example.com
dig +short TXT selector._domainkey.example.com
dig +short TXT _dmarc.example.com
dig -x 203.0.113.10
```

## PowerShell checks

```powershell
Resolve-DnsName mail.example.com -Type A
Resolve-DnsName example.com -Type MX
Resolve-DnsName example.com -Type TXT
Resolve-DnsName selector._domainkey.example.com -Type TXT
Resolve-DnsName _dmarc.example.com -Type TXT
```

## Protocol checks

```bash
openssl s_client -starttls smtp -connect mail.example.com:25 -servername mail.example.com
openssl s_client -starttls smtp -connect mail.example.com:587 -servername mail.example.com
openssl s_client -connect mail.example.com:993 -servername mail.example.com
curl -Iks https://mail.example.com/
```

## Test matrix

| Path | What it proves |
|---|---|
| local to local | internal routing and mailbox delivery |
| local to Gmail | outbound SMTP, signing and acceptance |
| Gmail to local | public MX, inbound filtering and delivery |
| reply both ways | normal conversation path |
| header review | recipient-side SPF/DKIM/DMARC result |

DNS correctness does not guarantee inbox placement. Reputation, complaints, bounces, content, abuse and remote policy also matter.
