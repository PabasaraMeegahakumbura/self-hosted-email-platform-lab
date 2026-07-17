# Project Overview

## Problem

A business email platform must do more than display an inbox. It must accept and deliver mail reliably, protect users and domains, provide clear administration, support troubleshooting and recover from failure.

This project compared several self-hosted approaches by using practical operational questions rather than feature lists.

## Goals

- deploy and test working self-hosted mail platforms;
- understand global and delegated administration;
- configure domains and mailboxes;
- validate internal and external mail flow;
- work with MX, SPF, DKIM, DMARC, TLS and PTR/rDNS;
- inspect services, logs and queues;
- create and validate backups;
- design monitoring, security and recovery controls;
- compare licences, infrastructure cost and support responsibility.

## Scope status

| Item | Status |
|---|---|
| Mailcow platform | Completed functional lab |
| Poste.io platform | Completed functional lab |
| UCS/Nubus | Configuration and evaluation |
| Open-Xchange | Research and proposed POC |
| Archive integrity | Completed |
| Isolated restore | Pending |
| Full production SLA | Outside current lab scope |

## Accuracy boundary

The repository does not claim automatic high availability, a completed disaster-recovery test or an Open-Xchange deployment. These are identified as future engineering work.

## Success criteria used

- required services running;
- administrator access working;
- domain and mailbox creation working;
- local delivery working;
- Gmail inbound/outbound delivery working;
- DNS authentication records resolving;
- backup archives created and readable;
- remaining operational risks documented.
