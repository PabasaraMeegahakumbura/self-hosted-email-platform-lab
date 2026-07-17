# UCS/Nubus Platform Operations

## Baseline host checks

```bash
hostnamectl
cat /etc/os-release
uptime
free -h
df -h
df -i
ip address show
ip route
resolvectl status 2>/dev/null || cat /etc/resolv.conf
systemctl --failed --no-pager
```

On UCS-based systems, use the platform's supported management tools and UI for configuration rather than editing generated configuration files directly.

## Areas to document

- server role and hostname;
- directory/domain identity;
- DNS and time sources;
- administrator ownership;
- installed applications;
- user and group lifecycle;
- certificate ownership;
- persistent data;
- backup boundary;
- update window;
- monitoring and escalation.

## Identity workflow to test

1. create a test user;
2. assign a test group;
3. verify authentication;
4. modify group membership;
5. disable the account;
6. confirm access is removed;
7. document deletion/retention behavior.

## Platform lifecycle

Before updates:

```bash
date --iso-8601=seconds
uptime
df -h
systemctl --failed --no-pager
```

Then verify backup status, review platform/app compatibility and record a rollback plan.

## Future automation work

- user/group lifecycle automation;
- repeatable application configuration;
- health checks for directory, DNS and certificates;
- backup verification;
- integration tests for dependent applications;
- configuration inventory generation.
