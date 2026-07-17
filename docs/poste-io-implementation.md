# Poste.io Implementation Record

## Objective

Deploy and test Poste.io as a simpler self-hosted email-platform option, then compare its administration and operational model with Mailcow.

## Work completed

The lab covered:

- access to the administration interface;
- domain creation;
- mailbox creation;
- user webmail access;
- MX and SPF publication;
- DKIM record publication and lookup;
- inbound and outbound external delivery checks;
- basic service and certificate observations.

## DNS validation

The configured domain was queried externally to confirm that public resolvers could see the required records.

Sanitized PowerShell examples:

```powershell
Resolve-DnsName example.com -Type MX
Resolve-DnsName example.com -Type TXT
Resolve-DnsName selector._domainkey.example.com -Type TXT
```

Expected outcomes:

- the MX record points to the intended mail hostname;
- the SPF TXT record authorizes the correct sending path;
- the DKIM selector returns the public verification key;
- the mail hostname resolves to the intended public IP;
- PTR/rDNS is aligned through the server or cloud provider.

## Mail-flow checks

I tested normal user access and external message flow. The important validation was not only whether the administration panel showed a green state, but whether:

1. a mailbox user could sign in;
2. the mailbox could send to an external provider;
3. an external provider could send back;
4. DNS results matched the actual service;
5. delivery failures could be traced through logs or platform status.

## What Poste.io demonstrated

Poste.io provides a compact path to a working domain and mailbox service. It is easier to understand initially because more functionality is presented as one integrated product.

The trade-off is that teams must still investigate:

- community versus paid features;
- support and update commitments;
- backup format and restoration;
- storage growth and quotas;
- log depth and troubleshooting;
- migration tooling;
- reputation and abuse controls.

## Result

The Poste.io exercise produced a working comparison point for Mailcow. It showed that a simpler interface can reduce setup effort, but it does not remove the surrounding DevOps responsibilities: secure hosting, correct DNS, backups, monitoring, recovery and accountable operations.
