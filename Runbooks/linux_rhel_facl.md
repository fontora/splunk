# RHEL FACL

- Date: 2021.09.27
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, AWS Linux 2

## /var/log

```bash
# Set FACL for existing files recursively and set the default for new files
sudo setfacl -Rm d:u:splunk:rX,u:splunk:rX /var/log

# Verify
sudo getfacl -e /var/log/messages
```
