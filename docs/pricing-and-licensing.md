# Pricing and Licensing Notes

## Important distinction

Mailcow does not require a separate per-mailbox “Pro edition” licence. Mailcow's own code is released under GNU GPL version 3. Professional support or a fully managed service is a commercial service, not an unlock for a different core Mailcow edition.

This means the software licence can be free while the service still has real recurring costs.

## Cost categories

- cloud compute;
- persistent disk;
- snapshots and backup storage;
- public IP and network egress;
- domain and DNS services;
- monitoring;
- administration and user support;
- migration;
- security response;
- recovery testing;
- commercial vendor support where required.

## Reference planning model

For a small/medium production-style deployment, a planning configuration may use approximately:

- 4 vCPU;
- 16 GB RAM;
- 200 GB expandable persistent storage;
- daily application-aware backup;
- external monitoring;
- a 15-20% budget contingency.

Actual cost must be checked against the chosen cloud region, machine family, storage type, traffic and retention.

## Service models

| Model | What is included | Main risk |
|---|---|---|
| Self-managed/community | Infrastructure and open-source software | Internal team owns every update, incident and restore |
| Professionally managed | Infrastructure plus routine administration, monitoring and backup checks | Support boundaries must be written clearly |
| Business/DR-ready | Stronger retention, recovery testing, priority response and DR design | Higher cost and more process overhead |

## Pricing rules I would use

- state the supported mailbox count;
- state provisioned storage and backup retention;
- define included administration hours;
- define support hours and response targets;
- bill migration separately;
- pass through or cap cloud overages;
- do not advertise “unlimited” storage or support;
- review price after measured usage;
- separate infrastructure cost from engineering/service value.

## Licence due diligence

Before purchasing or reselling any platform/service, confirm:

- exact product/edition;
- production-use rights;
- support entitlement;
- update period;
- user/domain/storage limits;
- redistribution obligations;
- third-party component licences;
- termination and data-export conditions.

## Honest budgeting conclusion

Open source can reduce licence cost and improve control. It does not make email operations free. Reliable service depends on skilled maintenance, monitoring, backups, recovery tests and clear accountability. Those costs should be visible rather than hidden inside a low per-mailbox number.
