# RPM Scripts

Can inspect the RPM scripts (e.g. pre and post) (https://docs.fedoraproject.org/en-US/packaging-guidelines/Scriptlets/#_syntax)

## Splunk UF

```bash
$ rpm -qp --scripts ./splunkforwarder-9.0.0.1-9e907cedecb1-linux-2.6-x86_64.rpm | less
/usr/sbin/groupadd splunk
/usr/sbin/useradd -c "Splunk Server" -d $SPLUNK_HOME -s /bin/bash -g splunk splunk
chown -R splunk:splunk "$SPLUNK_HOME"
```
