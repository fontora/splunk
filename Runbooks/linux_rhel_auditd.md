$ sudo grep log_group /etc/audit/auditd.conf
log_group = splunk

$ sudo service auditd restart
$ sudo chgrp splunk /var/log/audit/audit.log*

$ sudo getfacl -e /var/log/audit/audit.log /var/log/messages
