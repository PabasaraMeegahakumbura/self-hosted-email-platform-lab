# Lessons Learned

1. A mail platform is a chain of DNS, network, TLS, SMTP, filtering, storage, identity and user access.
2. A green container list is not a complete health test.
3. DNS records must be queried externally and matched to the real mail path.
4. Delegated administration is safer than sharing global access.
5. A readable archive is not a tested restore.
6. Simple packaging moves responsibility but does not remove it.
7. Open-source licensing and professional support are separate decisions.
8. Honest status labels make the project more credible.

## Next highest-value task

Perform the isolated Mailcow restore drill, measure the recovery time, confirm the recovery point and update the runbook with every manual dependency found.
