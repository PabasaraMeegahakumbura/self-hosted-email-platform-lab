# Security Hardening

## Host

- update Ubuntu and Docker through controlled change windows;
- use SSH keys and remove unused accounts;
- restrict SSH and administration paths;
- expose only required ports;
- monitor disk and inodes;
- protect time and DNS configuration;
- keep mail workloads separate from unrelated public services.

## Platform

- replace default credentials;
- use strong unique secrets;
- enable MFA where supported;
- delegate domain administration;
- review privileged accounts regularly;
- restrict external forwarding;
- test against open relay;
- apply rate/abuse controls;
- keep a rollback-capable update process.

## DNS account

- enable MFA;
- use least-privilege access;
- review API tokens;
- protect registrar and DNS recovery methods;
- monitor unauthorized record changes.

## Backups

- use separate permissions;
- encrypt where required;
- keep a copy outside the primary failure boundary;
- restrict restore access;
- verify archives;
- perform restore drills;
- securely remove temporary restored data.

## Public repository checklist

Never commit:

- `.env` files;
- passwords or API tokens;
- private DKIM/TLS/SSH keys;
- raw logs containing user/message data;
- screenshots with real addresses or session data;
- configuration files copied directly from production;
- backup archives.
