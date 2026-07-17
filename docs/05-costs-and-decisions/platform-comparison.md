# Platform Comparison

| Area | Mailcow | Poste.io | UCS/Nubus | Open-Xchange |
|---|---|---|---|---|
| Lab status | implemented/tested | implemented/tested | configured/evaluated | research/design |
| Character | integrated multi-container mail/groupware | compact all-in-one mail platform | identity/application platform | groupware requiring integration |
| Administration | strong global/domain/mailbox delegation | straightforward domain/mailbox UI | directory and application focus | custom/admin API needed |
| Troubleshooting | detailed component visibility | simpler surface | identity dependencies matter | highest integration effort |
| Best value here | production-style operational learning | simple working comparison | platform/identity learning | architecture assessment |

## Decision

Mailcow provided the strongest complete engineering exercise. Poste.io gave a useful simpler comparison. UCS/Nubus expanded the identity/platform view. Open-Xchange demonstrated why groupware should not be mistaken for a complete hosting control plane.

A real selection must include user count, storage, migration, support, compliance, RTO/RPO, internal skills and budget.
