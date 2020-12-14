# Useful Admin Functions

Backup config
```tar --exclude /opt/splunk/etc/apps/splunk_archiver -zcvf /home/user/$(hostname)_$(date "+%Y%m%d_%H%M%S").tgz /opt/splunk/etc/```
