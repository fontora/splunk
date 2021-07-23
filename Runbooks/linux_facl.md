 sudo setfacl -Rm d:u:splunk:rX,u:splunk:rX /var/log

 $ sudo getfacl -e /var/log/audit/audit.log /var/log/messages
