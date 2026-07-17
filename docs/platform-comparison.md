# Platform Comparison and Selection Reasoning

## How I compared the platforms

I used practical operating questions rather than comparing marketing pages. The most important areas were administration, deployment effort, mail features, identity integration, backup, troubleshooting, licensing and the amount of engineering required outside the product.

## Summary

| Area | Mailcow | Poste.io | UCS/Nubus | Open-Xchange design |
|---|---|---|---|---|
| Main character | Integrated open-source mail/groupware stack | Compact all-in-one mail platform | Identity and application platform with groupware potential | Groupware/webmail component requiring supporting mail services |
| Deployment style | Docker Compose with multiple visible services | Containerized/all-in-one approach | Platform and app ecosystem | Multi-component custom architecture |
| Hosting administration | Strong global/domain/mailbox controls | Straightforward domain/mailbox controls | Broader directory and identity focus | Requires a separate administration approach |
| Troubleshooting | Good component visibility, but more services | Simpler surface, more functionality concentrated together | Requires understanding of identity and platform layers | Highest integration responsibility |
| Licensing position | Mailcow core under GPLv3; optional commercial support | Product-specific community/commercial terms must be checked | Product/app-specific terms | App Suite and support terms depend on edition/provider |
| Best fit in this lab | Main production-style implementation | Practical simpler comparison | Identity/platform learning | Feasibility research only |

## Mailcow

### What worked well

- Clear separation between global administration and domain administration.
- Strong integrated set of mail and groupware services.
- Docker services can be inspected independently.
- DNS guidance and generated DKIM material support deployment.
- Built-in backup tooling covers the main component groups.
- Good platform for learning real mail-service dependencies.

### Trade-offs

- There are many containers and moving parts.
- Updates need a controlled backup and maintenance process.
- Resource sizing must include antivirus, filtering, indexing, database and webmail.
- A single-node deployment still has a single-host availability boundary.
- Open-source licensing does not provide an operational SLA by itself.

## Poste.io

### What worked well

- Quick route to domains, mailboxes and webmail.
- Easier initial mental model for a small environment.
- DNS and delivery testing can be completed without assembling many separate services.
- Useful comparison for teams that value simplicity.

### Trade-offs

- All-in-one packaging can hide component-level detail.
- Community and paid-feature boundaries must be checked against the current product version.
- Backup, scaling and support expectations need to be verified before production adoption.
- Simplicity at installation time does not remove deliverability or recovery responsibilities.

## UCS/Nubus

### What stood out

- The platform encourages thinking beyond mailboxes toward identity, directory services and managed applications.
- It is useful for learning how internal platforms connect authentication, users, groups and services.
- It may fit organizations that want a broader identity/application foundation.

### Trade-offs

- It is a wider platform decision, not merely a mail-server replacement.
- Operational ownership includes identity and application lifecycle concerns.
- The learning and maintenance scope can be larger than a focused mail solution.

## Open-Xchange

The main discovery was that OX App Suite should not be treated as a complete cPanel- or Poste.io-style mail-hosting control plane. A self-hosted design would still need:

- SMTP transport;
- IMAP/mail storage;
- database services;
- spam filtering and DKIM;
- TLS and reverse proxying;
- user/domain provisioning;
- backup and monitoring;
- an administration/API layer.

That architecture can be valid, but it creates significantly more integration and support work. I documented it as research rather than presenting an unbuilt POC as completed work.

## Decision

For this lab, **Mailcow provided the strongest overall learning and production-style operating experience**. Poste.io was valuable as a simpler working comparison. UCS/Nubus added identity and platform-engineering depth. Open-Xchange demonstrated why architecture assessment must distinguish a user-facing groupware product from a complete mail-hosting platform.

The final choice for a real organization would still depend on:

- number of users and domains;
- storage growth;
- support expectations;
- compliance and retention;
- acceptable RTO/RPO;
- internal engineering capacity;
- migration complexity;
- budget for infrastructure and commercial assistance.
