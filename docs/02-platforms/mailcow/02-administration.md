# Mailcow Administration

## Role separation

### Global administrator

Use for platform-wide work:

- domains;
- domain administrators;
- global limits and configuration;
- platform review;
- cross-domain incident handling.

### Domain administrator

Use for delegated work within assigned domains:

- mailboxes;
- aliases;
- domain-level limits;
- normal tenant administration.

Do not share the global administrator account when delegation is sufficient.

## Domain onboarding

1. Confirm domain ownership.
2. Define mailbox and storage limits.
3. Add the domain.
4. create a domain administrator if delegation is required.
5. generate/publish DKIM.
6. publish MX, SPF and DMARC.
7. confirm PTR/rDNS.
8. create test mailboxes.
9. test internal and external flow.
10. record the configuration and owner.

## Mailbox lifecycle

### Create

- use a named mailbox;
- apply an appropriate quota;
- require a strong initial password;
- confirm user access;
- complete a send/receive test.

### Modify

- record quota, alias, forwarding or access changes;
- avoid unreviewed external forwarding;
- verify the user still receives expected mail.

### Disable/remove

- confirm authorization;
- preserve required business data;
- disable access before deletion where appropriate;
- remove aliases/forwarding;
- record retention and final deletion.

## Functional test matrix

| Test | Expected result |
|---|---|
| local A to local B | delivered internally |
| local to Gmail | accepted externally |
| Gmail to local | received through public MX |
| reply both ways | normal conversation works |
| webmail login | user accesses correct mailbox |
| attachment | accepted within configured limits |
| header review | SPF/DKIM/DMARC results visible |
