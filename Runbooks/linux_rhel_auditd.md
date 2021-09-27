# RHEL auditd

- Date: 2021.09.27
- OS: RHEL 7 & 8, CentOS 7 & 8, Rocky 8, AWS Linux 2

## /var/log

```bash
# Set splunk as the group
sudo sed -i 's/^log_group = root/log_group = splunk/' /etc/audit/auditd.conf

# Restart auditd 
sudo service auditd restart

# Change any existing files
sudo chgrp splunk /var/log/audit/audit.log*

# Verify
sudo getfacl -e /var/log/audit/audit.log
```
