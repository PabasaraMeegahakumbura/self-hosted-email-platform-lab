# Incident Response

## 1. Record

- start time and timezone;
- reporter;
- affected users/domains;
- services affected;
- recent changes;
- business impact.

## 2. Classify

- one user, one domain or platform-wide;
- inbound, outbound or both;
- webmail, SMTP, IMAP or administration;
- availability, security, data or deliverability incident.

## 3. Run read-only checks

```bash
date --iso-8601=seconds
uptime
free -h
df -h
df -i
systemctl --failed --no-pager
ss -lntup
docker ps -a
docker stats --no-stream
```

Then use the relevant platform troubleshooting guide.

## 4. Contain

For compromise or abuse, protect evidence, restrict affected accounts/traffic and prevent continued harm. Do not destroy logs or wipe the host before the incident owner approves the plan.

## 5. Recover

Choose repair or restore based on data integrity, expected repair time, RTO and availability of a known good recovery point.

## 6. Validate

- services healthy;
- user login works;
- internal mail works;
- inbound/outbound mail works;
- queues are clearing;
- monitoring is normal;
- no new security alerts.

## 7. Close

Document root cause, timeline, actions, impact, prevention work, owner and due dates.
